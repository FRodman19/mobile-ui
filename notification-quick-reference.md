# Notification Testing Quick Reference Card

## 🚀 Instant Test (No Waiting for Cron)

```bash
# 1. Build and run on your phone
cd bride_app && flutter run --release

# 2. After login, get your user ID from Settings screen or run:
# (Check Supabase Auth dashboard)

# 3. Trigger a test notification immediately:
./test-notification.sh
# Choose option 1 or 2

# 4. Check your phone within 5-10 seconds
```

---

## 📱 Get Your Test Values

### User ID
```dart
// In the app, add this to any screen:
debugPrint('My User ID: ${SupabaseConfig.client.auth.currentUser?.id}');
```

Or check: **Supabase Dashboard → Authentication → Users → Copy UUID**

### Supabase URL & Anon Key
**Supabase Dashboard → Project Settings → API**
- URL: `https://xxxxx.supabase.co`
- Anon Key: `eyJhbG...` (long JWT string)

---

## 🔍 Essential SQL Queries

### 1. Check if FCM token is registered
```sql
SELECT device_name, platform, fcm_token, updated_at
FROM user_devices
WHERE user_id = 'YOUR-USER-ID'
ORDER BY updated_at DESC;
```
**Expected**: 1+ rows with your device and recent timestamp

### 2. View all your notifications
```sql
SELECT title, body, data->>'is_read' AS is_read, sent_at
FROM notifications
WHERE user_id = 'YOUR-USER-ID'
ORDER BY sent_at DESC
LIMIT 10;
```

### 3. Check reminder settings
```sql
SELECT reminder_enabled, reminder_time, timezone
FROM user_preferences
WHERE user_id = 'YOUR-USER-ID';
```

### 4. Test timezone conversion
```sql
SELECT convert_local_time_to_utc_hour(
  CURRENT_DATE,
  '20:00:00'::TIME,
  'Africa/Douala'
) AS utc_hour;
```
**Expected**: Returns 19 (for Douala, UTC+1)

---

## 🧪 Manual Push via cURL

```bash
# Trigger daily reminder:
curl -X POST 'https://YOUR-PROJECT.supabase.co/functions/v1/daily-reminder' \
  -H 'Authorization: Bearer YOUR-ANON-KEY' \
  -H 'Content-Type: application/json'

# Send custom notification:
curl -X POST 'https://YOUR-PROJECT.supabase.co/functions/v1/send-push-notification' \
  -H 'Authorization: Bearer YOUR-ANON-KEY' \
  -H 'Content-Type: application/json' \
  -d '{
    "userId": "YOUR-USER-ID",
    "title": "Test",
    "body": "Hello from cURL",
    "data": {"type": "test"}
  }'
```

---

## ✅ Quick Verification Checklist

After building and running on your phone:

- [ ] App opens and you can log in
- [ ] Notification permission prompt appears (first launch)
- [ ] Grant permission
- [ ] Check `user_devices` table has your FCM token (SQL query #1)
- [ ] Run `./test-notification.sh` and choose option 1
- [ ] Push notification appears on your phone within 10 seconds
- [ ] Open notification center in app
- [ ] Notification appears in the list
- [ ] All notifications are marked as read (check SQL query #2)

---

## 🐛 Troubleshooting

### No push received?
1. **Check token**: Run SQL query #1. No token = app didn't register.
2. **Check logs**: `supabase functions logs send-push-notification --limit 20`
3. **Check permissions**: Device Settings → Your App → Notifications (must be ON)
4. **Check Firebase**: Verify `google-services.json` / `GoogleService-Info.plist` exists

### Wrong timing?
1. **Check timezone**: Run SQL query #3. Should show your actual timezone.
2. **Test conversion**: Run SQL query #4 with your reminder time.
3. **Check cron**:
```sql
SELECT status, start_time FROM cron.job_run_details
WHERE jobid = (SELECT jobid FROM cron.job WHERE jobname = 'daily-reminder')
ORDER BY start_time DESC LIMIT 5;
```

### Notifications not marking as read?
1. **Check migrations**: Verify `mark_notification_read` function exists:
```sql
SELECT routine_name FROM information_schema.routines
WHERE routine_name = 'mark_notification_read';
```
2. **Test manually**:
```sql
SELECT mark_notification_read('NOTIFICATION-ID', 'YOUR-USER-ID');
```

---

## 📊 Debug Widget (In-App Testing)

Add to your Settings screen (debug builds only):

```dart
import 'package:flutter/foundation.dart';
import '../features/notifications/widgets/notification_debug_panel.dart';

// Inside your Settings screen build method:
if (kDebugMode) {
  const NotificationDebugPanel(),
}
```

This adds a collapsible panel with:
- Trigger daily reminder button
- Send custom notification
- Check FCM token
- View preferences

---

## 🎯 Test Scenarios Priority

**Must Test (Critical)**:
1. ✅ Token registration on first launch
2. ✅ Manual trigger works (`./test-notification.sh`)
3. ✅ Notification appears in app's notification center
4. ✅ Opening notification center marks all as read

**Should Test (Important)**:
5. ✅ Automatic daily reminder at configured time
6. ✅ Per-tracker reminders work
7. ✅ Tapping notification navigates to correct screen

**Nice to Test (Optional)**:
8. ✅ Token refresh after 24-48 hours
9. ✅ Multi-device sync
10. ✅ Permission denial recovery

---

## 📝 Where to Get Help

1. **Edge Function Logs**:
   - Dashboard: `https://your-project.supabase.co/project/_/functions`
   - CLI: `supabase functions logs daily-reminder --limit 50`

2. **Database Logs** (errors):
   - Dashboard: `https://your-project.supabase.co/project/_/logs/postgres-logs`

3. **Test Script**: `./test-notification.sh` has built-in helpers

4. **Full Guide**: See `notification-testing-plan.md` for detailed scenarios

---

## 🔄 Reset Everything (Start Fresh)

```sql
-- Delete all your notifications:
DELETE FROM notifications WHERE user_id = 'YOUR-USER-ID';

-- Delete all your device tokens:
DELETE FROM user_devices WHERE user_id = 'YOUR-USER-ID';

-- Reset your preferences:
UPDATE user_preferences
SET reminder_enabled = false, reminder_time = '20:00:00', timezone = 'Africa/Douala'
WHERE user_id = 'YOUR-USER-ID';
```

Then:
1. Uninstall app from phone
2. Reinstall and log in
3. Start testing from scratch

---

## 💡 Pro Tips

- **Use test-notification.sh**: Fastest way to test without waiting for cron
- **Check logs first**: 90% of issues show up in Edge Function logs
- **Test on real device**: iOS simulator doesn't support push notifications
- **Android emulator works**: If it has Google Play Services
- **Foreground vs Background**: Test both (app open vs app closed)
- **Airplane mode**: Test offline behavior (notifications queue in DB)

---

## ⏱️ Expected Latencies

- Manual trigger → Push received: **5-10 seconds**
- Cron job → Push received: **Within 1 minute of scheduled hour**
- Token registration → DB updated: **Immediate (< 1 second)**
- Mark as read → DB updated: **Immediate (< 1 second)**
- Multi-device sync: **< 5 seconds after refresh**

---

## 🎉 Success Criteria

Your notification system is working perfectly when:

✅ Push notifications arrive on your phone reliably
✅ They appear at the exact time you configured
✅ They show up in the app's notification center
✅ Opening the center marks them all as read
✅ Tapping a notification navigates to the right screen
✅ Everything works after logout/login
✅ Multiple devices receive the same notifications

**If all of the above work → Ship it! 🚀**
