# App Security (PIN Lock + Privacy Masking) Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add optional PIN lock with biometrics and global amount masking to the Rhydle app.

**Architecture:** Router-level lock via GoRouter redirect + CurrencyFormatter-level masking via a static flag. Two new Riverpod providers (`appLockProvider`, `privacyProvider`) manage state. A shared lifecycle observer handles background timeout for both features. `SecurePinService` wraps `flutter_secure_storage` + `local_auth`.

**Tech Stack:** Flutter, Riverpod, GoRouter, flutter_secure_storage, local_auth, SharedPreferences, Iconsax

**Spec:** `docs/superpowers/specs/2026-04-09-app-security-design.md`

---

## File Structure

### New Files

```
lib/features/security/
  screens/
    security_settings_screen.dart    # Dedicated Settings → Security page
    pin_lock_screen.dart             # Full-screen lock with PIN pad
    pin_setup_screen.dart            # Create / confirm new PIN
    pin_recovery_screen.dart         # Enter account password to reset PIN
  providers/
    app_lock_provider.dart           # AppLockNotifier + AppLockState
    privacy_provider.dart            # PrivacyNotifier + PrivacyState
  services/
    secure_pin_service.dart          # PIN CRUD + biometric auth
    security_preferences_service.dart # SharedPreferences keys for security flags
  widgets/
    pin_keypad.dart                  # 4-digit PIN pad with biometric button
    security_setup_prompt.dart       # Onboarding step: "Secure your account"
    security_reminder_banner.dart    # Dashboard one-time banner
```

### Modified Files

```
pubspec.yaml                                          # Add flutter_secure_storage + local_auth
lib/routing/routes.dart                               # Add security route constants
lib/routing/app_router.dart                           # Add lock redirect + security routes + eye icon in shell
lib/core/utils/currency_formatter.dart                # Add static masking flag
lib/features/settings/screens/settings_screen.dart    # Add "Security" navigation row
lib/features/dashboard/screens/dashboard_screen.dart  # Add reminder banner
lib/l10n/app_en.arb                                   # English security strings
lib/l10n/app_fr.arb                                   # French security strings
```

### Test Files

```
test/security/secure_pin_service_test.dart
test/security/privacy_masking_test.dart
test/security/app_lock_provider_test.dart
test/security/security_preferences_test.dart
```

---

## Task 1: Add Dependencies

**Files:**
- Modify: `bride_app/pubspec.yaml`

- [ ] **Step 1: Add flutter_secure_storage and local_auth to pubspec.yaml**

Open `bride_app/pubspec.yaml` and add under `dependencies` (after `shared_preferences: ^2.5.3`):

```yaml
  flutter_secure_storage: ^9.2.4
  local_auth: ^2.3.0
```

- [ ] **Step 2: Run flutter pub get**

```bash
cd "/Users/MAC/Documents/test mobile app/bride_app" && flutter pub get
```

Expected: Dependencies resolve successfully, no version conflicts.

- [ ] **Step 3: Commit**

```bash
git add pubspec.yaml pubspec.lock
git commit -m "chore: add flutter_secure_storage and local_auth dependencies"
```

---

## Task 2: Security Preferences Service

Manages all SharedPreferences keys for security feature flags (onboarding seen, reminder dismissed, mask-on-launch, require-auth-to-reveal).

**Files:**
- Create: `bride_app/lib/features/security/services/security_preferences_service.dart`
- Create: `bride_app/test/security/security_preferences_test.dart`

- [ ] **Step 1: Write the tests**

Create `bride_app/test/security/security_preferences_test.dart`:

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rhydle/features/security/services/security_preferences_service.dart';

void main() {
  group('SecurityPreferencesService', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    test('hasSeenOnboardingSecurity defaults to false', () async {
      expect(await SecurityPreferencesService.hasSeenOnboardingSecurity(), false);
    });

    test('markOnboardingSecuritySeen sets flag to true', () async {
      await SecurityPreferencesService.markOnboardingSecuritySeen();
      expect(await SecurityPreferencesService.hasSeenOnboardingSecurity(), true);
    });

    test('hasDismissedSecurityReminder defaults to false', () async {
      expect(await SecurityPreferencesService.hasDismissedSecurityReminder(), false);
    });

    test('dismissSecurityReminder sets flag to true', () async {
      await SecurityPreferencesService.dismissSecurityReminder();
      expect(await SecurityPreferencesService.hasDismissedSecurityReminder(), true);
    });

    test('maskOnLaunch defaults to false', () async {
      expect(await SecurityPreferencesService.getMaskOnLaunch(), false);
    });

    test('setMaskOnLaunch persists value', () async {
      await SecurityPreferencesService.setMaskOnLaunch(true);
      expect(await SecurityPreferencesService.getMaskOnLaunch(), true);
    });

    test('requireAuthToReveal defaults to false', () async {
      expect(await SecurityPreferencesService.getRequireAuthToReveal(), false);
    });

    test('setRequireAuthToReveal persists value', () async {
      await SecurityPreferencesService.setRequireAuthToReveal(true);
      expect(await SecurityPreferencesService.getRequireAuthToReveal(), true);
    });

    test('isMasked defaults to false', () async {
      expect(await SecurityPreferencesService.getIsMasked(), false);
    });

    test('setIsMasked persists value', () async {
      await SecurityPreferencesService.setIsMasked(true);
      expect(await SecurityPreferencesService.getIsMasked(), true);
    });

    test('biometricsEnabled defaults to false', () async {
      expect(await SecurityPreferencesService.getBiometricsEnabled(), false);
    });

    test('setBiometricsEnabled persists value', () async {
      await SecurityPreferencesService.setBiometricsEnabled(true);
      expect(await SecurityPreferencesService.getBiometricsEnabled(), true);
    });

    test('clearAll removes all security keys', () async {
      await SecurityPreferencesService.markOnboardingSecuritySeen();
      await SecurityPreferencesService.dismissSecurityReminder();
      await SecurityPreferencesService.setMaskOnLaunch(true);
      await SecurityPreferencesService.clearAll();

      expect(await SecurityPreferencesService.hasSeenOnboardingSecurity(), false);
      expect(await SecurityPreferencesService.hasDismissedSecurityReminder(), false);
      expect(await SecurityPreferencesService.getMaskOnLaunch(), false);
    });
  });
}
```

- [ ] **Step 2: Run tests to verify they fail**

```bash
cd "/Users/MAC/Documents/test mobile app/bride_app" && flutter test test/security/security_preferences_test.dart
```

Expected: FAIL — `SecurityPreferencesService` not found.

- [ ] **Step 3: Implement SecurityPreferencesService**

Create `bride_app/lib/features/security/services/security_preferences_service.dart`:

```dart
import 'package:shared_preferences/shared_preferences.dart';

/// Manages SharedPreferences keys for security features.
///
/// Non-sensitive flags only — PINs go in flutter_secure_storage via [SecurePinService].
class SecurityPreferencesService {
  SecurityPreferencesService._();

  static const String _hasSeenOnboardingSecurityKey = 'has_seen_onboarding_security';
  static const String _hasDismissedSecurityReminderKey = 'has_dismissed_security_reminder';
  static const String _maskOnLaunchKey = 'security_mask_on_launch';
  static const String _requireAuthToRevealKey = 'security_require_auth_to_reveal';
  static const String _isMaskedKey = 'security_is_masked';
  static const String _biometricsEnabledKey = 'security_biometrics_enabled';

  // --- Onboarding ---

  static Future<bool> hasSeenOnboardingSecurity() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_hasSeenOnboardingSecurityKey) ?? false;
  }

  static Future<void> markOnboardingSecuritySeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hasSeenOnboardingSecurityKey, true);
  }

  // --- Reminder ---

  static Future<bool> hasDismissedSecurityReminder() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_hasDismissedSecurityReminderKey) ?? false;
  }

  static Future<void> dismissSecurityReminder() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hasDismissedSecurityReminderKey, true);
  }

  // --- Privacy masking ---

  static Future<bool> getMaskOnLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_maskOnLaunchKey) ?? false;
  }

  static Future<void> setMaskOnLaunch(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_maskOnLaunchKey, value);
  }

  static Future<bool> getRequireAuthToReveal() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_requireAuthToRevealKey) ?? false;
  }

  static Future<void> setRequireAuthToReveal(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_requireAuthToRevealKey, value);
  }

  static Future<bool> getIsMasked() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isMaskedKey) ?? false;
  }

  static Future<void> setIsMasked(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isMaskedKey, value);
  }

  // --- Biometrics ---

  static Future<bool> getBiometricsEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_biometricsEnabledKey) ?? false;
  }

  static Future<void> setBiometricsEnabled(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_biometricsEnabledKey, value);
  }

  // --- Cleanup ---

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await Future.wait([
      prefs.remove(_hasSeenOnboardingSecurityKey),
      prefs.remove(_hasDismissedSecurityReminderKey),
      prefs.remove(_maskOnLaunchKey),
      prefs.remove(_requireAuthToRevealKey),
      prefs.remove(_isMaskedKey),
      prefs.remove(_biometricsEnabledKey),
    ]);
  }
}
```

- [ ] **Step 4: Run tests to verify they pass**

```bash
cd "/Users/MAC/Documents/test mobile app/bride_app" && flutter test test/security/security_preferences_test.dart
```

Expected: All 12 tests PASS.

- [ ] **Step 5: Commit**

```bash
git add lib/features/security/services/security_preferences_service.dart test/security/security_preferences_test.dart
git commit -m "feat(security): add SecurityPreferencesService for security feature flags"
```

---

## Task 3: SecurePinService

Handles encrypted PIN storage via `flutter_secure_storage` and biometric auth via `local_auth`.

**Files:**
- Create: `bride_app/lib/features/security/services/secure_pin_service.dart`
- Create: `bride_app/test/security/secure_pin_service_test.dart`

- [ ] **Step 1: Write the tests**

Create `bride_app/test/security/secure_pin_service_test.dart`:

```dart
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rhydle/features/security/services/secure_pin_service.dart';

void main() {
  group('SecurePinService - hashing', () {
    test('hashPin produces consistent SHA-256 hash', () {
      final hash1 = SecurePinService.hashPin('1234');
      final hash2 = SecurePinService.hashPin('1234');
      expect(hash1, equals(hash2));
    });

    test('hashPin produces different hashes for different PINs', () {
      final hash1 = SecurePinService.hashPin('1234');
      final hash2 = SecurePinService.hashPin('5678');
      expect(hash1, isNot(equals(hash2)));
    });

    test('hashPin produces valid SHA-256 hex string', () {
      final hash = SecurePinService.hashPin('1234');
      // SHA-256 produces 64 hex chars
      expect(hash.length, 64);
      expect(RegExp(r'^[0-9a-f]{64}$').hasMatch(hash), true);
    });

    test('hashPin matches manual SHA-256', () {
      const pin = '1234';
      final expected = sha256.convert(utf8.encode(pin)).toString();
      expect(SecurePinService.hashPin(pin), expected);
    });
  });
}
```

Note: `flutter_secure_storage` and `local_auth` require platform channels that are not available in unit tests. We test the hashing logic (pure Dart) here. Integration tests for storage and biometric are done via manual testing on device.

- [ ] **Step 2: Run tests to verify they fail**

```bash
cd "/Users/MAC/Documents/test mobile app/bride_app" && flutter test test/security/secure_pin_service_test.dart
```

Expected: FAIL — `SecurePinService` not found.

- [ ] **Step 3: Implement SecurePinService**

Create `bride_app/lib/features/security/services/secure_pin_service.dart`:

```dart
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';

/// Manages PIN storage (encrypted) and biometric authentication.
///
/// PIN is hashed with SHA-256 before storing in flutter_secure_storage.
/// Biometric auth delegates to the OS via local_auth.
class SecurePinService {
  static const _pinKey = 'rhydle_pin_hash';
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
  static final _localAuth = LocalAuthentication();

  /// Hash a 4-digit PIN with SHA-256.
  static String hashPin(String pin) {
    return sha256.convert(utf8.encode(pin)).toString();
  }

  /// Store a new PIN (hashed).
  static Future<void> setPin(String pin) async {
    final hash = hashPin(pin);
    await _storage.write(key: _pinKey, value: hash);
  }

  /// Verify a PIN against the stored hash.
  /// Returns `true` if the PIN matches, `false` otherwise.
  static Future<bool> verifyPin(String pin) async {
    final storedHash = await _storage.read(key: _pinKey);
    if (storedHash == null) return false;
    return hashPin(pin) == storedHash;
  }

  /// Check if a PIN has been set.
  static Future<bool> hasPinSet() async {
    final storedHash = await _storage.read(key: _pinKey);
    return storedHash != null;
  }

  /// Remove the stored PIN.
  static Future<void> clearPin() async {
    await _storage.delete(key: _pinKey);
  }

  /// Check if biometric authentication is available on this device.
  static Future<bool> isBiometricAvailable() async {
    try {
      final canCheck = await _localAuth.canCheckBiometrics;
      final isSupported = await _localAuth.isDeviceSupported();
      return canCheck && isSupported;
    } on PlatformException {
      return false;
    }
  }

  /// Get available biometric types (fingerprint, face, iris).
  static Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _localAuth.getAvailableBiometrics();
    } on PlatformException {
      return [];
    }
  }

  /// Trigger biometric authentication.
  /// Returns `true` if user authenticated successfully.
  static Future<bool> authenticateBiometric({
    String reason = 'Authenticate to unlock Rhydle',
  }) async {
    try {
      return await _localAuth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } on PlatformException {
      return false;
    }
  }
}
```

- [ ] **Step 4: Run tests to verify they pass**

```bash
cd "/Users/MAC/Documents/test mobile app/bride_app" && flutter test test/security/secure_pin_service_test.dart
```

Expected: All 4 tests PASS.

- [ ] **Step 5: Commit**

```bash
git add lib/features/security/services/secure_pin_service.dart test/security/secure_pin_service_test.dart
git commit -m "feat(security): add SecurePinService for encrypted PIN storage and biometric auth"
```

---

## Task 4: AppLockProvider

Manages lock state: whether the app is locked, whether a PIN exists, and background timeout detection.

**Files:**
- Create: `bride_app/lib/features/security/providers/app_lock_provider.dart`
- Create: `bride_app/test/security/app_lock_provider_test.dart`

- [ ] **Step 1: Write the tests**

Create `bride_app/test/security/app_lock_provider_test.dart`:

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:rhydle/features/security/providers/app_lock_provider.dart';

void main() {
  group('AppLockState', () {
    test('default state is unlocked with no PIN', () {
      const state = AppLockState();
      expect(state.isLocked, false);
      expect(state.hasPIN, false);
      expect(state.biometricsEnabled, false);
      expect(state.biometricsAvailable, false);
      expect(state.failedAttempts, 0);
    });

    test('copyWith creates new state with updated fields', () {
      const state = AppLockState();
      final updated = state.copyWith(isLocked: true, hasPIN: true);
      expect(updated.isLocked, true);
      expect(updated.hasPIN, true);
      expect(updated.biometricsEnabled, false);
    });

    test('copyWith preserves unchanged fields', () {
      const state = AppLockState(isLocked: true, hasPIN: true, biometricsEnabled: true);
      final updated = state.copyWith(failedAttempts: 3);
      expect(updated.isLocked, true);
      expect(updated.hasPIN, true);
      expect(updated.biometricsEnabled, true);
      expect(updated.failedAttempts, 3);
    });

    test('shouldLock returns true when PIN is set', () {
      const state = AppLockState(hasPIN: true);
      expect(state.shouldLock, true);
    });

    test('shouldLock returns false when no PIN', () {
      const state = AppLockState();
      expect(state.shouldLock, false);
    });
  });
}
```

- [ ] **Step 2: Run tests to verify they fail**

```bash
cd "/Users/MAC/Documents/test mobile app/bride_app" && flutter test test/security/app_lock_provider_test.dart
```

Expected: FAIL — `AppLockState` not found.

- [ ] **Step 3: Implement AppLockProvider**

Create `bride_app/lib/features/security/providers/app_lock_provider.dart`:

```dart
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/secure_pin_service.dart';
import '../services/security_preferences_service.dart';

/// State for the app lock feature.
class AppLockState {
  final bool isLocked;
  final bool hasPIN;
  final bool biometricsEnabled;
  final bool biometricsAvailable;
  final int failedAttempts;

  const AppLockState({
    this.isLocked = false,
    this.hasPIN = false,
    this.biometricsEnabled = false,
    this.biometricsAvailable = false,
    this.failedAttempts = 0,
  });

  /// Whether the lock screen should appear (PIN exists).
  bool get shouldLock => hasPIN;

  AppLockState copyWith({
    bool? isLocked,
    bool? hasPIN,
    bool? biometricsEnabled,
    bool? biometricsAvailable,
    int? failedAttempts,
  }) {
    return AppLockState(
      isLocked: isLocked ?? this.isLocked,
      hasPIN: hasPIN ?? this.hasPIN,
      biometricsEnabled: biometricsEnabled ?? this.biometricsEnabled,
      biometricsAvailable: biometricsAvailable ?? this.biometricsAvailable,
      failedAttempts: failedAttempts ?? this.failedAttempts,
    );
  }
}

/// Manages app lock state — whether the app is locked, PIN exists, etc.
///
/// Call [initialize] at app startup to load persisted state.
/// Call [onAppResumed] when the app returns from background.
class AppLockNotifier extends StateNotifier<AppLockState> with WidgetsBindingObserver {
  DateTime? _pausedAt;

  /// Duration the app can be in background before re-locking.
  static const backgroundTimeout = Duration(seconds: 30);

  AppLockNotifier() : super(const AppLockState()) {
    WidgetsBinding.instance.addObserver(this);
    initialize();
  }

  /// Load persisted state: does PIN exist? Biometrics available/enabled?
  Future<void> initialize() async {
    final hasPIN = await SecurePinService.hasPinSet();
    final biometricsAvailable = await SecurePinService.isBiometricAvailable();
    final biometricsEnabled = await SecurityPreferencesService.getBiometricsEnabled();

    state = state.copyWith(
      hasPIN: hasPIN,
      isLocked: hasPIN, // Lock on startup if PIN exists
      biometricsAvailable: biometricsAvailable,
      biometricsEnabled: hasPIN && biometricsEnabled && biometricsAvailable,
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState lifecycleState) {
    if (lifecycleState == AppLifecycleState.paused) {
      _pausedAt = DateTime.now();
    } else if (lifecycleState == AppLifecycleState.resumed) {
      _onAppResumed();
    }
  }

  void _onAppResumed() {
    if (_pausedAt == null || !state.hasPIN) return;
    final elapsed = DateTime.now().difference(_pausedAt!);
    if (elapsed > backgroundTimeout) {
      state = state.copyWith(isLocked: true, failedAttempts: 0);
    }
    _pausedAt = null;
  }

  /// Called after successful PIN or biometric verification.
  void unlock() {
    state = state.copyWith(isLocked: false, failedAttempts: 0);
  }

  /// Called after a failed PIN attempt.
  void recordFailedAttempt() {
    state = state.copyWith(failedAttempts: state.failedAttempts + 1);
  }

  /// Called after PIN is created.
  Future<void> onPinCreated() async {
    state = state.copyWith(hasPIN: true, isLocked: false);
  }

  /// Called after PIN is removed (app lock disabled).
  Future<void> onPinCleared() async {
    state = state.copyWith(hasPIN: false, isLocked: false, biometricsEnabled: false);
    await SecurityPreferencesService.setBiometricsEnabled(false);
  }

  /// Toggle biometrics on/off.
  Future<void> setBiometricsEnabled(bool enabled) async {
    await SecurityPreferencesService.setBiometricsEnabled(enabled);
    state = state.copyWith(biometricsEnabled: enabled && state.biometricsAvailable);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

final appLockProvider = StateNotifierProvider<AppLockNotifier, AppLockState>(
  (ref) => AppLockNotifier(),
);
```

- [ ] **Step 4: Run tests to verify they pass**

```bash
cd "/Users/MAC/Documents/test mobile app/bride_app" && flutter test test/security/app_lock_provider_test.dart
```

Expected: All 5 tests PASS.

- [ ] **Step 5: Commit**

```bash
git add lib/features/security/providers/app_lock_provider.dart test/security/app_lock_provider_test.dart
git commit -m "feat(security): add AppLockProvider for lock state management"
```

---

## Task 5: PrivacyProvider

Manages amount masking state: masked/unmasked, session verification, and the CurrencyFormatter static flag.

**Files:**
- Create: `bride_app/lib/features/security/providers/privacy_provider.dart`
- Create: `bride_app/test/security/privacy_masking_test.dart`

- [ ] **Step 1: Write the tests**

Create `bride_app/test/security/privacy_masking_test.dart`:

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:rhydle/features/security/providers/privacy_provider.dart';

void main() {
  group('PrivacyState', () {
    test('default state is unmasked and unverified', () {
      const state = PrivacyState();
      expect(state.isMasked, false);
      expect(state.isSessionVerified, false);
      expect(state.maskOnLaunch, false);
      expect(state.requireAuthToReveal, false);
    });

    test('copyWith creates new state with updated fields', () {
      const state = PrivacyState();
      final updated = state.copyWith(isMasked: true, isSessionVerified: true);
      expect(updated.isMasked, true);
      expect(updated.isSessionVerified, true);
    });

    test('needsAuthToUnmask is true when requireAuth is on and not verified', () {
      const state = PrivacyState(
        isMasked: true,
        requireAuthToReveal: true,
        isSessionVerified: false,
      );
      expect(state.needsAuthToUnmask, true);
    });

    test('needsAuthToUnmask is false when already verified', () {
      const state = PrivacyState(
        isMasked: true,
        requireAuthToReveal: true,
        isSessionVerified: true,
      );
      expect(state.needsAuthToUnmask, false);
    });

    test('needsAuthToUnmask is false when requireAuth is off', () {
      const state = PrivacyState(
        isMasked: true,
        requireAuthToReveal: false,
        isSessionVerified: false,
      );
      expect(state.needsAuthToUnmask, false);
    });
  });
}
```

- [ ] **Step 2: Run tests to verify they fail**

```bash
cd "/Users/MAC/Documents/test mobile app/bride_app" && flutter test test/security/privacy_masking_test.dart
```

Expected: FAIL — `PrivacyState` not found.

- [ ] **Step 3: Implement PrivacyProvider**

Create `bride_app/lib/features/security/providers/privacy_provider.dart`:

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/currency_formatter.dart';
import '../services/security_preferences_service.dart';

/// State for privacy masking.
class PrivacyState {
  final bool isMasked;
  final bool isSessionVerified;
  final bool maskOnLaunch;
  final bool requireAuthToReveal;

  const PrivacyState({
    this.isMasked = false,
    this.isSessionVerified = false,
    this.maskOnLaunch = false,
    this.requireAuthToReveal = false,
  });

  /// Whether the user needs to authenticate to unmask amounts.
  bool get needsAuthToUnmask => requireAuthToReveal && !isSessionVerified;

  PrivacyState copyWith({
    bool? isMasked,
    bool? isSessionVerified,
    bool? maskOnLaunch,
    bool? requireAuthToReveal,
  }) {
    return PrivacyState(
      isMasked: isMasked ?? this.isMasked,
      isSessionVerified: isSessionVerified ?? this.isSessionVerified,
      maskOnLaunch: maskOnLaunch ?? this.maskOnLaunch,
      requireAuthToReveal: requireAuthToReveal ?? this.requireAuthToReveal,
    );
  }
}

/// Manages privacy masking state.
///
/// Call [initialize] at app startup to load persisted preferences.
/// The [CurrencyFormatter.isMasked] static flag is kept in sync automatically.
class PrivacyNotifier extends StateNotifier<PrivacyState> {
  PrivacyNotifier() : super(const PrivacyState()) {
    initialize();
  }

  /// Load persisted preferences and apply initial masking state.
  Future<void> initialize() async {
    final maskOnLaunch = await SecurityPreferencesService.getMaskOnLaunch();
    final requireAuth = await SecurityPreferencesService.getRequireAuthToReveal();
    final wasMasked = await SecurityPreferencesService.getIsMasked();

    // On launch: mask if maskOnLaunch is enabled, or if user left it masked last time
    final shouldMask = maskOnLaunch || wasMasked;

    state = state.copyWith(
      isMasked: shouldMask,
      maskOnLaunch: maskOnLaunch,
      requireAuthToReveal: requireAuth,
      isSessionVerified: false,
    );
    CurrencyFormatter.isMasked = shouldMask;
  }

  /// Toggle masking on (hide amounts). Always immediate, no auth.
  void mask() {
    state = state.copyWith(isMasked: true);
    CurrencyFormatter.isMasked = true;
    SecurityPreferencesService.setIsMasked(true);
  }

  /// Unmask amounts. Caller must verify auth first if [needsAuthToUnmask].
  void unmask() {
    state = state.copyWith(isMasked: false, isSessionVerified: true);
    CurrencyFormatter.isMasked = false;
    SecurityPreferencesService.setIsMasked(false);
  }

  /// Reset session verification (called when app backgrounds >30s).
  void resetSession() {
    state = state.copyWith(isSessionVerified: false);
    if (state.maskOnLaunch) {
      state = state.copyWith(isMasked: true);
      CurrencyFormatter.isMasked = true;
      SecurityPreferencesService.setIsMasked(true);
    }
  }

  /// Update "mask on launch" preference.
  Future<void> setMaskOnLaunch(bool value) async {
    await SecurityPreferencesService.setMaskOnLaunch(value);
    state = state.copyWith(maskOnLaunch: value);
  }

  /// Update "require auth to reveal" preference.
  Future<void> setRequireAuthToReveal(bool value) async {
    await SecurityPreferencesService.setRequireAuthToReveal(value);
    state = state.copyWith(requireAuthToReveal: value);
  }
}

final privacyProvider = StateNotifierProvider<PrivacyNotifier, PrivacyState>(
  (ref) => PrivacyNotifier(),
);
```

- [ ] **Step 4: Run tests to verify they pass**

```bash
cd "/Users/MAC/Documents/test mobile app/bride_app" && flutter test test/security/privacy_masking_test.dart
```

Expected: All 5 tests PASS.

- [ ] **Step 5: Commit**

```bash
git add lib/features/security/providers/privacy_provider.dart test/security/privacy_masking_test.dart
git commit -m "feat(security): add PrivacyProvider for amount masking state"
```

---

## Task 6: CurrencyFormatter Masking

Add a static `isMasked` flag to `CurrencyFormatter`. When `true`, `format()` and `formatCompact()` return `****`. This approach requires zero changes to the 30+ existing call sites.

**Files:**
- Modify: `bride_app/lib/core/utils/currency_formatter.dart`
- Modify: `bride_app/test/widget_test.dart` (add masking tests)

- [ ] **Step 1: Add masking tests to existing test file**

Add these tests to `bride_app/test/widget_test.dart` inside `group('CurrencyFormatter', () {`:

```dart
    test('format returns **** when isMasked is true', () {
      CurrencyFormatter.isMasked = true;
      final result = CurrencyFormatter.format(5000, currencyCode: 'USD');
      expect(result, '****');
      CurrencyFormatter.isMasked = false; // reset
    });

    test('formatCompact returns **** when isMasked is true', () {
      CurrencyFormatter.isMasked = true;
      final result = CurrencyFormatter.formatCompact(5000, currencyCode: 'USD');
      expect(result, '****');
      CurrencyFormatter.isMasked = false; // reset
    });

    test('format returns normal value when isMasked is false', () {
      CurrencyFormatter.isMasked = false;
      final result = CurrencyFormatter.format(5000, currencyCode: 'USD');
      expect(result, contains('50'));
    });
```

- [ ] **Step 2: Run tests to verify the new ones fail**

```bash
cd "/Users/MAC/Documents/test mobile app/bride_app" && flutter test test/widget_test.dart
```

Expected: New masking tests FAIL — `isMasked` not defined on CurrencyFormatter.

- [ ] **Step 3: Add the static flag and early return to CurrencyFormatter**

In `bride_app/lib/core/utils/currency_formatter.dart`, add inside `class CurrencyFormatter`:

At the top of the class (after `CurrencyFormatter._();` if it exists, or as the first member):

```dart
  /// When `true`, [format] and [formatCompact] return `****` instead of the actual amount.
  /// Controlled by [PrivacyNotifier] — do not set directly from UI code.
  static bool isMasked = false;

  static const String _maskedValue = '****';
```

At the very beginning of `static String format(...)` method body, add:

```dart
    if (isMasked) return _maskedValue;
```

At the very beginning of `static String formatCompact(...)` method body, add:

```dart
    if (isMasked) return _maskedValue;
```

- [ ] **Step 4: Run all tests to verify they pass**

```bash
cd "/Users/MAC/Documents/test mobile app/bride_app" && flutter test test/widget_test.dart
```

Expected: All tests PASS (original + new masking tests).

- [ ] **Step 5: Commit**

```bash
git add lib/core/utils/currency_formatter.dart test/widget_test.dart
git commit -m "feat(security): add static masking flag to CurrencyFormatter"
```

---

## Task 7: Localization Strings

Add all English and French strings for the security features.

**Files:**
- Modify: `bride_app/lib/l10n/app_en.arb`
- Modify: `bride_app/lib/l10n/app_fr.arb`

- [ ] **Step 1: Add English strings to app_en.arb**

Add the following keys to `bride_app/lib/l10n/app_en.arb` (before the closing `}`):

```json
  "security": "Security",
  "securitySubtitle": "PIN, biometrics & privacy",

  "appLockSectionTitle": "APP LOCK",
  "appLock": "App Lock",
  "appLockSubtitle": "Require PIN to open the app",
  "useBiometrics": "Use Biometrics",
  "useBiometricsSubtitle": "Unlock with fingerprint or Face ID",
  "changePin": "Change PIN",
  "changePinSubtitle": "Update your 4-digit PIN",

  "privacySectionTitle": "PRIVACY",
  "hideAmountsOnLaunch": "Hide Amounts on Launch",
  "hideAmountsOnLaunchSubtitle": "Start with amounts masked every time",
  "requireAuthToReveal": "Require Auth to Reveal",
  "requireAuthToRevealSubtitle": "PIN or biometrics to unmask amounts",
  "privacyTip": "Use the eye icon in the app bar to quickly toggle amount visibility.",

  "enterPin": "Enter PIN",
  "enterPinSubtitle": "Enter your 4-digit PIN to unlock",
  "forgotPin": "Forgot PIN?",
  "tooManyAttempts": "Too many attempts. Try again in {seconds} seconds.",
  "@tooManyAttempts": {
    "placeholders": {
      "seconds": { "type": "int" }
    }
  },
  "wrongPin": "Wrong PIN. Try again.",

  "createPin": "Create PIN",
  "createPinSubtitle": "Choose a 4-digit PIN to secure your app",
  "confirmPin": "Confirm PIN",
  "confirmPinSubtitle": "Enter your PIN again to confirm",
  "pinsDontMatch": "PINs don't match. Please try again.",
  "pinCreatedSuccess": "PIN created successfully!",
  "pinChangedSuccess": "PIN changed successfully!",
  "pinRemovedSuccess": "App lock disabled.",

  "enterCurrentPin": "Enter Current PIN",
  "enterCurrentPinSubtitle": "Verify your current PIN first",

  "resetPin": "Reset PIN",
  "resetPinSubtitle": "Enter your account password to reset your PIN",
  "resetPinPasswordLabel": "Account Password",
  "resetPinPasswordHint": "Enter your Rhydle password",
  "resetPinSuccess": "PIN reset. Set up a new PIN.",
  "resetPinError": "Incorrect password. Please try again.",

  "secureYourAccount": "Secure your account",
  "secureYourAccountBody": "Protect your financial data with a 4-digit PIN.",
  "setupPin": "Set up PIN",
  "skipForNow": "Skip for now",

  "securityReminderTitle": "You have financial data worth protecting.",
  "securityReminderAction": "Set up",
  "securityReminderDismiss": "Dismiss",

  "authenticateToReveal": "Authenticate to view your amounts",
  "biometricReason": "Authenticate to unlock Rhydle"
```

- [ ] **Step 2: Add French strings to app_fr.arb**

Add the following keys to `bride_app/lib/l10n/app_fr.arb` (before the closing `}`):

```json
  "security": "Sécurité",
  "securitySubtitle": "PIN, biométrie & confidentialité",

  "appLockSectionTitle": "VERROUILLAGE",
  "appLock": "Verrouillage de l'app",
  "appLockSubtitle": "Exiger le PIN pour ouvrir l'app",
  "useBiometrics": "Utiliser la biométrie",
  "useBiometricsSubtitle": "Déverrouiller avec empreinte ou Face ID",
  "changePin": "Changer le PIN",
  "changePinSubtitle": "Modifier votre PIN à 4 chiffres",

  "privacySectionTitle": "CONFIDENTIALITÉ",
  "hideAmountsOnLaunch": "Masquer les montants au démarrage",
  "hideAmountsOnLaunchSubtitle": "Démarrer avec les montants masqués",
  "requireAuthToReveal": "Authentification requise",
  "requireAuthToRevealSubtitle": "PIN ou biométrie pour afficher les montants",
  "privacyTip": "Utilisez l'icône œil dans la barre d'app pour basculer rapidement la visibilité.",

  "enterPin": "Entrez le PIN",
  "enterPinSubtitle": "Entrez votre PIN à 4 chiffres pour déverrouiller",
  "forgotPin": "PIN oublié ?",
  "tooManyAttempts": "Trop de tentatives. Réessayez dans {seconds} secondes.",
  "@tooManyAttempts": {
    "placeholders": {
      "seconds": { "type": "int" }
    }
  },
  "wrongPin": "PIN incorrect. Réessayez.",

  "createPin": "Créer un PIN",
  "createPinSubtitle": "Choisissez un PIN à 4 chiffres pour sécuriser votre app",
  "confirmPin": "Confirmer le PIN",
  "confirmPinSubtitle": "Entrez votre PIN à nouveau pour confirmer",
  "pinsDontMatch": "Les PINs ne correspondent pas. Veuillez réessayer.",
  "pinCreatedSuccess": "PIN créé avec succès !",
  "pinChangedSuccess": "PIN changé avec succès !",
  "pinRemovedSuccess": "Verrouillage désactivé.",

  "enterCurrentPin": "Entrez le PIN actuel",
  "enterCurrentPinSubtitle": "Vérifiez d'abord votre PIN actuel",

  "resetPin": "Réinitialiser le PIN",
  "resetPinSubtitle": "Entrez votre mot de passe pour réinitialiser votre PIN",
  "resetPinPasswordLabel": "Mot de passe du compte",
  "resetPinPasswordHint": "Entrez votre mot de passe Rhydle",
  "resetPinSuccess": "PIN réinitialisé. Configurez un nouveau PIN.",
  "resetPinError": "Mot de passe incorrect. Veuillez réessayer.",

  "secureYourAccount": "Sécurisez votre compte",
  "secureYourAccountBody": "Protégez vos données financières avec un PIN à 4 chiffres.",
  "setupPin": "Configurer le PIN",
  "skipForNow": "Plus tard",

  "securityReminderTitle": "Vos données financières méritent d'être protégées.",
  "securityReminderAction": "Configurer",
  "securityReminderDismiss": "Ignorer",

  "authenticateToReveal": "Authentifiez-vous pour voir vos montants",
  "biometricReason": "Authentifiez-vous pour déverrouiller Rhydle"
```

- [ ] **Step 3: Run flutter gen-l10n**

```bash
cd "/Users/MAC/Documents/test mobile app/bride_app" && flutter gen-l10n
```

Expected: Generated files updated in `lib/l10n/generated/` with no errors.

- [ ] **Step 4: Verify compilation**

```bash
cd "/Users/MAC/Documents/test mobile app/bride_app" && flutter analyze lib/l10n/
```

Expected: No analysis issues.

- [ ] **Step 5: Commit**

```bash
git add lib/l10n/app_en.arb lib/l10n/app_fr.arb lib/l10n/generated/
git commit -m "feat(security): add l10n strings for security features (EN + FR)"
```

---

## Task 8: PIN Keypad Widget

Custom 4-digit PIN entry pad used by lock screen and setup screens.

**Files:**
- Create: `bride_app/lib/features/security/widgets/pin_keypad.dart`

- [ ] **Step 1: Create the PIN keypad widget**

Create `bride_app/lib/features/security/widgets/pin_keypad.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

import '../../../grow_out_loud/components/gol_icon.dart';
import '../../../grow_out_loud/foundation/gol_colors.dart';
import '../../../grow_out_loud/foundation/gol_spacing.dart';

/// A 4-digit PIN entry pad with dot indicators, optional biometric button,
/// and shake animation on error.
class PinKeypad extends StatefulWidget {
  /// Called when the user has entered all 4 digits.
  final ValueChanged<String> onCompleted;

  /// Optional: show biometric button in bottom-left.
  final VoidCallback? onBiometricTap;

  /// Whether to show biometric button.
  final bool showBiometric;

  /// Title shown above the dots (e.g., "Enter PIN", "Confirm PIN").
  final String title;

  /// Subtitle shown below the title.
  final String? subtitle;

  /// Error message shown below dots (triggers shake).
  final String? errorMessage;

  const PinKeypad({
    super.key,
    required this.onCompleted,
    this.onBiometricTap,
    this.showBiometric = false,
    required this.title,
    this.subtitle,
    this.errorMessage,
  });

  @override
  State<PinKeypad> createState() => PinKeypadState();
}

class PinKeypadState extends State<PinKeypad> with SingleTickerProviderStateMixin {
  String _pin = '';
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _shakeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _shakeController, curve: Curves.elasticIn),
    );
  }

  @override
  void didUpdateWidget(PinKeypad oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.errorMessage != null && oldWidget.errorMessage == null) {
      _shake();
    }
  }

  void _shake() {
    _shakeController.forward(from: 0);
    HapticFeedback.mediumImpact();
  }

  /// Clear the entered PIN (call externally via GlobalKey<PinKeypadState>).
  void clear() {
    setState(() => _pin = '');
  }

  void _onDigitTap(String digit) {
    if (_pin.length >= 4) return;
    HapticFeedback.lightImpact();
    setState(() {
      _pin += digit;
    });
    if (_pin.length == 4) {
      widget.onCompleted(_pin);
    }
  }

  void _onBackspace() {
    if (_pin.isEmpty) return;
    HapticFeedback.lightImpact();
    setState(() {
      _pin = _pin.substring(0, _pin.length - 1);
    });
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<GOLSemanticColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Title
        Text(
          widget.title,
          style: textTheme.headlineSmall?.copyWith(
            color: colors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (widget.subtitle != null) ...[
          const SizedBox(height: GOLSpacing.space2),
          Text(
            widget.subtitle!,
            style: textTheme.bodySmall?.copyWith(color: colors.textTertiary),
            textAlign: TextAlign.center,
          ),
        ],
        const SizedBox(height: GOLSpacing.space7),

        // PIN dots with shake animation
        AnimatedBuilder(
          animation: _shakeAnimation,
          builder: (context, child) {
            final offset = _shakeAnimation.value * 10 *
                ((_shakeController.value * 4).floor().isEven ? 1 : -1);
            return Transform.translate(
              offset: Offset(offset, 0),
              child: child,
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (i) {
              final filled = i < _pin.length;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: GOLSpacing.space3),
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: filled ? colors.interactivePrimary : Colors.transparent,
                  border: Border.all(
                    color: filled ? colors.interactivePrimary : colors.borderDefault,
                    width: 2,
                  ),
                ),
              );
            }),
          ),
        ),

        // Error message
        const SizedBox(height: GOLSpacing.space4),
        SizedBox(
          height: 20,
          child: widget.errorMessage != null
              ? Text(
                  widget.errorMessage!,
                  style: textTheme.bodySmall?.copyWith(color: colors.statusError),
                )
              : null,
        ),
        const SizedBox(height: GOLSpacing.space7),

        // Number pad
        ...List.generate(3, (row) {
          return Padding(
            padding: const EdgeInsets.only(bottom: GOLSpacing.space3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (col) {
                final digit = '${row * 3 + col + 1}';
                return _KeypadButton(
                  label: digit,
                  onTap: () => _onDigitTap(digit),
                  colors: colors,
                  textTheme: textTheme,
                );
              }),
            ),
          );
        }),

        // Bottom row: biometric / 0 / backspace
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Biometric or empty
            widget.showBiometric
                ? _KeypadButton(
                    icon: Iconsax.finger_scan,
                    onTap: widget.onBiometricTap,
                    colors: colors,
                    textTheme: textTheme,
                  )
                : const SizedBox(width: 80),
            // 0
            _KeypadButton(
              label: '0',
              onTap: () => _onDigitTap('0'),
              colors: colors,
              textTheme: textTheme,
            ),
            // Backspace
            _KeypadButton(
              icon: Iconsax.arrow_left,
              onTap: _onBackspace,
              colors: colors,
              textTheme: textTheme,
            ),
          ],
        ),
      ],
    );
  }
}

class _KeypadButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final VoidCallback? onTap;
  final GOLSemanticColors colors;
  final TextTheme textTheme;

  const _KeypadButton({
    this.label,
    this.icon,
    this.onTap,
    required this.colors,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: GOLSpacing.space2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colors.surfaceDefault,
        ),
        child: Center(
          child: label != null
              ? Text(
                  label!,
                  style: textTheme.headlineMedium?.copyWith(
                    color: colors.textPrimary,
                    fontWeight: FontWeight.w400,
                  ),
                )
              : icon != null
                  ? GOLIcon(icon!, size: 24, color: colors.textSecondary)
                  : null,
        ),
      ),
    );
  }
}
```

- [ ] **Step 2: Verify compilation**

```bash
cd "/Users/MAC/Documents/test mobile app/bride_app" && flutter analyze lib/features/security/widgets/pin_keypad.dart
```

Expected: No analysis issues.

- [ ] **Step 3: Commit**

```bash
git add lib/features/security/widgets/pin_keypad.dart
git commit -m "feat(security): add PinKeypad widget with shake animation and biometric button"
```

---

## Task 9: PIN Lock Screen

The full-screen lock screen shown on app launch when PIN is set.

**Files:**
- Create: `bride_app/lib/features/security/screens/pin_lock_screen.dart`

- [ ] **Step 1: Create the lock screen**

Create `bride_app/lib/features/security/screens/pin_lock_screen.dart`:

```dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/rate_limiter.dart';
import '../../../grow_out_loud/foundation/gol_colors.dart';
import '../../../grow_out_loud/foundation/gol_spacing.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../routing/routes.dart';
import '../providers/app_lock_provider.dart';
import '../services/secure_pin_service.dart';
import '../widgets/pin_keypad.dart';

class PinLockScreen extends ConsumerStatefulWidget {
  const PinLockScreen({super.key});

  @override
  ConsumerState<PinLockScreen> createState() => _PinLockScreenState();
}

class _PinLockScreenState extends ConsumerState<PinLockScreen> {
  final _keypadKey = GlobalKey<PinKeypadState>();
  String? _errorMessage;

  static final _rateLimiter = RateLimiter(
    maxAttempts: 5,
    window: const Duration(seconds: 60),
  );
  static const _rlKey = 'pin_lock';

  Timer? _cooldownTimer;
  int _cooldownSeconds = 0;

  @override
  void initState() {
    super.initState();
    _attemptBiometricOnLaunch();
  }

  Future<void> _attemptBiometricOnLaunch() async {
    final lockState = ref.read(appLockProvider);
    if (lockState.biometricsEnabled) {
      final success = await SecurePinService.authenticateBiometric();
      if (success && mounted) {
        ref.read(appLockProvider.notifier).unlock();
      }
    }
  }

  Future<void> _onPinCompleted(String pin) async {
    if (!_rateLimiter.canAttempt(_rlKey)) {
      _startCooldown();
      _keypadKey.currentState?.clear();
      return;
    }

    final success = await SecurePinService.verifyPin(pin);
    if (success) {
      _rateLimiter.reset(_rlKey);
      ref.read(appLockProvider.notifier).unlock();
    } else {
      _rateLimiter.recordAttempt(_rlKey);
      ref.read(appLockProvider.notifier).recordFailedAttempt();

      if (!_rateLimiter.canAttempt(_rlKey)) {
        _startCooldown();
      } else {
        setState(() => _errorMessage = AppLocalizations.of(context)!.wrongPin);
      }
      _keypadKey.currentState?.clear();
    }
  }

  void _startCooldown() {
    final retryAfter = _rateLimiter.retryAfter(_rlKey);
    if (retryAfter == null) return;

    setState(() {
      _cooldownSeconds = retryAfter.inSeconds;
      _errorMessage = AppLocalizations.of(context)!.tooManyAttempts(_cooldownSeconds);
    });

    _cooldownTimer?.cancel();
    _cooldownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _cooldownSeconds--;
        if (_cooldownSeconds <= 0) {
          timer.cancel();
          _errorMessage = null;
        } else {
          _errorMessage = AppLocalizations.of(context)!.tooManyAttempts(_cooldownSeconds);
        }
      });
    });
  }

  Future<void> _onBiometricTap() async {
    final success = await SecurePinService.authenticateBiometric();
    if (success && mounted) {
      _rateLimiter.reset(_rlKey);
      ref.read(appLockProvider.notifier).unlock();
    }
  }

  @override
  void dispose() {
    _cooldownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<GOLSemanticColors>()!;
    final l10n = AppLocalizations.of(context)!;
    final lockState = ref.watch(appLockProvider);

    return Scaffold(
      backgroundColor: colors.surfaceDefault,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            // App logo
            Image.asset(
              'assets/images/rhydle_logo.png',
              width: 64,
              height: 64,
              errorBuilder: (_, __, ___) => const SizedBox(width: 64, height: 64),
            ),
            const SizedBox(height: GOLSpacing.space6),
            // PIN keypad
            Expanded(
              flex: 8,
              child: PinKeypad(
                key: _keypadKey,
                title: l10n.enterPin,
                subtitle: l10n.enterPinSubtitle,
                errorMessage: _errorMessage,
                onCompleted: _onPinCompleted,
                showBiometric: lockState.biometricsEnabled,
                onBiometricTap: _onBiometricTap,
              ),
            ),
            // Forgot PIN link
            TextButton(
              onPressed: () => context.push(Routes.recoverPin),
              child: Text(
                l10n.forgotPin,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colors.interactivePrimary,
                ),
              ),
            ),
            const SizedBox(height: GOLSpacing.space6),
          ],
        ),
      ),
    );
  }
}
```

- [ ] **Step 2: Verify compilation**

```bash
cd "/Users/MAC/Documents/test mobile app/bride_app" && flutter analyze lib/features/security/screens/pin_lock_screen.dart
```

Expected: May show issues for `Routes.recoverPin` (not yet defined). That's OK — added in Task 12.

- [ ] **Step 3: Commit**

```bash
git add lib/features/security/screens/pin_lock_screen.dart
git commit -m "feat(security): add PIN lock screen with rate limiting and biometric support"
```

---

## Task 10: PIN Setup Screen

Screen for creating a new PIN or changing an existing one. Two-phase: enter PIN, then confirm.

**Files:**
- Create: `bride_app/lib/features/security/screens/pin_setup_screen.dart`

- [ ] **Step 1: Create the PIN setup screen**

Create `bride_app/lib/features/security/screens/pin_setup_screen.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../grow_out_loud/components/gol_buttons.dart';
import '../../../grow_out_loud/foundation/gol_colors.dart';
import '../../../grow_out_loud/foundation/gol_spacing.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../providers/app_lock_provider.dart';
import '../services/secure_pin_service.dart';
import '../widgets/pin_keypad.dart';

/// PIN setup flow: create → confirm → save.
///
/// If [isChanging] is true, the user must verify their current PIN first.
class PinSetupScreen extends ConsumerStatefulWidget {
  final bool isChanging;

  const PinSetupScreen({super.key, this.isChanging = false});

  @override
  ConsumerState<PinSetupScreen> createState() => _PinSetupScreenState();
}

class _PinSetupScreenState extends ConsumerState<PinSetupScreen> {
  final _keypadKey = GlobalKey<PinKeypadState>();
  _SetupPhase _phase = _SetupPhase.create;
  String _firstPin = '';
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    if (widget.isChanging) {
      _phase = _SetupPhase.verifyCurrent;
    }
  }

  Future<void> _onPinCompleted(String pin) async {
    switch (_phase) {
      case _SetupPhase.verifyCurrent:
        final correct = await SecurePinService.verifyPin(pin);
        if (correct) {
          setState(() {
            _phase = _SetupPhase.create;
            _errorMessage = null;
          });
        } else {
          setState(() => _errorMessage = AppLocalizations.of(context)!.wrongPin);
        }
        _keypadKey.currentState?.clear();

      case _SetupPhase.create:
        setState(() {
          _firstPin = pin;
          _phase = _SetupPhase.confirm;
          _errorMessage = null;
        });
        _keypadKey.currentState?.clear();

      case _SetupPhase.confirm:
        if (pin == _firstPin) {
          await SecurePinService.setPin(pin);
          await ref.read(appLockProvider.notifier).onPinCreated();
          if (!mounted) return;

          final l10n = AppLocalizations.of(context)!;
          final message = widget.isChanging ? l10n.pinChangedSuccess : l10n.pinCreatedSuccess;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
          context.pop();
        } else {
          setState(() {
            _errorMessage = AppLocalizations.of(context)!.pinsDontMatch;
            _phase = _SetupPhase.create;
            _firstPin = '';
          });
          _keypadKey.currentState?.clear();
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<GOLSemanticColors>()!;
    final l10n = AppLocalizations.of(context)!;

    String title;
    String? subtitle;
    switch (_phase) {
      case _SetupPhase.verifyCurrent:
        title = l10n.enterCurrentPin;
        subtitle = l10n.enterCurrentPinSubtitle;
      case _SetupPhase.create:
        title = l10n.createPin;
        subtitle = l10n.createPinSubtitle;
      case _SetupPhase.confirm:
        title = l10n.confirmPin;
        subtitle = l10n.confirmPinSubtitle;
    }

    return Scaffold(
      backgroundColor: colors.surfaceDefault,
      appBar: AppBar(
        backgroundColor: colors.surfaceDefault,
        foregroundColor: colors.textPrimary,
        elevation: 0,
      ),
      body: SafeArea(
        child: PinKeypad(
          key: _keypadKey,
          title: title,
          subtitle: subtitle,
          errorMessage: _errorMessage,
          onCompleted: _onPinCompleted,
        ),
      ),
    );
  }
}

enum _SetupPhase { verifyCurrent, create, confirm }
```

- [ ] **Step 2: Verify compilation**

```bash
cd "/Users/MAC/Documents/test mobile app/bride_app" && flutter analyze lib/features/security/screens/pin_setup_screen.dart
```

Expected: No issues (or minor route issues resolved in Task 12).

- [ ] **Step 3: Commit**

```bash
git add lib/features/security/screens/pin_setup_screen.dart
git commit -m "feat(security): add PIN setup screen with create/confirm/change flows"
```

---

## Task 11: PIN Recovery Screen

Allows user to reset their PIN by entering their Supabase account password.

**Files:**
- Create: `bride_app/lib/features/security/screens/pin_recovery_screen.dart`

- [ ] **Step 1: Create the PIN recovery screen**

Create `bride_app/lib/features/security/screens/pin_recovery_screen.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../features/auth/widgets/auth_text_field.dart';
import '../../../grow_out_loud/components/gol_buttons.dart';
import '../../../grow_out_loud/components/gol_icon.dart';
import '../../../grow_out_loud/foundation/gol_colors.dart';
import '../../../grow_out_loud/foundation/gol_spacing.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../routing/routes.dart';
import '../services/secure_pin_service.dart';

class PinRecoveryScreen extends ConsumerStatefulWidget {
  const PinRecoveryScreen({super.key});

  @override
  ConsumerState<PinRecoveryScreen> createState() => _PinRecoveryScreenState();
}

class _PinRecoveryScreenState extends ConsumerState<PinRecoveryScreen> {
  final _passwordController = TextEditingController();
  String? _errorMessage;
  bool _isLoading = false;

  Future<void> _handleSubmit() async {
    final password = _passwordController.text.trim();
    if (password.isEmpty) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Re-authenticate with Supabase using current user's email + entered password
      final user = Supabase.instance.client.auth.currentUser;
      if (user?.email == null) {
        setState(() {
          _errorMessage = 'Unable to verify. Please try again.';
          _isLoading = false;
        });
        return;
      }

      await Supabase.instance.client.auth.signInWithPassword(
        email: user!.email!,
        password: password,
      );

      // Password correct — clear PIN and go to setup
      await SecurePinService.clearPin();
      if (!mounted) return;

      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.resetPinSuccess)),
      );

      // Navigate to PIN setup, replacing recovery screen
      context.pushReplacement(Routes.setupPin);
    } on AuthException {
      setState(() {
        _errorMessage = AppLocalizations.of(context)!.resetPinError;
        _isLoading = false;
      });
    } catch (_) {
      setState(() {
        _errorMessage = AppLocalizations.of(context)!.resetPinError;
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<GOLSemanticColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: colors.surfaceDefault,
      appBar: AppBar(
        backgroundColor: colors.surfaceDefault,
        foregroundColor: colors.textPrimary,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(GOLSpacing.screenPaddingHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: GOLSpacing.space6),
              GOLIcon(Iconsax.lock, size: 48, color: colors.interactivePrimary),
              const SizedBox(height: GOLSpacing.space4),
              Text(
                l10n.resetPin,
                style: textTheme.headlineSmall?.copyWith(
                  color: colors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: GOLSpacing.space2),
              Text(
                l10n.resetPinSubtitle,
                style: textTheme.bodyMedium?.copyWith(color: colors.textSecondary),
              ),
              const SizedBox(height: GOLSpacing.space7),
              AuthTextField(
                label: l10n.resetPinPasswordLabel,
                hintText: l10n.resetPinPasswordHint,
                isPassword: true,
                controller: _passwordController,
                errorText: _errorMessage,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _handleSubmit(),
              ),
              const SizedBox(height: GOLSpacing.space6),
              SizedBox(
                width: double.infinity,
                child: GOLButton(
                  label: l10n.resetPin,
                  onPressed: _isLoading ? null : _handleSubmit,
                  variant: GOLButtonVariant.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

- [ ] **Step 2: Commit**

```bash
git add lib/features/security/screens/pin_recovery_screen.dart
git commit -m "feat(security): add PIN recovery screen with account password re-auth"
```

---

## Task 12: Security Settings Screen

Dedicated Security page inside Settings with App Lock and Privacy sections.

**Files:**
- Create: `bride_app/lib/features/security/screens/security_settings_screen.dart`

- [ ] **Step 1: Create the Security settings screen**

Create `bride_app/lib/features/security/screens/security_settings_screen.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../grow_out_loud/components/gol_icon.dart';
import '../../../grow_out_loud/foundation/gol_colors.dart';
import '../../../grow_out_loud/foundation/gol_spacing.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../routing/routes.dart';
import '../providers/app_lock_provider.dart';
import '../providers/privacy_provider.dart';
import '../services/secure_pin_service.dart';

class SecuritySettingsScreen extends ConsumerWidget {
  const SecuritySettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<GOLSemanticColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    final lockState = ref.watch(appLockProvider);
    final privacyState = ref.watch(privacyProvider);

    return Scaffold(
      backgroundColor: colors.surfaceDefault,
      appBar: AppBar(
        backgroundColor: colors.surfaceDefault,
        foregroundColor: colors.textPrimary,
        elevation: 0,
        title: Text(l10n.security),
      ),
      body: ListView(
        children: [
          // --- APP LOCK section ---
          _SectionHeader(title: l10n.appLockSectionTitle, colors: colors, textTheme: textTheme),

          // App Lock toggle
          _ToggleTile(
            icon: Iconsax.lock,
            title: l10n.appLock,
            subtitle: l10n.appLockSubtitle,
            value: lockState.hasPIN,
            colors: colors,
            textTheme: textTheme,
            onChanged: (enabled) async {
              if (enabled) {
                // Navigate to PIN setup
                context.push(Routes.setupPin);
              } else {
                // Verify current PIN before disabling
                final confirmed = await _showDisablePinDialog(context, ref);
                if (confirmed && context.mounted) {
                  await SecurePinService.clearPin();
                  await ref.read(appLockProvider.notifier).onPinCleared();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.pinRemovedSuccess)),
                    );
                  }
                }
              }
            },
          ),

          // Biometrics toggle (only visible when PIN is set and device supports it)
          if (lockState.hasPIN && lockState.biometricsAvailable)
            _ToggleTile(
              icon: Iconsax.finger_scan,
              title: l10n.useBiometrics,
              subtitle: l10n.useBiometricsSubtitle,
              value: lockState.biometricsEnabled,
              colors: colors,
              textTheme: textTheme,
              onChanged: (enabled) {
                ref.read(appLockProvider.notifier).setBiometricsEnabled(enabled);
              },
            ),

          // Change PIN (only visible when PIN is set)
          if (lockState.hasPIN)
            _NavigationTile(
              icon: Iconsax.key,
              title: l10n.changePin,
              subtitle: l10n.changePinSubtitle,
              colors: colors,
              textTheme: textTheme,
              onTap: () => context.push(Routes.changePin),
            ),

          const SizedBox(height: GOLSpacing.space4),

          // --- PRIVACY section ---
          _SectionHeader(title: l10n.privacySectionTitle, colors: colors, textTheme: textTheme),

          _ToggleTile(
            icon: Iconsax.eye_slash,
            title: l10n.hideAmountsOnLaunch,
            subtitle: l10n.hideAmountsOnLaunchSubtitle,
            value: privacyState.maskOnLaunch,
            colors: colors,
            textTheme: textTheme,
            onChanged: (enabled) {
              ref.read(privacyProvider.notifier).setMaskOnLaunch(enabled);
            },
          ),

          _ToggleTile(
            icon: Iconsax.shield_tick,
            title: l10n.requireAuthToReveal,
            subtitle: l10n.requireAuthToRevealSubtitle,
            value: privacyState.requireAuthToReveal,
            colors: colors,
            textTheme: textTheme,
            // Disable when no PIN is set
            onChanged: lockState.hasPIN
                ? (enabled) {
                    ref.read(privacyProvider.notifier).setRequireAuthToReveal(enabled);
                  }
                : null,
          ),

          // Tip
          Padding(
            padding: const EdgeInsets.all(GOLSpacing.space4),
            child: Text(
              l10n.privacyTip,
              style: textTheme.bodySmall?.copyWith(color: colors.textTertiary),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _showDisablePinDialog(BuildContext context, WidgetRef ref) async {
    // Simple confirmation — in production could require current PIN entry
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Disable App Lock?'),
        content: const Text('Your PIN will be removed.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Disable')),
        ],
      ),
    );
    return confirmed ?? false;
  }
}

// --- Private widgets (same pattern as settings_screen.dart) ---

class _SectionHeader extends StatelessWidget {
  final String title;
  final GOLSemanticColors colors;
  final TextTheme textTheme;

  const _SectionHeader({required this.title, required this.colors, required this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        GOLSpacing.space4, GOLSpacing.space4, GOLSpacing.space4, GOLSpacing.space2,
      ),
      child: Text(
        title,
        style: textTheme.labelSmall?.copyWith(
          color: colors.textTertiary,
          letterSpacing: 1.2,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _ToggleTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final GOLSemanticColors colors;
  final TextTheme textTheme;

  const _ToggleTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    this.onChanged,
    required this.colors,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = onChanged == null;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: GOLSpacing.space4,
            vertical: GOLSpacing.space3,
          ),
          child: Row(
            children: [
              GOLIcon(icon, size: 20, color: isDisabled ? colors.textTertiary : colors.textSecondary),
              const SizedBox(width: GOLSpacing.space3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.bodyMedium?.copyWith(
                        color: isDisabled ? colors.textTertiary : colors.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(subtitle, style: textTheme.bodySmall?.copyWith(color: colors.textTertiary)),
                  ],
                ),
              ),
              Switch.adaptive(value: value, onChanged: onChanged),
            ],
          ),
        ),
        Divider(height: 1, color: colors.borderDefault),
      ],
    );
  }
}

class _NavigationTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final GOLSemanticColors colors;
  final TextTheme textTheme;

  const _NavigationTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.colors,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: GOLSpacing.space4,
              vertical: GOLSpacing.space3,
            ),
            child: Row(
              children: [
                GOLIcon(icon, size: 20, color: colors.textSecondary),
                const SizedBox(width: GOLSpacing.space3),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colors.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(subtitle, style: textTheme.bodySmall?.copyWith(color: colors.textTertiary)),
                    ],
                  ),
                ),
                GOLIcon(Iconsax.arrow_right_3, size: 16, color: colors.textTertiary),
              ],
            ),
          ),
        ),
        Divider(height: 1, color: colors.borderDefault),
      ],
    );
  }
}
```

- [ ] **Step 2: Commit**

```bash
git add lib/features/security/screens/security_settings_screen.dart
git commit -m "feat(security): add dedicated Security settings screen with app lock and privacy sections"
```

---

## Task 13: Routes + GoRouter Integration

Add security routes to the Routes class and GoRouter config. Add lock screen redirect + eye icon to shell.

**Files:**
- Modify: `bride_app/lib/routing/routes.dart`
- Modify: `bride_app/lib/routing/app_router.dart`

- [ ] **Step 1: Add route constants to routes.dart**

Add to `bride_app/lib/routing/routes.dart` inside `class Routes`, after the existing settings routes:

```dart
  // Security routes
  static const String pinLock = '/pin-lock';
  static const String securitySettings = '/settings/security';
  static const String setupPin = '/settings/security/setup-pin';
  static const String changePin = '/settings/security/change-pin';
  static const String recoverPin = '/settings/security/recover-pin';
```

- [ ] **Step 2: Add lock redirect to GoRouter**

In `bride_app/lib/routing/app_router.dart`, in the `redirect:` function, add the following **after** the `isPendingPasswordReset` check and **before** the `!isAuthenticated && !isAuthRoute` check:

```dart
      // PIN lock: intercept if app is locked
      final isLockRoute = location == Routes.pinLock || location == Routes.recoverPin;
      final lockState = ref.read(appLockProvider);

      if (isAuthenticated && lockState.isLocked && lockState.hasPIN && !isLockRoute && !isDeletionRoute) {
        return Routes.pinLock;
      }

      // If on lock route but not locked, redirect to dashboard
      if (isAuthenticated && isLockRoute && !lockState.isLocked) {
        return Routes.dashboard;
      }
```

Add the import at the top of `app_router.dart`:

```dart
import '../features/security/providers/app_lock_provider.dart';
import '../features/security/providers/privacy_provider.dart';
```

- [ ] **Step 3: Add security routes to the router configuration**

In `app_router.dart`, add these routes. The `pinLock` route should be a top-level route (not inside the shell). The settings security routes should be inside the settings branch:

Add as a top-level route (same level as other GoRoutes like splash, onboarding):

```dart
GoRoute(
  path: Routes.pinLock,
  builder: (context, state) => const PinLockScreen(),
),
```

Add as children under the settings route (alongside profile, platforms routes):

```dart
GoRoute(
  path: Routes.securitySettings,
  builder: (context, state) => const SecuritySettingsScreen(),
),
GoRoute(
  path: Routes.setupPin,
  builder: (context, state) => const PinSetupScreen(),
),
GoRoute(
  path: Routes.changePin,
  builder: (context, state) => const PinSetupScreen(isChanging: true),
),
GoRoute(
  path: Routes.recoverPin,
  builder: (context, state) => const PinRecoveryScreen(),
),
```

Add the screen imports at the top of `app_router.dart`:

```dart
import '../features/security/screens/pin_lock_screen.dart';
import '../features/security/screens/pin_setup_screen.dart';
import '../features/security/screens/pin_recovery_screen.dart';
import '../features/security/screens/security_settings_screen.dart';
```

- [ ] **Step 4: Add eye icon to _MainShell**

In the `_MainShell` widget's `build` method, wrap the `Scaffold` body to include an app-bar-like area, OR add the eye icon to each screen's app bar. The simplest approach: add to the `Scaffold` of `_MainShell` an `appBar`:

In `_MainShell.build()`, change `Scaffold(body: child, ...)` to include the eye icon. Since the shell doesn't currently have an AppBar (each screen manages its own), the cleanest approach is to add the eye icon to the dashboard screen's existing header area. However, for global visibility across all tabs, modify `_MainShell`:

Replace `body: child,` with:

```dart
body: Column(
  children: [
    // Privacy toggle bar — only the eye icon, right-aligned
    SafeArea(
      bottom: false,
      child: Consumer(
        builder: (context, ref, _) {
          final privacy = ref.watch(privacyProvider);
          return Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(
                right: GOLSpacing.space4,
                top: GOLSpacing.space2,
              ),
              child: GestureDetector(
                onTap: () => _handlePrivacyToggle(context, ref, privacy),
                child: GOLIcon(
                  privacy.isMasked ? Iconsax.eye_slash : Iconsax.eye,
                  size: 20,
                  color: colors.textSecondary,
                ),
              ),
            ),
          );
        },
      ),
    ),
    Expanded(child: child),
  ],
),
```

Add this static method to `_MainShell` (or as a free function in the same file):

```dart
static void _handlePrivacyToggle(BuildContext context, WidgetRef ref, PrivacyState privacy) async {
  if (privacy.isMasked) {
    // Wants to unmask
    if (privacy.needsAuthToUnmask) {
      // Need to authenticate first
      final lockState = ref.read(appLockProvider);
      bool authenticated = false;

      if (lockState.biometricsEnabled) {
        authenticated = await SecurePinService.authenticateBiometric();
      }

      if (!authenticated) {
        // Fall back to PIN prompt — show a dialog or bottom sheet
        // For simplicity, just use biometric. Full PIN dialog can be added later.
        return;
      }
    }
    ref.read(privacyProvider.notifier).unmask();
  } else {
    // Mask — always immediate
    ref.read(privacyProvider.notifier).mask();
  }
}
```

Add the required imports to `app_router.dart`:

```dart
import '../features/security/services/secure_pin_service.dart';
```

- [ ] **Step 5: Add background timeout for privacy to AppLockNotifier**

In `bride_app/lib/features/security/providers/app_lock_provider.dart`, modify `_onAppResumed()` to also reset privacy session. Since AppLockNotifier doesn't have access to PrivacyNotifier directly (they're separate providers), we need a different approach.

Create a shared lifecycle observer widget. Add to `app_router.dart` or create `lib/features/security/widgets/security_lifecycle_observer.dart`:

Actually, the simplest approach: have the `_MainShell` itself observe lifecycle and coordinate both providers. In the `_MainShell`, since it's a `ConsumerWidget`, upgrade it to `ConsumerStatefulWidget` with `WidgetsBindingObserver`:

This is a larger refactor of `_MainShell`. The key change:
- Convert `_MainShell` from `ConsumerWidget` to `ConsumerStatefulWidget`
- Add `WidgetsBindingObserver` mixin
- On `resumed` after >30s: lock app + reset privacy session

The implementation detail depends on the exact current structure. The agent implementing this task should:
1. Convert `_MainShell` to `ConsumerStatefulWidget`
2. Add `WidgetsBindingObserver` mixin
3. Track `_pausedAt` timestamp
4. On resume >30s: call `ref.read(privacyProvider.notifier).resetSession()`
5. The `appLockProvider` already handles its own lifecycle (it has its own observer)

- [ ] **Step 6: Verify the app compiles**

```bash
cd "/Users/MAC/Documents/test mobile app/bride_app" && flutter analyze
```

Expected: No critical issues.

- [ ] **Step 7: Commit**

```bash
git add lib/routing/routes.dart lib/routing/app_router.dart
git commit -m "feat(security): add security routes, lock redirect, and eye icon to shell"
```

---

## Task 14: Settings Screen Integration

Add the "Security" navigation row to the existing Settings screen.

**Files:**
- Modify: `bride_app/lib/features/settings/screens/settings_screen.dart`

- [ ] **Step 1: Add Security row to Settings**

In `bride_app/lib/features/settings/screens/settings_screen.dart`, add a new section. Find the appropriate location (after Preferences or Notifications section) and add:

```dart
// SECURITY SECTION
const SizedBox(height: GOLSpacing.space4),
_SectionHeader(title: l10n.security),
const SizedBox(height: GOLSpacing.space2),
_NavigationTile(
  icon: Iconsax.shield_tick,
  title: l10n.security,
  subtitle: l10n.securitySubtitle,
  onTap: () => context.push(Routes.securitySettings),
),
```

If `_NavigationTile` doesn't exist in `settings_screen.dart`, create it matching the pattern in `security_settings_screen.dart`:

```dart
class _NavigationTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _NavigationTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<GOLSemanticColors>()!;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: GOLSpacing.space2,
              vertical: GOLSpacing.space3,
            ),
            child: Row(
              children: [
                GOLIcon(icon, size: 20, color: colors.textSecondary),
                const SizedBox(width: GOLSpacing.space3),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colors.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: textTheme.bodySmall?.copyWith(color: colors.textTertiary),
                      ),
                    ],
                  ),
                ),
                GOLIcon(Iconsax.arrow_right_3, size: 16, color: colors.textTertiary),
              ],
            ),
          ),
        ),
        Divider(height: 1, color: colors.borderDefault),
      ],
    );
  }
}
```

Add the Routes import if not already present:

```dart
import '../../../routing/routes.dart';
```

- [ ] **Step 2: Verify compilation**

```bash
cd "/Users/MAC/Documents/test mobile app/bride_app" && flutter analyze lib/features/settings/screens/settings_screen.dart
```

Expected: No issues.

- [ ] **Step 3: Commit**

```bash
git add lib/features/settings/screens/settings_screen.dart
git commit -m "feat(security): add Security navigation row to Settings screen"
```

---

## Task 15: Onboarding Security Prompt

Skippable security setup step shown after account creation.

**Files:**
- Create: `bride_app/lib/features/security/widgets/security_setup_prompt.dart`
- Modify: `bride_app/lib/features/onboarding/screens/onboarding_flow_screen.dart`

- [ ] **Step 1: Create the security prompt widget**

Create `bride_app/lib/features/security/widgets/security_setup_prompt.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

import '../../../grow_out_loud/components/gol_buttons.dart';
import '../../../grow_out_loud/components/gol_icon.dart';
import '../../../grow_out_loud/foundation/gol_colors.dart';
import '../../../grow_out_loud/foundation/gol_spacing.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../services/security_preferences_service.dart';

/// Onboarding step that suggests setting up a PIN.
/// Shows after account creation, before first dashboard view.
class SecuritySetupPrompt extends StatelessWidget {
  final VoidCallback onSetupPin;
  final VoidCallback onSkip;

  const SecuritySetupPrompt({
    super.key,
    required this.onSetupPin,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<GOLSemanticColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(GOLSpacing.screenPaddingHorizontal),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          GOLIcon(Iconsax.shield_tick, size: 80, color: colors.interactivePrimary),
          const SizedBox(height: GOLSpacing.space7),
          Text(
            l10n.secureYourAccount,
            style: textTheme.headlineSmall?.copyWith(
              color: colors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: GOLSpacing.space3),
          Text(
            l10n.secureYourAccountBody,
            style: textTheme.bodyMedium?.copyWith(color: colors.textSecondary),
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 3),
          SizedBox(
            width: double.infinity,
            child: GOLButton(
              label: l10n.setupPin,
              onPressed: () async {
                await SecurityPreferencesService.markOnboardingSecuritySeen();
                onSetupPin();
              },
              variant: GOLButtonVariant.primary,
            ),
          ),
          const SizedBox(height: GOLSpacing.space3),
          TextButton(
            onPressed: () async {
              await SecurityPreferencesService.markOnboardingSecuritySeen();
              onSkip();
            },
            child: Text(
              l10n.skipForNow,
              style: textTheme.bodyMedium?.copyWith(color: colors.textTertiary),
            ),
          ),
          const SizedBox(height: GOLSpacing.space6),
        ],
      ),
    );
  }
}
```

- [ ] **Step 2: Integrate into onboarding flow**

The onboarding flow is a 3-page PageView that ends by navigating to `/auth`. The security prompt should appear AFTER authentication, not during onboarding itself. This is because the user needs an account first.

The best integration point: in the GoRouter redirect, after authentication and before first dashboard. Add a check:

In `app_router.dart` redirect, after the lock check and before the final `return null`, add:

```dart
      // First-time security prompt: show after first login if not yet seen
      // This is handled by the dashboard screen itself via the reminder banner,
      // since the onboarding flow goes: onboarding → auth → dashboard
```

Actually, the cleaner approach per the spec: integrate the security prompt as a screen shown ONCE right after the user first authenticates. The simplest way: check in the redirect if it's the user's first session and they haven't seen the security prompt yet.

However, since the onboarding flow goes through auth first, and we want to show the prompt AFTER auth, the implementation should:
1. After first successful authentication, check `SecurityPreferencesService.hasSeenOnboardingSecurity()`
2. If false, redirect to a `/security-setup` route that shows `SecuritySetupPrompt`
3. From there, "Set up PIN" goes to `/settings/security/setup-pin`, "Skip" goes to `/dashboard`

Add a new route:

In `routes.dart`:
```dart
  static const String securitySetup = '/security-setup';
```

In `app_router.dart`, add the route:
```dart
GoRoute(
  path: Routes.securitySetup,
  builder: (context, state) => Scaffold(
    backgroundColor: Theme.of(context).extension<GOLSemanticColors>()!.surfaceDefault,
    body: SecuritySetupPrompt(
      onSetupPin: () => context.go(Routes.setupPin),
      onSkip: () => context.go(Routes.dashboard),
    ),
  ),
),
```

Note: The redirect-based approach for this is complex. A simpler alternative: just use the dashboard reminder banner (Task 16) as the primary nudge, and skip the onboarding screen entirely. The implementing agent should evaluate which approach is cleaner given the current redirect chain complexity. If the redirect chain is already complex, prefer the banner-only approach and skip this integration.

- [ ] **Step 3: Commit**

```bash
git add lib/features/security/widgets/security_setup_prompt.dart lib/routing/routes.dart lib/routing/app_router.dart
git commit -m "feat(security): add onboarding security setup prompt"
```

---

## Task 16: Dashboard Security Reminder Banner

One-time dismissible banner shown on the dashboard when user has data but no PIN.

**Files:**
- Create: `bride_app/lib/features/security/widgets/security_reminder_banner.dart`
- Modify: `bride_app/lib/features/dashboard/screens/dashboard_screen.dart`

- [ ] **Step 1: Create the reminder banner widget**

Create `bride_app/lib/features/security/widgets/security_reminder_banner.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../grow_out_loud/components/gol_icon.dart';
import '../../../grow_out_loud/foundation/gol_colors.dart';
import '../../../grow_out_loud/foundation/gol_spacing.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../routing/routes.dart';
import '../providers/app_lock_provider.dart';
import '../services/security_preferences_service.dart';

/// One-time dismissible banner suggesting PIN setup.
///
/// Shows when: PIN not set, user has tracker data, reminder not dismissed.
class SecurityReminderBanner extends ConsumerStatefulWidget {
  /// Whether the user has at least one tracker with entries.
  final bool hasTrackerData;

  const SecurityReminderBanner({super.key, required this.hasTrackerData});

  @override
  ConsumerState<SecurityReminderBanner> createState() => _SecurityReminderBannerState();
}

class _SecurityReminderBannerState extends ConsumerState<SecurityReminderBanner> {
  bool _visible = false;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _checkVisibility();
  }

  Future<void> _checkVisibility() async {
    if (!widget.hasTrackerData) {
      setState(() => _loaded = true);
      return;
    }

    final lockState = ref.read(appLockProvider);
    if (lockState.hasPIN) {
      setState(() => _loaded = true);
      return;
    }

    final dismissed = await SecurityPreferencesService.hasDismissedSecurityReminder();
    if (mounted) {
      setState(() {
        _visible = !dismissed;
        _loaded = true;
      });
    }
  }

  Future<void> _dismiss() async {
    await SecurityPreferencesService.dismissSecurityReminder();
    if (mounted) setState(() => _visible = false);
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded || !_visible) return const SizedBox.shrink();

    final colors = Theme.of(context).extension<GOLSemanticColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.only(
        left: GOLSpacing.space4,
        right: GOLSpacing.space4,
        bottom: GOLSpacing.space4,
      ),
      padding: const EdgeInsets.all(GOLSpacing.space3),
      decoration: BoxDecoration(
        color: colors.interactivePrimary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.interactivePrimary.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          GOLIcon(Iconsax.shield_tick, size: 20, color: colors.interactivePrimary),
          const SizedBox(width: GOLSpacing.space3),
          Expanded(
            child: Text(
              l10n.securityReminderTitle,
              style: textTheme.bodySmall?.copyWith(color: colors.textPrimary),
            ),
          ),
          const SizedBox(width: GOLSpacing.space2),
          GestureDetector(
            onTap: () => context.push(Routes.securitySettings),
            child: Text(
              l10n.securityReminderAction,
              style: textTheme.labelSmall?.copyWith(
                color: colors.interactivePrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: GOLSpacing.space3),
          GestureDetector(
            onTap: _dismiss,
            child: GOLIcon(Iconsax.close_circle, size: 16, color: colors.textTertiary),
          ),
        ],
      ),
    );
  }
}
```

- [ ] **Step 2: Add banner to dashboard screen**

In `bride_app/lib/features/dashboard/screens/dashboard_screen.dart`, add the banner at the top of the dashboard content area (inside the scroll view, before the first card). The implementing agent should:

1. Import the banner:
```dart
import '../../security/widgets/security_reminder_banner.dart';
```

2. Determine if user has tracker data (the dashboard already loads trackers via `trackersProvider`)

3. Add the widget at the top of the dashboard's `Column` or `ListView`:
```dart
SecurityReminderBanner(
  hasTrackerData: trackers.isNotEmpty && trackers.any((t) => t.totalEntries > 0),
),
```

The exact placement depends on the dashboard's current widget tree. Insert it right after any existing padding/safe-area but before the first content card.

- [ ] **Step 3: Commit**

```bash
git add lib/features/security/widgets/security_reminder_banner.dart lib/features/dashboard/screens/dashboard_screen.dart
git commit -m "feat(security): add one-time security reminder banner to dashboard"
```

---

## Task 17: End-to-End Integration + Manual Testing

Verify all features work together on a real device.

**Files:** None (testing only)

- [ ] **Step 1: Run all unit tests**

```bash
cd "/Users/MAC/Documents/test mobile app/bride_app" && flutter test
```

Expected: All tests pass.

- [ ] **Step 2: Run flutter analyze**

```bash
cd "/Users/MAC/Documents/test mobile app/bride_app" && flutter analyze
```

Expected: No errors. Warnings are acceptable if pre-existing.

- [ ] **Step 3: Launch on device and test PIN setup flow**

```bash
cd "/Users/MAC/Documents/test mobile app/bride_app" && flutter run
```

Test manually:
1. Go to Settings → Security
2. Toggle "App Lock" ON → PIN setup screen appears
3. Enter 4 digits → confirm screen → enter same 4 digits
4. "PIN created successfully!" toast
5. Back on Security screen: App Lock is ON, Biometrics toggle visible (if device supports)
6. "Change PIN" row is visible

- [ ] **Step 4: Test lock screen**

1. Background the app for >30 seconds
2. Return to app → PIN lock screen should appear
3. Enter correct PIN → unlock to dashboard
4. Try wrong PIN 5 times → rate limit message appears
5. Tap "Forgot PIN?" → recovery screen → enter account password → reset PIN

- [ ] **Step 5: Test privacy masking**

1. Go to dashboard — amounts should be visible
2. Tap eye icon in app bar → all amounts show `****`
3. Tap eye icon again → amounts visible (no auth since `requireAuthToReveal` is off by default)
4. Go to Settings → Security → toggle "Require Auth to Reveal" ON
5. Tap eye icon to mask → tap again to unmask → biometric/PIN prompt appears
6. Authenticate → amounts visible
7. Navigate between tabs — masking persists across all screens

- [ ] **Step 6: Test nudge system**

1. Create a fresh account (or clear SharedPreferences)
2. After first login, security setup prompt should appear (if implemented via redirect) OR reminder banner appears on dashboard after adding first tracker entry
3. Dismiss → never appears again

- [ ] **Step 7: Final commit**

```bash
git add -A
git commit -m "feat(security): complete app lock and privacy masking implementation"
```

---

## Summary

| Task | Description | Estimated Complexity |
|------|-------------|---------------------|
| 1 | Add dependencies | Trivial |
| 2 | SecurityPreferencesService | Small |
| 3 | SecurePinService | Small |
| 4 | AppLockProvider | Medium |
| 5 | PrivacyProvider | Medium |
| 6 | CurrencyFormatter masking | Small |
| 7 | Localization strings | Small |
| 8 | PinKeypad widget | Medium |
| 9 | PIN lock screen | Medium |
| 10 | PIN setup screen | Medium |
| 11 | PIN recovery screen | Small |
| 12 | Security settings screen | Medium |
| 13 | Routes + GoRouter integration | Large (most integration work) |
| 14 | Settings screen integration | Small |
| 15 | Onboarding security prompt | Small |
| 16 | Dashboard reminder banner | Small |
| 17 | E2E integration + testing | Manual testing |

**Critical path:** Tasks 1-7 (foundation) → Tasks 8-12 (screens) → Task 13 (wiring) → Tasks 14-16 (integration) → Task 17 (testing)

**Dependencies:** Tasks 2-3 must complete before 4-5. Task 6 is independent. Task 13 depends on all screens (8-12). Tasks 14-16 depend on 13.
