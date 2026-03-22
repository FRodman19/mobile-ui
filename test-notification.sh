#!/bin/bash

# Notification Testing Helper Script
# Run this script to quickly test push notifications without waiting for cron

set -e

echo "🔔 Notification Testing Helper"
echo "=============================="
echo ""

# Check if .env file exists for Supabase credentials
if [ ! -f ".env" ]; then
  echo "❌ .env file not found. Creating template..."
  cat > .env << 'EOF'
# Supabase Configuration
SUPABASE_URL=https://your-project-ref.supabase.co
SUPABASE_ANON_KEY=your-anon-key-here
TEST_USER_ID=your-user-id-here
EOF
  echo "✅ Created .env template. Please fill in your credentials and run again."
  exit 1
fi

# Load environment variables
source .env

# Validate required variables
if [ -z "$SUPABASE_URL" ] || [ "$SUPABASE_URL" = "https://your-project-ref.supabase.co" ]; then
  echo "❌ SUPABASE_URL not configured in .env"
  exit 1
fi

if [ -z "$SUPABASE_ANON_KEY" ] || [ "$SUPABASE_ANON_KEY" = "your-anon-key-here" ]; then
  echo "❌ SUPABASE_ANON_KEY not configured in .env"
  exit 1
fi

if [ -z "$TEST_USER_ID" ] || [ "$TEST_USER_ID" = "your-user-id-here" ]; then
  echo "❌ TEST_USER_ID not configured in .env"
  exit 1
fi

echo "Configuration loaded:"
echo "  Supabase URL: $SUPABASE_URL"
echo "  User ID: $TEST_USER_ID"
echo ""

# Menu
echo "Select test scenario:"
echo ""
echo "  1) Trigger daily reminder (all trackers)"
echo "  2) Send custom test notification"
echo "  3) Check FCM token registration"
echo "  4) View recent notifications"
echo "  5) View user preferences"
echo "  6) Test timezone conversion"
echo "  7) Check cron job status"
echo "  8) View Edge Function logs (daily-reminder)"
echo "  9) View Edge Function logs (send-push-notification)"
echo "  0) Exit"
echo ""
read -p "Enter choice [0-9]: " choice

case $choice in
  1)
    echo ""
    echo "📤 Triggering daily reminder Edge Function..."
    echo ""

    response=$(curl -s -X POST "${SUPABASE_URL}/functions/v1/daily-reminder" \
      -H "Authorization: Bearer ${SUPABASE_ANON_KEY}" \
      -H "Content-Type: application/json")

    echo "Response: $response"
    echo ""
    echo "✅ Check your phone for push notification!"
    echo "💡 If no push received, check logs with option 8"
    ;;

  2)
    echo ""
    echo "📝 Custom test notification"
    echo ""
    read -p "Enter title: " title
    read -p "Enter body: " body
    read -p "Enter action screen (optional, e.g., /settings): " action_screen

    data_json="{\"type\":\"test\""
    if [ -n "$action_screen" ]; then
      data_json="${data_json},\"action_screen\":\"${action_screen}\""
    fi
    data_json="${data_json}}"

    payload=$(cat <<EOF
{
  "userId": "${TEST_USER_ID}",
  "title": "${title}",
  "body": "${body}",
  "data": ${data_json}
}
EOF
)

    echo ""
    echo "📤 Sending custom notification..."
    echo "Payload: $payload"
    echo ""

    response=$(curl -s -X POST "${SUPABASE_URL}/functions/v1/send-push-notification" \
      -H "Authorization: Bearer ${SUPABASE_ANON_KEY}" \
      -H "Content-Type: application/json" \
      -d "$payload")

    echo "Response: $response"
    echo ""
    echo "✅ Check your phone for push notification!"
    ;;

  3)
    echo ""
    echo "🔍 Checking FCM token registration..."
    echo ""
    echo "Run this query in Supabase SQL Editor:"
    echo ""
    echo "SELECT device_name, platform, fcm_token, is_active, updated_at"
    echo "FROM user_devices"
    echo "WHERE user_id = '${TEST_USER_ID}'"
    echo "ORDER BY updated_at DESC;"
    echo ""
    echo "Expected: At least 1 row with your device and recent updated_at"
    ;;

  4)
    echo ""
    echo "🔍 Viewing recent notifications..."
    echo ""
    echo "Run this query in Supabase SQL Editor:"
    echo ""
    echo "SELECT"
    echo "  id,"
    echo "  title,"
    echo "  body,"
    echo "  data->>'is_read' AS is_read,"
    echo "  data->>'type' AS type,"
    echo "  sent_at"
    echo "FROM notifications"
    echo "WHERE user_id = '${TEST_USER_ID}'"
    echo "ORDER BY sent_at DESC"
    echo "LIMIT 10;"
    echo ""
    ;;

  5)
    echo ""
    echo "🔍 Viewing user preferences..."
    echo ""
    echo "Run this query in Supabase SQL Editor:"
    echo ""
    echo "SELECT"
    echo "  reminder_enabled,"
    echo "  reminder_time,"
    echo "  timezone,"
    echo "  weekly_summary_enabled,"
    echo "  data->'trackers' AS tracker_reminders"
    echo "FROM user_preferences"
    echo "WHERE user_id = '${TEST_USER_ID}';"
    echo ""
    ;;

  6)
    echo ""
    echo "🌍 Testing timezone conversion..."
    echo ""
    read -p "Enter local time (HH:MM:SS, e.g., 20:00:00): " local_time
    read -p "Enter timezone (e.g., Africa/Douala): " timezone

    echo ""
    echo "Run this query in Supabase SQL Editor:"
    echo ""
    echo "SELECT convert_local_time_to_utc_hour("
    echo "  CURRENT_DATE,"
    echo "  '${local_time}'::TIME,"
    echo "  '${timezone}'"
    echo ") AS utc_hour;"
    echo ""
    echo "This tells you at which UTC hour the reminder should be sent."
    ;;

  7)
    echo ""
    echo "🔍 Checking cron job status..."
    echo ""
    echo "Run this query in Supabase SQL Editor:"
    echo ""
    echo "-- Check job is scheduled:"
    echo "SELECT jobname, schedule, active"
    echo "FROM cron.job"
    echo "WHERE jobname = 'daily-reminder';"
    echo ""
    echo "-- Check recent executions:"
    echo "SELECT status, start_time, end_time"
    echo "FROM cron.job_run_details"
    echo "WHERE jobid = (SELECT jobid FROM cron.job WHERE jobname = 'daily-reminder')"
    echo "ORDER BY start_time DESC"
    echo "LIMIT 10;"
    echo ""
    ;;

  8)
    echo ""
    echo "📋 Fetching daily-reminder logs..."
    echo ""
    echo "Run this command:"
    echo ""
    echo "supabase functions logs daily-reminder --limit 50"
    echo ""
    echo "Or view in Supabase Dashboard:"
    echo "${SUPABASE_URL}/project/_/functions/daily-reminder/logs"
    ;;

  9)
    echo ""
    echo "📋 Fetching send-push-notification logs..."
    echo ""
    echo "Run this command:"
    echo ""
    echo "supabase functions logs send-push-notification --limit 50"
    echo ""
    echo "Or view in Supabase Dashboard:"
    echo "${SUPABASE_URL}/project/_/functions/send-push-notification/logs"
    ;;

  0)
    echo "Goodbye!"
    exit 0
    ;;

  *)
    echo "❌ Invalid choice"
    exit 1
    ;;
esac

echo ""
echo "=============================="
echo "Run ./test-notification.sh again to run another test"
