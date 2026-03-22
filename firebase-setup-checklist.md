# Firebase Setup Checklist for Push Notifications

## Current Status

✅ **Android**: `google-services.json` found at `android/app/google-services.json`
⚠️ **iOS**: `GoogleService-Info.plist` **NOT FOUND** - needs to be added

---

## What You Need to Do

### For Android (Already Done ✅)
Your Android setup looks complete. The `google-services.json` file is in the correct location.

### For iOS (Action Required ⚠️)

**If you plan to test on iOS**, you need to:

1. **Download `GoogleService-Info.plist` from Firebase Console**:
   - Go to: https://console.firebase.google.com
   - Select your project
   - Click the gear icon → Project Settings
   - Scroll to "Your apps" section
   - Find your iOS app (if it exists) or add a new iOS app
   - Bundle ID should be: `com.yourcompany.bride` (or your actual bundle ID)
   - Download `GoogleService-Info.plist`

2. **Add to Xcode project**:
   ```bash
   # Open Xcode:
   open bride_app/ios/Runner.xcworkspace

   # Then in Xcode:
   # - Right-click "Runner" folder in the left sidebar
   # - Select "Add Files to Runner..."
   # - Navigate to your downloaded GoogleService-Info.plist
   # - Check "Copy items if needed"
   # - Make sure "Runner" target is selected
   # - Click "Add"
   ```

3. **Verify it's added**:
   ```bash
   # This should show the file:
   ls bride_app/ios/Runner/GoogleService-Info.plist
   ```

4. **APNs Setup (iOS only)**:
   - In Firebase Console → Project Settings → Cloud Messaging
   - Under "Apple app configuration", upload your APNs Authentication Key or Certificate
   - If you don't have one:
     - Go to https://developer.apple.com/account
     - Certificates, Identifiers & Profiles
     - Keys → Create a new key
     - Enable "Apple Push Notifications service (APNs)"
     - Download and upload to Firebase

**If you're only testing on Android**: You can skip the iOS setup for now.

---

## Testing Priority

### Start with Android (Fastest)

Since your Android config is ready, I recommend starting there:

```bash
# Build for Android:
cd bride_app
flutter run --release

# Or build APK to install manually:
flutter build apk --release
# APK will be at: build/app/outputs/flutter-apk/app-release.apk
```

### iOS Testing (If Needed Later)

Only set up iOS if:
- You have an Apple Developer account ($99/year)
- You have a physical iOS device (simulator doesn't support push)
- You need to test on iOS specifically

```bash
# Build for iOS (requires Mac + Xcode):
cd bride_app
flutter run --release
```

---

## Firebase Project Verification

Before testing, verify your Firebase project has:

### 1. Cloud Messaging Enabled
- Firebase Console → Build → Cloud Messaging
- Should show "Cloud Messaging API (Legacy)" as enabled

### 2. Correct Bundle/Package Names
- **Android**: Should match `android/app/build.gradle` → `applicationId`
- **iOS**: Should match `ios/Runner/Info.plist` → `CFBundleIdentifier`

### 3. Server Key (For Edge Functions)
- Firebase Console → Project Settings → Cloud Messaging
- Copy "Server Key" (starts with `AAAA...`)
- You'll need this for your Edge Functions (if using legacy FCM)

**OR** use the newer Firebase Admin SDK (recommended):
- Firebase Console → Project Settings → Service Accounts
- Click "Generate new private key"
- Download the JSON file
- Store it securely (don't commit to git!)

---

## Edge Function Configuration

Your `send-push-notification` Edge Function needs Firebase credentials.

### Check Current Setup

```bash
# View the function:
cat supabase/functions/send-push-notification/index.ts
```

### Two Options:

**Option 1: Service Account (Recommended)**
```typescript
// In send-push-notification/index.ts:
import { initializeApp, cert } from 'firebase-admin/app';
import { getMessaging } from 'firebase-admin/messaging';

const serviceAccount = Deno.env.get('FIREBASE_SERVICE_ACCOUNT_KEY');

initializeApp({
  credential: cert(JSON.parse(serviceAccount!)),
});
```

Then set environment variable:
```bash
supabase secrets set FIREBASE_SERVICE_ACCOUNT_KEY='{"type":"service_account","project_id":"...",...}'
```

**Option 2: Server Key (Legacy, Simpler for Testing)**
```typescript
// Use REST API:
const response = await fetch('https://fcm.googleapis.com/fcm/send', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': `key=${Deno.env.get('FCM_SERVER_KEY')}`,
  },
  body: JSON.stringify({
    to: fcmToken,
    notification: { title, body },
    data,
  }),
});
```

Then set environment variable:
```bash
supabase secrets set FCM_SERVER_KEY='AAAA...'
```

---

## Quick Verification Steps

Before running the full test plan:

### 1. Check Flutter Firebase Packages
```bash
cd bride_app
grep firebase pubspec.yaml
```

Should include:
- `firebase_core`
- `firebase_messaging`
- `flutter_local_notifications` (optional, for foreground notifications)

### 2. Check Firebase Initialization
```bash
grep -r "Firebase.initializeApp" bride_app/lib/
```

Should be called in `main.dart` before `runApp()`.

### 3. Check Permissions (Android)
```bash
grep -A5 "uses-permission" bride_app/android/app/src/main/AndroidManifest.xml
```

Should include:
- `android.permission.INTERNET`
- `android.permission.RECEIVE_BOOT_COMPLETED` (for background notifications)

### 4. Check Permissions (iOS)
If using iOS, verify `ios/Runner/Info.plist` has:
```xml
<key>UIBackgroundModes</key>
<array>
  <string>remote-notification</string>
</array>
```

---

## Ready to Test?

Once you've confirmed:
- ✅ Firebase config files in place (at least Android)
- ✅ Packages installed (`flutter pub get`)
- ✅ Edge Function has Firebase credentials
- ✅ App builds successfully

Then proceed with the testing plan:

```bash
# 1. Build and run on your Android phone:
cd bride_app
flutter run --release

# 2. After app launches and you log in, run:
cd ..
./test-notification.sh

# 3. Choose option 1 to trigger a test notification
```

---

## Common Firebase Issues

### Issue: "Default FirebaseApp is not initialized"
**Fix**: Ensure `Firebase.initializeApp()` is called in `main.dart` before `runApp()`.

### Issue: "FirebaseMessaging: MissingPluginException"
**Fix**:
```bash
cd bride_app
flutter clean
flutter pub get
cd android && ./gradlew clean && cd ..
flutter run
```

### Issue: "google-services.json not found"
**Fix**: Download from Firebase Console and place at:
- Android: `bride_app/android/app/google-services.json`
- iOS: `bride_app/ios/Runner/GoogleService-Info.plist`

### Issue: APNs certificate errors (iOS only)
**Fix**:
1. Generate APNs auth key in Apple Developer account
2. Upload to Firebase Console → Cloud Messaging → APNs Authentication Key
3. Ensure bundle ID matches exactly

### Issue: "Notifications not working on iOS"
**Possible causes**:
- Testing on simulator (doesn't support push) → Use physical device
- APNs not configured → Upload certificate/key to Firebase
- Permissions denied → Check Settings → Your App → Notifications

---

## Next Steps

1. **If Android config is ready** → Start testing! Use `./test-notification.sh`
2. **If iOS needed** → Set up `GoogleService-Info.plist` and APNs first
3. **If Firebase credentials missing** → Add server key or service account to Edge Functions

Once everything is configured, follow the **Quick Reference Card** (`notification-quick-reference.md`) for testing.

---

## Help & Resources

- **Firebase Setup**: https://firebase.google.com/docs/flutter/setup
- **FCM Setup**: https://firebase.google.com/docs/cloud-messaging/flutter/client
- **APNs Setup**: https://firebase.google.com/docs/cloud-messaging/ios/certs
- **Test Notification Tool**: `./test-notification.sh`
- **Full Test Plan**: `notification-testing-plan.md`

**Questions?** Check the Firebase Console logs or Edge Function logs first - 90% of issues show up there.
