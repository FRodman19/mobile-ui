# Notification System Testing Plan

## Overview
This document outlines how to realistically test all notification features on a physical device, covering all user scenarios from setup to push delivery.

---

## Prerequisites

### 1. Firebase Project Setup
- [ ] Firebase project created and linked to the app
- [ ] APNs certificate/key uploaded (iOS) or FCM configured (Android)
- [ ] `google-services.json` (Android) / `GoogleService-Info.plist` (iOS) in project
- [ ] App bundle ID matches Firebase project

### 2. Supabase Edge Functions Deployed
```bash
# Verify these functions are deployed:
supabase functions list

# Should show:
# - daily-reminder (version 6+)
# - send-push-notification
```

### 3. Database Migrations Applied
```bash
# Check migrations are applied:
supabase db diff --schema public

# Should include:
# - mark_notification_read function
# - mark_all_notifications_read function
# - convert_local_time_to_utc_hour function
```

### 4. pg_cron Job Active
```sql
-- Verify cron job exists:
SELECT * FROM cron.job WHERE jobname = 'daily-reminder';

-- Should return 1 row with schedule '0 * * * *' (every hour)
```

---

## Test Scenarios

### Scenario 1: FCM Token Registration (First Launch)
**Goal**: Verify token is saved to `user_devices` on first app launch

**Steps**:
1. Uninstall the app completely from your phone
2. Clear app data if needed
3. Install fresh build via `flutter run` or release APK/IPA
4. Sign up for a new account OR log in with existing account
5. Grant notification permissions when prompted

**Verification**:
```sql
-- Check your token is in the database:
SELECT * FROM user_devices
WHERE user_id = '<your-user-id>'
ORDER BY updated_at DESC;

-- Should show:
-- - fcm_token: starts with long alphanumeric string
-- - device_name: your phone model
-- - platform: 'android' or 'ios'
-- - updated_at: just now
```

**Expected Result**: ✅ Token saved immediately after login

---

### Scenario 2: FCM Token Refresh
**Goal**: Verify token updates are persisted when Firebase rotates tokens

**Steps**:
1. Keep the app installed
2. Wait 24-48 hours (Firebase typically rotates tokens periodically)
3. OR force token refresh by clearing Firebase cache (advanced)

**Verification**:
```sql
-- Check token was updated:
SELECT fcm_token, updated_at
FROM user_devices
WHERE user_id = '<your-user-id>'
ORDER BY updated_at DESC;

-- updated_at should be recent if token rotated
```

**Expected Result**: ✅ New token automatically saved without user action

---

### Scenario 3: Daily Reminder - Manual Trigger
**Goal**: Test the daily reminder system by manually invoking the Edge Function

**Steps**:

1. **Set your reminder preferences in the app**:
   - Go to Settings
   - Enable "Daily Reminders"
   - Set time to 5 minutes from now (e.g., if it's 2:30 PM, set to 2:35 PM)
   - Save settings

2. **Verify settings saved to Supabase**:
```sql
SELECT reminder_enabled, reminder_time, timezone
FROM user_preferences
WHERE user_id = '<your-user-id>';

-- Should show:
-- reminder_enabled: true
-- reminder_time: your selected time
-- timezone: 'Africa/Douala' or your timezone
```

3. **Manually trigger the daily reminder function** (don't wait for cron):
```bash
# Call the Edge Function directly:
curl -i --location --request POST 'https://<your-project-ref>.supabase.co/functions/v1/daily-reminder' \
  --header 'Authorization: Bearer <your-anon-key>' \
  --header 'Content-Type: application/json'
```

4. **Check notification was created in database**:
```sql
SELECT id, title, body, data, sent_at
FROM notifications
WHERE user_id = '<your-user-id>'
ORDER BY sent_at DESC
LIMIT 1;

-- Should show new notification with:
-- title: "Daily Reminder"
-- body: "Don't forget to track..."
-- data.is_read: false
-- sent_at: just now
```

5. **Check your phone** - you should receive a push notification within seconds

**Expected Result**:
- ✅ Push notification appears on lock screen/notification tray
- ✅ Notification saved to database
- ✅ Notification appears in app's notification center

---

### Scenario 4: Daily Reminder - Automatic (Cron)
**Goal**: Verify reminders are sent automatically at the user's configured time

**Steps**:

1. **Set reminder time to next hour**:
   - Example: If it's 2:45 PM, set reminder to 3:00 PM
   - Save settings

2. **Verify timezone conversion is correct**:
```sql
-- Test the conversion function:
SELECT convert_local_time_to_utc_hour(
  CURRENT_DATE,
  '15:00:00'::TIME,
  'Africa/Douala'
) AS utc_hour;

-- For 3:00 PM Douala time, should return 14 (2 PM UTC)
```

3. **Wait for the next hour** (cron runs at minute 0 of every hour)

4. **At the scheduled time, check logs**:
```bash
# View Edge Function logs:
supabase functions logs daily-reminder --limit 20
```

5. **Verify notification received on phone**

**Expected Result**:
- ✅ Push arrives at exact configured time (accounting for timezone)
- ✅ Notification center shows new notification
- ✅ Badge count updates (if implemented)

---

### Scenario 5: Per-Tracker Reminders
**Goal**: Test tracker-specific reminder notifications

**Steps**:

1. **Create a tracker with custom reminder**:
   - Go to Trackers screen
   - Create/edit a tracker (e.g., "Marketing Budget")
   - Enable "Custom Reminder"
   - Set time to 10 minutes from now
   - Save

2. **Verify tracker preferences saved**:
```sql
SELECT data->'trackers'
FROM user_preferences
WHERE user_id = '<your-user-id>';

-- Should include your tracker with:
-- trackerId: <uuid>
-- reminderEnabled: true
-- reminderTime: your set time
```

3. **Wait for scheduled time**

4. **Check notification body is tracker-specific**:
```sql
SELECT title, body, data
FROM notifications
WHERE user_id = '<your-user-id>'
  AND data->>'tracker_id' = '<your-tracker-id>'
ORDER BY sent_at DESC
LIMIT 1;

-- body should mention your tracker name:
-- "Don't forget to track today's revenue and spend for Marketing Budget"
```

**Expected Result**:
- ✅ Push notification mentions specific tracker name
- ✅ Tapping notification navigates to that tracker's detail screen
- ✅ Notification shows in notification center with tracker context

---

### Scenario 6: Mark All as Read (Screen Open)
**Goal**: Verify all notifications are marked read when opening notification center

**Steps**:

1. **Generate some notifications** (use manual trigger from Scenario 3 a few times)

2. **Verify notifications are unread**:
```sql
SELECT id, data->>'is_read' AS is_read
FROM notifications
WHERE user_id = '<your-user-id>'
ORDER BY sent_at DESC
LIMIT 5;

-- All should show is_read: 'false'
```

3. **Open the notification center screen in the app**

4. **Check database immediately after**:
```sql
SELECT id, data->>'is_read' AS is_read
FROM notifications
WHERE user_id = '<your-user-id>'
ORDER BY sent_at DESC
LIMIT 5;

-- All should now show is_read: 'true'
```

**Expected Result**:
- ✅ All notifications marked read the moment screen opens
- ✅ Badge count drops to 0 (if implemented)
- ✅ No "Mark all as read" button visible

---

### Scenario 7: Notification Navigation
**Goal**: Test tapping a notification navigates to the correct screen

**Steps**:

1. **Create a notification with navigation data** (can test via SQL insert):
```sql
INSERT INTO notifications (user_id, title, body, data)
VALUES (
  '<your-user-id>',
  'Test Navigation',
  'Tap to go to tracker detail',
  jsonb_build_object(
    'is_read', false,
    'type', 'reminder',
    'tracker_id', '<existing-tracker-id>',
    'action_screen', '/tracker/<tracker-id>',
    'action_data', jsonb_build_object('trackerId', '<tracker-id>')
  )
);
```

2. **Trigger push delivery** (call `send-push-notification` function directly or via daily-reminder)

3. **Receive push on phone and tap it**

4. **Verify app opens to correct screen** (tracker detail page)

**Expected Result**:
- ✅ Tapping push opens app
- ✅ App navigates directly to tracker detail screen
- ✅ Correct tracker data is displayed

---

### Scenario 8: Notification Expiry
**Goal**: Test that expired notifications are pruned

**Steps**:

1. **Create an expired notification**:
```sql
INSERT INTO notifications (user_id, title, body, data)
VALUES (
  '<your-user-id>',
  'Expired Test',
  'This should be deleted',
  jsonb_build_object(
    'is_read', false,
    'expires_at', (NOW() - INTERVAL '1 day')::TEXT
  )
);
```

2. **Verify it's in the database**:
```sql
SELECT id, title, data->>'expires_at'
FROM notifications
WHERE user_id = '<your-user-id>'
  AND title = 'Expired Test';
```

3. **Restart the app** (this triggers `_initializeAsync` which calls `deleteExpired`)

4. **Check it's been deleted**:
```sql
SELECT id, title
FROM notifications
WHERE user_id = '<your-user-id>'
  AND title = 'Expired Test';

-- Should return 0 rows
```

**Expected Result**:
- ✅ Expired notifications are automatically deleted on app startup
- ✅ They don't appear in notification center
- ✅ Only active notifications remain

---

### Scenario 9: Multi-Device Sync
**Goal**: Verify notifications sync across multiple devices

**Steps**:

1. **Install app on two devices** (e.g., your phone + emulator)

2. **Log in with same account on both**

3. **Verify both tokens registered**:
```sql
SELECT device_name, platform, fcm_token, updated_at
FROM user_devices
WHERE user_id = '<your-user-id>'
ORDER BY updated_at DESC;

-- Should show 2 rows (one per device)
```

4. **Trigger a notification** (manual daily reminder)

5. **Check both devices receive the push**

6. **Mark as read on Device 1** (open notification center)

7. **Check Device 2** (pull to refresh in notification center)

**Expected Result**:
- ✅ Both devices receive push simultaneously
- ✅ Marking read on one device syncs to other device
- ✅ Notification center state consistent across devices

---

### Scenario 10: Permission Denial Recovery
**Goal**: Test the flow when user denies notification permissions

**Steps**:

1. **Uninstall app**

2. **Reinstall and log in**

3. **Deny notification permissions when prompted**

4. **Verify token is still attempted to be saved** (may be null/empty)

5. **Go to Settings > Notifications in app**

6. **Toggle "Enable Notifications"**

7. **App should prompt to open system settings**

8. **Enable permissions in system settings**

9. **Return to app and verify token now saves**

**Expected Result**:
- ✅ App gracefully handles permission denial
- ✅ Settings UI reflects permission state
- ✅ Re-enabling permissions registers token without app restart

---

## Debugging Tools

### View All Your Notifications
```sql
SELECT
  id,
  title,
  body,
  data->>'is_read' AS is_read,
  data->>'type' AS type,
  data->>'tracker_id' AS tracker_id,
  data->>'expires_at' AS expires_at,
  sent_at,
  created_at
FROM notifications
WHERE user_id = '<your-user-id>'
ORDER BY sent_at DESC;
```

### View All Your Devices
```sql
SELECT
  id,
  device_name,
  platform,
  fcm_token,
  is_active,
  created_at,
  updated_at
FROM user_devices
WHERE user_id = '<your-user-id>'
ORDER BY updated_at DESC;
```

### View Your Preferences
```sql
SELECT
  reminder_enabled,
  reminder_time,
  timezone,
  weekly_summary_enabled,
  data->'trackers' AS tracker_reminders
FROM user_preferences
WHERE user_id = '<your-user-id>';
```

### Manually Send Test Push
```bash
# Call send-push-notification directly:
curl -i --location --request POST \
  'https://<your-project-ref>.supabase.co/functions/v1/send-push-notification' \
  --header 'Authorization: Bearer <your-anon-key>' \
  --header 'Content-Type: application/json' \
  --data '{
    "userId": "<your-user-id>",
    "title": "Test Push",
    "body": "This is a manual test notification",
    "data": {
      "type": "test",
      "action_screen": "/settings"
    }
  }'
```

### Check Edge Function Logs
```bash
# Daily reminder logs:
supabase functions logs daily-reminder --limit 50

# Push sender logs:
supabase functions logs send-push-notification --limit 50
```

### Check Cron Job Executions
```sql
SELECT * FROM cron.job_run_details
WHERE jobid = (SELECT jobid FROM cron.job WHERE jobname = 'daily-reminder')
ORDER BY start_time DESC
LIMIT 10;
```

---

## Common Issues & Fixes

### Issue 1: No Push Received
**Possible Causes**:
- FCM token not registered → Check `user_devices` table
- Firebase credentials invalid → Verify `google-services.json` / `GoogleService-Info.plist`
- Push permissions denied → Check device settings
- Edge Function failed → Check function logs

**Debug**:
```bash
# Check if notification was created in DB:
SELECT * FROM notifications WHERE user_id = '<your-user-id>' ORDER BY sent_at DESC LIMIT 1;

# If notification exists but no push, check send-push-notification logs:
supabase functions logs send-push-notification --limit 20
```

### Issue 2: Wrong Timing
**Possible Causes**:
- Timezone not saved → Check `user_preferences.timezone`
- Cron job not running → Check `cron.job_run_details`
- Conversion function error → Test `convert_local_time_to_utc_hour` manually

**Debug**:
```sql
-- Test your specific time:
SELECT convert_local_time_to_utc_hour(
  CURRENT_DATE,
  '<your-reminder-time>'::TIME,
  '<your-timezone>'
) AS should_send_at_utc_hour;

-- Check when cron last ran:
SELECT status, start_time, end_time
FROM cron.job_run_details
WHERE jobid = (SELECT jobid FROM cron.job WHERE jobname = 'daily-reminder')
ORDER BY start_time DESC
LIMIT 5;
```

### Issue 3: Notifications Not Marked as Read
**Possible Causes**:
- RPC function not deployed → Check migrations applied
- Permission error → Check RLS policies on `notifications` table

**Debug**:
```sql
-- Test RPC function directly:
SELECT mark_notification_read('<notification-id>', '<your-user-id>');

-- Check if it updated:
SELECT data->>'is_read' FROM notifications WHERE id = '<notification-id>';
```

### Issue 4: Duplicate Notifications
**Possible Causes**:
- Multiple devices registered with same token
- Cron job running multiple times

**Debug**:
```sql
-- Check for duplicate tokens:
SELECT fcm_token, COUNT(*)
FROM user_devices
WHERE user_id = '<your-user-id>'
GROUP BY fcm_token
HAVING COUNT(*) > 1;

-- Check cron execution frequency:
SELECT COUNT(*), DATE_TRUNC('hour', start_time) AS hour
FROM cron.job_run_details
WHERE jobid = (SELECT jobid FROM cron.job WHERE jobname = 'daily-reminder')
GROUP BY hour
ORDER BY hour DESC;
```

---

## Test Checklist

Use this checklist to systematically verify all scenarios:

- [ ] **Scenario 1**: FCM token saved on first launch
- [ ] **Scenario 2**: Token refresh updates database
- [ ] **Scenario 3**: Manual daily reminder works
- [ ] **Scenario 4**: Automatic cron-based reminder works
- [ ] **Scenario 5**: Per-tracker reminders work
- [ ] **Scenario 6**: Mark all as read on screen open
- [ ] **Scenario 7**: Notification navigation works
- [ ] **Scenario 8**: Expired notifications pruned
- [ ] **Scenario 9**: Multi-device sync works
- [ ] **Scenario 10**: Permission denial recovery works

---

## Quick Start for Immediate Testing

If you want to test RIGHT NOW without waiting for cron:

1. **Build and run the app on your phone**:
```bash
cd bride_app
flutter run --release
```

2. **Log in and grant notification permissions**

3. **Verify token in database** (see Scenario 1 SQL query)

4. **Manually trigger a push**:
```bash
# Replace placeholders with your actual values:
curl -X POST 'https://<project-ref>.supabase.co/functions/v1/daily-reminder' \
  -H 'Authorization: Bearer <anon-key>' \
  -H 'Content-Type: application/json'
```

5. **Check your phone** - push should arrive within 5-10 seconds

6. **Open notification center in app** - notification should appear and immediately mark as read

---

## Next Steps After Testing

Once all scenarios pass:
1. Document any issues found
2. Set up automated monitoring for push delivery success rate
3. Consider adding in-app "Test Notification" button in Settings (debug builds only)
4. Set up alerting for Edge Function failures
5. Monitor `cron.job_run_details` for failed cron executions

---

## Notes

- **Testing on iOS requires physical device** (push notifications don't work on simulator)
- **Android emulator with Google Play** can receive push notifications
- **Rate limiting**: Firebase has limits on push frequency; for testing, use manual triggers
- **Background delivery**: Test both foreground (app open) and background (app closed) scenarios
- **Production vs Development**: Use different Firebase projects for dev/prod to avoid mixing test data

