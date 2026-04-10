# App Security — PIN Lock & Privacy Masking

**Date:** 2026-04-09
**Status:** Approved
**Features:** App Lock (PIN + Biometrics), Amount Privacy Masking

---

## Overview

Two security features for the Rhydle app:

1. **App Lock** — optional 4-digit PIN with biometric support, protecting the entire app on launch
2. **Privacy Masking** — global toggle to hide all monetary amounts across the app with `****`

Both features are optional, non-aggressive, and follow patterns from top-tier financial apps (Revolut, Binance, Wise).

---

## Feature 1: App Lock (PIN + Biometrics)

### New Packages

- `flutter_secure_storage` — encrypted PIN storage (Android Keystore / iOS Keychain)
- `local_auth` — fingerprint / Face ID authentication

### New Files

```
lib/features/security/
  screens/
    security_settings_screen.dart    # Dedicated Security page in Settings
    pin_lock_screen.dart             # Full lock screen with PIN pad
    pin_setup_screen.dart            # Create / change PIN flow
    pin_recovery_screen.dart         # Re-enter account password to reset PIN
  providers/
    app_lock_provider.dart           # Lock state management
    privacy_provider.dart            # Masking state management
  services/
    secure_pin_service.dart          # PIN CRUD + biometric auth via flutter_secure_storage + local_auth
  widgets/
    pin_keypad.dart                  # Custom 4-digit PIN pad (number grid + backspace + biometric button)
    security_setup_prompt.dart       # Onboarding security step
    security_reminder_banner.dart    # One-time dashboard banner
```

### PIN Setup Flow

1. User navigates to Settings → Security → toggles "App Lock" ON
2. Navigate to `pin_setup_screen.dart`
3. User enters 4 digits → confirm by entering again
4. PIN hashed and stored via `SecurePinService` → `flutter_secure_storage`
5. Optionally enable biometrics (prompted if device supports it)
6. Return to Security page with lock active

### PIN Lock Flow (App Launch)

1. App launches → GoRouter redirect checks `appLockProvider.isLocked`
2. If PIN is set and app is locked → redirect to `/pin-lock`
3. Lock screen shows:
   - App logo/branding at top
   - 4 dot indicators for PIN entry
   - Number pad (1-9, 0, backspace)
   - Biometric button (if enabled) — fingerprint or Face ID icon
   - "Forgot PIN?" link at bottom
4. User enters 4 digits OR taps biometric button
5. `SecurePinService.verifyPin()` or `SecurePinService.authenticateBiometric()`
6. Success → `appLockProvider.unlock()` → GoRouter redirects to dashboard
7. Failure → shake animation on dots, clear input, increment attempt counter

### Rate Limiting

- 5 failed PIN attempts → 60-second cooldown
- Reuses existing `RateLimiter` pattern from `lib/core/utils/rate_limiter.dart`
- Cooldown message shown on lock screen: "Too many attempts. Try again in X seconds."

### Forgot PIN Recovery

1. User taps "Forgot PIN?" on lock screen
2. Navigate to `pin_recovery_screen.dart`
3. Screen shows: "Enter your account password to reset your PIN"
4. User enters their Supabase account password
5. `AuthNotifier` re-authenticates with Supabase
6. On success → `SecurePinService.clearPin()` → navigate to `pin_setup_screen.dart` to set new PIN
7. On failure → show error, allow retry

### Background Lock Behavior

- `WidgetsBindingObserver` in `AppLockNotifier` monitors `AppLifecycleState`
- `paused` → record timestamp in memory
- `resumed` → if >30 seconds elapsed since `paused`, set `isLocked = true`
- GoRouter redirect picks up the locked state and redirects to `/pin-lock`

---

## Feature 2: Privacy Masking (Amount Hiding)

### Architecture: CurrencyFormatter Integration

Masking is built directly into `CurrencyFormatter` — when privacy mode is active, `format()` and `formatCompact()` return `****` instead of the actual amount. Since all monetary displays already go through the formatter, this provides automatic coverage across all screens with zero per-screen changes.

### Modified File

**`lib/core/utils/currency_formatter.dart`:**
- Add optional `masked` parameter (default `false`) to `format()` and `formatCompact()`
- When `masked == true` → return `"****"` regardless of amount or currency
- All existing call sites pass `ref.watch(privacyProvider).isMasked` as the `masked` parameter

### Privacy Provider State

```dart
class PrivacyState {
  final bool isMasked;            // Are amounts currently hidden?
  final bool isSessionVerified;   // Has user authenticated this session?
  final bool maskOnLaunch;        // Default to masked on app open?
  final bool requireAuthToReveal; // Require PIN/biometric to unmask?
}
```

### Toggle Flow (Eye Icon in App Bar)

1. User taps eye icon (Iconsax `eye` / `eye_slash`) in app bar
2. **Hiding (visible → masked):** Always immediate, no auth required
3. **Revealing (masked → visible):**
   - If `requireAuthToReveal == false` OR no PIN set → unmask immediately
   - If `requireAuthToReveal == true` AND PIN is set:
     - If `isSessionVerified == true` → unmask immediately
     - If `isSessionVerified == false` → show PIN/biometric prompt → on success, set `isSessionVerified = true` and unmask

### Session Reset

- Same `WidgetsBindingObserver` as app lock (shared lifecycle observer)
- When app backgrounds >30 seconds → `isSessionVerified` resets to `false`
- If `maskOnLaunch` is enabled → `isMasked` also resets to `true`

### Eye Icon Placement

- Iconsax `eye` (amounts visible) / `eye_slash` (amounts masked) in the app bar
- Visible on all 3 tabs (Dashboard, Trackers, Settings) via the shell route app bar
- Icon state reflects current `isMasked` value

### Persistence

- `isMasked` → SharedPreferences (remembers state across app restarts)
- `maskOnLaunch` → SharedPreferences (configured in Security settings)
- `requireAuthToReveal` → SharedPreferences (configured in Security settings)
- `isSessionVerified` → in-memory only (always `false` on fresh launch)

### Edge Cases

- **No PIN set + masking on:** toggle works freely, no auth ever required
- **PIN set + `requireAuthToReveal` off:** toggle works freely despite PIN existing
- **Amounts not going through CurrencyFormatter:** audit all screens for hardcoded amounts; ensure all monetary displays use the formatter. If any don't, update them.
- **Charts and graphs:** bar chart values, axis labels, and tooltips must also respect masking. Pass `masked` parameter to chart components.

---

## Feature 3: Onboarding Nudge & Reminder

### Onboarding Security Prompt

- **When:** After account creation, after profile setup, before first dashboard view
- **Screen:** New step in onboarding sequence
- **Content:**
  - Heading: "Secure your account"
  - Body: "Protect your financial data with a 4-digit PIN"
  - Primary button: "Set up PIN" → navigates to PIN setup flow
  - Secondary link: "Skip for now" → proceeds to dashboard
- **Flag:** `has_seen_onboarding_security = true` saved to SharedPreferences

### One-Time Dashboard Reminder

- **Triggers when ALL true:**
  - PIN is NOT set
  - User has at least 1 tracker entry with data
  - `has_dismissed_security_reminder == false`
- **Format:** Dismissible banner at top of dashboard (not a modal)
- **Content:** "You have financial data worth protecting. Set up a PIN?" with "Set up" and "Dismiss" actions
- **"Set up"** → navigate to Settings → Security
- **"Dismiss"** → set `has_dismissed_security_reminder = true` → never show again

### Maximum 2 touchpoints, then silent forever.

---

## Dedicated Security Settings Page

### Route

`/settings/security` — new route in GoRouter, child of `/settings`

### Layout

**APP LOCK section:**
| Setting | Type | Behavior |
|---------|------|----------|
| App Lock | Toggle | ON triggers PIN setup flow. OFF requires current PIN to confirm, then clears PIN. |
| Use Biometrics | Toggle | Only visible when PIN is set and device supports biometrics. |
| Change PIN | Navigation | Requires current PIN first, then enter new PIN twice. |

**PRIVACY section:**
| Setting | Type | Behavior |
|---------|------|----------|
| Hide Amounts on Launch | Toggle | When ON, app always starts with amounts masked. |
| Require Auth to Reveal | Toggle | When ON and PIN is set, unmasking requires PIN/biometric. Disabled (greyed out) when no PIN is set. |

**Footer tip:** "Use the eye icon in the app bar to quickly toggle amount visibility."

### Settings Screen Integration

- New "Security" row in main Settings screen between existing sections
- Shows subtitle: "PIN, biometrics & privacy"
- Chevron `›` indicates navigation to dedicated page

---

## Shared Infrastructure

### Lifecycle Observer

A single `AppLifecycleObserver` (mixin on a widget or standalone class) handles both features:
- On `paused` → record timestamp
- On `resumed` after >30s →
  - Set `appLockProvider.isLocked = true` (if PIN exists)
  - Set `privacyProvider.isSessionVerified = false`
  - If `maskOnLaunch` is enabled → set `privacyProvider.isMasked = true`

### SecurePinService

Single service used by both lock screen and privacy unmask:
- `Future<void> setPin(String pin)` — hash with SHA-256 and store in flutter_secure_storage
- `Future<bool> verifyPin(String pin)` — verify against stored hash
- `Future<void> clearPin()` — remove from secure storage
- `Future<bool> hasPinSet()` — check if PIN exists
- `Future<bool> authenticateBiometric()` — trigger local_auth
- `Future<bool> isBiometricAvailable()` — check device capability

### GoRouter Integration

```
Redirect chain (in order):
1. Not authenticated? → /auth/landing
2. Pending password reset? → /auth/reset-password
3. First time (onboarding)? → /onboarding (includes security setup prompt)
4. PIN set & app locked? → /pin-lock        ← NEW
5. Otherwise → /dashboard
```

### New Routes

```
/pin-lock              # Lock screen (not in nav stack, replaces current route)
/settings/security     # Dedicated security settings page
/settings/security/setup-pin    # PIN creation flow
/settings/security/change-pin   # Change PIN (verify old → enter new)
/settings/security/recover-pin  # Forgot PIN → password re-auth
```

---

## Design System Usage

All new screens use GOL components exclusively:
- `GOLButton` — primary/secondary actions
- `GOLIcon` — Iconsax icons (lock, eye, eye_slash, finger_scan, face_id)
- `GOLCard` — settings sections
- `GOLTextField` — password input in recovery flow
- GOL semantic colors via `Theme.of(context).extension<GOLSemanticColors>()`
- GOL spacing tokens (8pt grid)
- GOL typography tokens

### Custom Widget: PIN Keypad

- 4x3 grid: digits 1-9, biometric button, 0, backspace
- 4 dot indicators above (filled/empty based on input)
- Shake animation on wrong PIN
- Uses GOL colors and spacing
- Biometric button shows fingerprint or face icon based on device capability

---

## l10n

New ARB keys needed in `lib/l10n/app_en.arb` (and `app_fr.arb`):
- Security settings labels (App Lock, Use Biometrics, Change PIN, etc.)
- Lock screen text (Enter PIN, Forgot PIN?, Too many attempts)
- PIN setup text (Create PIN, Confirm PIN, PINs don't match)
- Recovery text (Enter account password, Reset PIN)
- Privacy labels (Hide Amounts, Require Auth, privacy tip)
- Onboarding prompt (Secure your account, Set up PIN, Skip for now)
- Reminder banner (financial data worth protecting, Set up, Dismiss)

Run `flutter gen-l10n` after adding keys.

---

## Out of Scope

- Remote PIN reset (email OTP) — may add later if password reset proves insufficient
- Per-amount selective masking — global toggle only
- Configurable lock timeout — fixed at 30 seconds for V1
- PIN complexity requirements — 4 digits only, no restrictions on repeated digits
- Multiple failed biometric handling — defers to OS-level biometric lockout
