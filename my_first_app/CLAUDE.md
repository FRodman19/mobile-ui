# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**Grow Out Loud** - A Flutter mobile application with an execution system focus. The app features a green-themed design with both light and dark mode support.

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
├── main.dart              # App entry point, theme configuration
└── screens/               # All screen widgets
    ├── splash_screen.dart
    ├── welcome_screen.dart
    ├── feature_carousel_screen.dart
    ├── auth_choice_screen.dart
    └── create_account_screen.dart
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
