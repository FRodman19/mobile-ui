# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**Grow Out Loud** - A Flutter mobile application with an execution system focus. The app features a clean, modern design with both light and dark mode support.

## ⚠️ CRITICAL: Design System First Approach

**ALWAYS use the Grow Out Loud (GOL) design system** when building any UI component or feature:

### Design System Location
- **Components**: `lib/grow_out_loud/components/`
- **Foundation**: `lib/grow_out_loud/foundation/`
- **Gallery/Reference**: `lib/screens/grow_out_loud_gallery_screen.dart` (Run in debug mode: `/design-system-v3`)

### Mandatory Rules
1. **NEVER create custom UI components** - Always use existing GOL components first
2. **NEVER use arbitrary spacing** - Use `GOLSpacing` constants (8pt grid system)
3. **NEVER use custom colors** - Use `GOLSemanticColors` from theme
4. **NEVER use arbitrary font sizes** - Use `textTheme` styles from `GOLTypography`
5. **If a component doesn't exist** - Create it following GOL patterns and add it to the gallery

### Quick Reference
```dart
// ✅ CORRECT - Use design system
GOLButton(label: 'Save', onPressed: () {})
SizedBox(height: GOLSpacing.space4)  // 16px, follows 8pt grid
Text('Title', style: Theme.of(context).textTheme.headlineSmall)
color: colors.textPrimary

// ❌ WRONG - Custom implementation
ElevatedButton(child: Text('Save'), onPressed: () {})
SizedBox(height: 15)  // Arbitrary spacing breaks grid
Text('Title', style: TextStyle(fontSize: 17))  // Arbitrary size
color: Color(0xFF123456)  // Hardcoded color
```

### Available Components
- Buttons: `GOLButton` (primary, secondary, tertiary, destructive)
- Cards: `GOLCard` (standard, elevated)
- Inputs: `GOLTextField`, `GOLSearchField`, `GOLDropdown`
- Lists: `GOLListItem`, `GOLCheckboxTile`, `GOLRadioTile`, `GOLSwitchTile`
- Progress: `GOLLinearProgress`, `GOLCircularProgress`, `GOLGridLoader`
- Navigation: `GOLAppBar`, `GOLTabBar`, `GOLBottomNav`
- Feedback: `GOLChip`, `GOLBadge`, `GOLDivider`, `GOLSkeleton`
- Overlays: `showGOLDialog`, `showGOLBottomSheet`, `showGOLToast`

### 8-Point Grid System
All spacing MUST follow multiples of 8px (or 4px for very small spacing):
- `GOLSpacing.space1` = 4px (small exception)
- `GOLSpacing.space2` = 8px ✓
- `GOLSpacing.space4` = 16px ✓ (default)
- `GOLSpacing.space6` = 24px ✓
- `GOLSpacing.space7` = 32px ✓ (sections)

See: `lib/grow_out_loud/foundation/SPACING_GUIDE.md`

### Typography Scale
Use semantic text styles from theme:
- Headlines: `displayLarge/Medium/Small`, `headlineLarge/Medium/Small`
- Body: `bodyLarge/Medium/Small` (bodyMedium is default)
- UI: `labelLarge/Medium/Small` (for buttons, tabs)
- Special: `GOLTypography.caption/overline/micro/mono`

See: `lib/grow_out_loud/foundation/TYPOGRAPHY_GUIDE.md`

### When Building New Features
1. Check `grow_out_loud_gallery_screen.dart` for existing components
2. Use GOL components exclusively
3. If component missing: Create it in `components/` following existing patterns
4. Add new component to gallery with usage example
5. Maintain 8pt grid and typography scale

## Development Commands

### Running the App

```bash
# Run on connected device (physical or emulator)
flutter run

# Run on specific device
flutter run -d <device-id>

# Run with hot reload enabled (default in debug mode)
flutter run

# List available devices
flutter devices
```

### Building

```bash
# Build APK for Android
flutter build apk

# Build release APK
flutter build apk --release

# Build app bundle (for Play Store)
flutter build appbundle
```

### Testing & Code Quality

```bash
# Run tests
flutter test

# Run tests with coverage
flutter test --coverage

# Analyze code
flutter analyze

# Format code
dart format lib/
```

### Dependencies

```bash
# Get dependencies
flutter pub get

# Upgrade dependencies
flutter pub upgrade

# Check for outdated packages
flutter pub outdated
```

### Cleaning Build Artifacts

```bash
# Clean build files
flutter clean

# Clean and get dependencies
flutter clean && flutter pub get
```

## Architecture

### Navigation Flow

1. **SplashScreen** (entry point) → Displays app logo and tagline for 2 seconds
2. **WelcomeScreen** → First onboarding screen
3. **FeatureCarouselScreen** → Shows app features
4. **AuthChoiceScreen** → User chooses sign in or sign up
5. **CreateAccountScreen** → Account creation flow

### Theme System

- **Primary color**: Green (#22C55E) for light mode, Bright green (#4ADE80) for dark mode
- **Material 3** design system
- **Automatic theme switching** based on system preferences
- Custom color scheme defined in `main.dart`

### Code Organization

```
lib/
├── main.dart                    # App entry point, theme configuration
├── grow_out_loud/              # Design system (GOL)
│   ├── components/             # Reusable UI components
│   │   ├── gol_buttons.dart
│   │   ├── gol_cards.dart
│   │   ├── gol_inputs.dart
│   │   └── ... (all components)
│   └── foundation/             # Design tokens
│       ├── gol_colors.dart
│       ├── gol_spacing.dart
│       ├── gol_typography.dart
│       ├── gol_radius.dart
│       ├── gol_theme.dart
│       ├── SPACING_GUIDE.md
│       └── TYPOGRAPHY_GUIDE.md
└── screens/                    # Application screens
    ├── home_screen.dart
    ├── performance_screen.dart
    ├── content_screen.dart
    ├── assistant_screen.dart
    └── grow_out_loud_gallery_screen.dart  # Design system gallery
```

## Device Setup

### Physical Device Testing (Pixel 9 Pro XL)

The project is configured for testing on Pixel 9 Pro XL (Android 16, API 36).

```bash
# Enable wireless debugging (after USB pairing)
adb tcpip 5555
adb connect <PHONE_IP>:5555

# Verify wireless connection
flutter devices
```

### Hot Reload

- Press `r` in terminal for hot reload
- Press `R` for hot restart
- Changes apply automatically in debug mode when saving files

## Environment

- **Flutter**: 3.38.5 (stable)
- **Dart SDK**: ^3.10.4
- **Android SDK**: 36.1.0
- **Target Platform**: Android (primary), supports macOS and web

## Key Dependencies

- `cupertino_icons: ^1.0.8` - iOS-style icons
- `flutter_lints: ^6.0.0` - Recommended lints for code quality
