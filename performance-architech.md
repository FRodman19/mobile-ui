# PERFORMANCE TRACKER APP - COMPLETE NAVIGATION & ARCHITECTURE

---

## 1. COMPLETE NAVIGATION FLOW DIAGRAM

### Entry Points & Primary Navigation

```
ENTRY POINTS:
├─ Bottom Nav [📊 Dashboard] → Screen 1 (Performance Dashboard)
├─ Bottom Nav [📈 Trackers] → Screen 35 (Trackers List View)
└─ Bottom Nav [⚙️ Settings] → Screen 34 (Settings Page)

PRIMARY NAVIGATION STRUCTURE:

Screen 1 (Performance Dashboard)
├─ Empty? → Screen 21 (Empty State) → Screen 2
├─ Has Trackers → Overview cards
│   ├─ Time filter pills (Today/Week/Month) → Updates data view
│   ├─ Quick Actions:
│   │   ├─ [+ Add Entry] → Screen 7 (for recent tracker)
│   │   ├─ [📊 Reports] → Screen 5 (for recent tracker)
│   │   └─ [⋯ More] → Additional options
│   │
│   ├─ Recent Tracker Card:
│   │   ├─ Tap card → Screen 3 (Tracker Hub - Overview)
│   │   └─ [Log Entry] button → Screen 7
│   │
│   ├─ Top Projects → Tap card → Screen 3
│   ├─ Worst Projects → Tap card → Screen 3
│   ├─ Tap [+ FAB] → Screen 2 (Create Tracker)
│   └─ Swipe card left → Quick actions menu
│
└─ CREATE FLOW (Screens 2, 18):
    Screen 2 (Create Tracker)
    ├─ [✨ Quick Start with AI] → Screen 18 (AI Setup)
    │   └─ Complete setup → Screen 30 (AI Loading) → Screen 2 (pre-filled)
    │       └─ Save → Screen 29 (Success) → Screen 3 (Hub)
    │
    ├─ Manual fill form:
    │   ├─ Project name (required)
    │   ├─ Start date (required)
    │   ├─ Target platforms (multi-select)
    │   ├─ Currency selection
    │   ├─ Goals chips (optional)
    │   ├─ Revenue/engagement targets
    │   ├─ Setup costs (optional)
    │   └─ Notes (optional)
    │
    └─ [Save] → Screen 29 (Success) → Screen 3 (Tracker Hub)

TRACKER HUB NAVIGATION (Screens 3-5):

Screen 3 (Tracker Hub - Overview Tab) ← CENTRAL HUB
├─ Tab Navigation:
│   ├─ [Overview] (current)
│   ├─ Daily Entries → Screen 4
│   ├─ Reports → Screen 5
│   └─ More → Sub-menu options
│
├─ Overview Content:
│   ├─ Tracker Stats (profit, revenue, spend)
│   ├─ Time filter pills
│   ├─ Platform Cards (click to see platform breakdown)
│   ├─ Recent Entries (last 5) → Tap → Screen 8 (Entry Detail)
│   ├─ Posts Section:
│   │   ├─ Empty? → Screen 23 (Empty State)
│   │   ├─ Has Posts → Post cards
│   │   │   └─ Tap post → Screen 11 (Posts List detail)
│   │   └─ [+ Add] → Screen 12 (Add Post Modal)
│   │
│   └─ Quick Actions on Overview:
│       ├─ [+ Log Entry] → Screen 7
│       ├─ [Edit Tracker] → Screen 14
│       └─ [⋮] Menu → Screen 19 (Quick Actions Menu)
│           ├─ Edit Tracker → Screen 14
│           ├─ Archive → Moves to Screen 6
│           ├─ Reports → Screen 5
│           ├─ Export Data → Screen 32 (Export Success)
│           └─ Delete → Screen 15 (Delete Confirmation)
│
├─ Screen 4 (Daily Entries Tab):
│   ├─ Empty? → Screen 22 (Empty State) → Screen 7
│   ├─ Has Entries → Entry list (grouped by date)
│   │   ├─ Tap entry → Screen 8 (Entry Detail View)
│   │   │   ├─ [Edit] → Screen 9 (Edit Entry)
│   │   │   ├─ [Delete] → Screen 26 (Delete Entry Confirmation)
│   │   │   └─ [Duplicate] → Screen 7 (pre-filled)
│   │   │
│   │   ├─ Long press entry → Screen 33 (Bulk Actions) [Optional]
│   │   └─ [View All History] → Screen 10 (Entry History)
│   │       └─ Empty? → Screen 25 (Empty State)
│   │
│   ├─ [+ Log Entry] FAB → Screen 7
│   └─ [Edit Historical Data] → Screen 20 (Bulk Edit)
│
└─ Screen 5 (Reports Tab):
    ├─ Time period selector
    ├─ Report cards (numbers only, no charts):
    │   ├─ Total Profit
    │   ├─ Revenue Breakdown
    │   ├─ Spend Analysis
    │   ├─ Burn Rate
    │   ├─ Best Performing Days
    │   └─ Worst Performing Days
    │
    └─ [Export Report] → Screen 32 (Export Success)

DAILY ENTRY FLOW (Screens 7-10):

Screen 7 (Log Daily Entry)
├─ Entry form:
│   ├─ Date picker (required)
│   ├─ Total Revenue (required)
│   ├─ Total DMs/Leads (required)
│   ├─ Platform Spend (optional, per platform):
│   │   ├─ Existing platforms shown
│   │   └─ [+ Add Platform Spend] → Screen 17 (Add Row)
│   │
│   ├─ Notes (optional)
│   └─ Profit auto-calculated
│
└─ [Save Entry] → Screen 29 (Success) → Screen 8 (Entry Detail)

Screen 8 (Entry Detail View)
├─ View full entry details
├─ Profit breakdown shown
├─ Platform spend breakdown
├─ Actions:
│   ├─ [Edit] → Screen 9
│   ├─ [Delete] → Screen 26
│   ├─ [Duplicate] → Screen 7 (pre-filled)
│   └─ [← Back] → Screen 4 (Entries Tab)

Screen 9 (Edit Entry)
├─ Same form as Screen 7
├─ Pre-filled with existing data
├─ [Cancel] → Returns to Screen 8 (no changes)
└─ [Save Changes] → Screen 29 (Success) → Screen 8 (updated)

Screen 10 (Entry History - All Entries)
├─ Full chronological list
├─ Filter by date range
├─ Search entries
├─ Tap entry → Screen 8 (Entry Detail)
└─ Empty? → Screen 25 (Empty State)

POST MANAGEMENT FLOW (Screens 11-13):

Screen 11 (Posts List - Full View)
├─ All posts for tracker
├─ Empty? → Screen 23 (Empty State)
├─ Has Posts → Post cards
│   ├─ Tap post → Screen 13 (Edit/Delete Modal - View mode)
│   └─ Platform badges shown
│
└─ [+ Add Post] → Screen 12

Screen 12 (Add Post Modal)
├─ Form fields:
│   ├─ Post title (required)
│   ├─ Platform (required, single select)
│   ├─ Post URL (optional)
│   ├─ Date published (optional)
│   └─ Notes (optional)
│
└─ [Save Post] → Screen 29 (Success) → Screen 11 or 3

Screen 13 (Edit/Delete Post Modal)
├─ View mode → Shows post details
├─ [Edit] → Edit mode (same modal, editable fields)
├─ [Delete] → Screen 27 (Delete Post Confirmation)
└─ [Save] (in edit mode) → Screen 29 (Success) → Returns to list

SETTINGS & MANAGEMENT (Screens 14-16):

Screen 14 (Edit Tracker Settings)
├─ Same form as Screen 2 (Create)
├─ All fields editable except Start Date
├─ Additional options:
│   ├─ Manage Platforms → Screen 16
│   └─ Advanced settings
│
├─ [Cancel] → Returns to Screen 3
└─ [Save Changes] → Screen 29 (Success) → Screen 3

Screen 15 (Delete Tracker Confirmation)
├─ Critical warning modal
├─ Lists what gets deleted:
│   ├─ All entries (count shown)
│   ├─ All posts
│   ├─ All reports
│   └─ Complete history
│
├─ [Cancel] → Dismisses, no action
└─ [Delete Tracker] → Deletes, returns to Screen 1

Screen 16 (Platform Management)
├─ List of active platforms
├─ Add new platform
├─ Remove platform → Screen 28 (Delete Platform Confirmation)
├─ Reorder platforms
└─ [Done] → Returns to Screen 14

ARCHIVE FLOW:

Screen 6 (Archive View)
├─ Empty? → Screen 24 (Empty State)
├─ Has Archives → Archived tracker cards
│   ├─ Tap card → Screen 3 (read-only Hub)
│   └─ Swipe → Restore option
│
└─ [← Back] → Screen 1

AI & LOADING STATES:

Screen 18 (AI Quick Start Modal)
├─ Conversational questions
├─ User provides answers
└─ [Generate Setup] → Screen 30 (AI Loading)

Screen 30 (AI Loading State)
├─ Processing animation
├─ Success → Screen 2 (pre-filled)
├─ Timeout → Retry or Manual option
└─ Error → Screen 31 (General Error)

ERROR HANDLING:

Screen 31 (General Error)
├─ Context-specific error message
├─ [Try Again] → Retry action
├─ [Cancel] → Return to previous
└─ Network/Sync errors handled

SUCCESS FEEDBACK:

Screen 29 (Success Toast)
├─ Auto-dismiss after 2-3s
├─ Tap to dismiss early
└─ Overlays on current screen

ENHANCED FEATURES (Optional):

Screen 32 (Export Success Modal)
├─ Download link provided
├─ File details shown
├─ [Download] → Downloads file
├─ [Share] → Share sheet
└─ [Done] → Dismisses

Screen 33 (Bulk Actions Modal)
├─ Select multiple entries
├─ Bulk operations:
│   ├─ Export Selected
│   ├─ Edit Amounts
│   └─ Delete Selected → Confirmation
└─ Returns to Screen 4
```

---

## 2. SCREEN DEPENDENCY MAP

### Most Connected Screens (Hub Nodes)

**Screen 3 (Tracker Hub - Overview) - 19 connections:**
- Receives from: 1, 2, 7, 8, 12, 13, 14, 29, 35
- Navigates to: 4, 5, 7, 8, 11, 12, 14, 19, 23
- Modal triggers: 12, 14, 15, 19

**Screen 1 (Performance Dashboard) - 15 connections:**
- Receives from: 2, 6, 15, 29, bottom nav
- Navigates to: 2, 3, 5, 6, 7, 21
- Self-navigation: time filters, sorting

**Screen 4 (Daily Entries Tab) - 14 connections:**
- Receives from: 3, 7, 8, 9
- Navigates to: 7, 8, 10, 20, 22, 33
- Triggers: 26, 29

### Medium Connected Screens (Detail Pages)

**Screen 7 (Log Daily Entry) - 10 connections:**
- Receives from: 1, 3, 4, 8, 22, 25
- Navigates to: 8, 17, 29
- Can trigger: 31 (error)

**Screen 8 (Entry Detail View) - 9 connections:**
- Receives from: 4, 7, 10
- Navigates to: 3, 4, 9, 26, 7 (duplicate)

**Screen 2 (Create Tracker) - 8 connections:**
- Receives from: 1, 18, 21, 30
- Navigates to: 3, 18, 29
- Can trigger: 31 (error)

**Screen 5 (Reports Tab) - 6 connections:**
- Receives from: 1, 3, 19
- Navigates to: 3, 32
- Time filter changes (self)

### Low Connected Screens (Leaf Nodes)

**Empty States (1-2 connections each):**
- Screen 21 → Screen 2
- Screen 22 → Screen 7
- Screen 23 → Screen 12
- Screen 24 → (passive, no action)
- Screen 25 → Screen 7

**Delete Confirmations (1-2 connections each):**
- Screen 15: Confirms → Returns to 1 or dismisses
- Screen 26: Confirms → Returns to 4 or dismisses
- Screen 27: Confirms → Returns to 11 or dismisses
- Screen 28: Confirms → Returns to 16 or dismisses

**Success/Error Overlays (0-1 outbound):**
- Screen 29: Overlay only, auto-dismisses
- Screen 30: Transition → 2 or error
- Screen 31: Retry or dismiss

**Enhanced Features:**
- Screen 32: Download/Share → Dismisses
- Screen 33: Bulk actions → Returns to 4

---

## 3. PARENT-CHILD RELATIONSHIP MAP

### Primary Parents (Entry Points)

**Level 0 - Root:**
- **Screen 1** (Performance Dashboard) - Independent entry point
  - Children: 2, 3, 5, 6, 7, 21

### Secondary Parents (Major Sections)

**Level 1 - Tracker Hub:**
- **Screen 3** (Overview Tab) - Central hub for tracker
  - Direct children: 4, 5, 7, 8, 11, 12, 14, 19, 23

### Tertiary Parents (Tab Screens)

**Level 2 - Hub Tabs:**
- **Screen 4** (Daily Entries Tab)
  - Children: 7, 8, 10, 20, 22, 26, 29, 33
  
- **Screen 5** (Reports Tab)
  - Children: 32 (export)
  
- **Screen 11** (Posts List - Full View)
  - Children: 12, 13, 23, 27

### Detail Children (Level 3)

**Entry Details:**
- **Screen 8** (Entry Detail View) - Child of Screen 4, 7, 10
  - Children: 9 (edit), 26 (delete), 7 (duplicate)

**Post Details:**
- **Screen 13** (Edit/Delete Post) - Child of Screen 11
  - Children: 27 (delete confirmation)

**Full Lists:**
- **Screen 10** (Entry History) - Child of Screen 4
  - Children: 8 (detail), 25 (empty state)

### Modal Children (Level 3-4)

**Creation Modals:**
- **Screen 2** (Create Tracker) - Child of 1, 21, 30
  - Children: 18 (AI setup), 29 (success) → 3

**AI Flow:**
- **Screen 18** (AI Quick Start) - Child of 2
  - Children: 30 → 2 (pre-filled)

**Action Modals (Multiple parents):**
- **Screen 12** (Add Post) - Child of 3, 11, 23
- **Screen 17** (Add Platform Spend) - Child of 7, 9
- **Screen 19** (Quick Actions Menu) - Child of 3
  - Children: 14, 15, 5, 32
- **Screen 14** (Edit Tracker) - Child of 3, 19
  - Children: 16 (platform management)

**Editing:**
- **Screen 9** (Edit Entry) - Child of 8
  - Returns to: 8
  
- **Screen 20** (Historical Data Edit) - Child of 4
  - Bulk edits multiple entries

**Delete Confirmations (Level 4):**
- **Screen 15** (Delete Tracker) - Child of 19
- **Screen 26** (Delete Entry) - Child of 8
- **Screen 27** (Delete Post) - Child of 13
- **Screen 28** (Delete Platform) - Child of 16

### Special Screens

**Archive:**
- **Screen 6** (Archive View) - Child of 1
  - Children: 3 (read-only), 24 (empty state)

**Platform Management:**
- **Screen 16** (Platform Management) - Child of 14
  - Children: 28 (delete platform)

**Loading States:**
- **Screen 30** (AI Loading) - Transition screen (18 → 2)
  - On timeout: Offers retry or manual

**Error States:**
- **Screen 31** (General Error) - Can appear anywhere
  - Context-dependent parent

**Success Overlay:**
- **Screen 29** (Success Toast) - Overlays on parent screen
  - No parent relationship (pure overlay)

**Empty States (Level 3-4):**
- **Screens 21-25** - Children of their respective parent screens
  - Each has exactly one CTA (except 24 - passive)

**Enhanced (Optional):**
- **Screen 32** (Export Success) - Child of 5, 19
- **Screen 33** (Bulk Actions) - Child of 4

---

## 4. CRITICAL USER JOURNEYS

### Journey 1: First-Time Tracker Creation (AI-Guided Path)

**Steps: 7 screens | Duration: ~3-4 minutes**

```
1. Screen 1 (Performance Dashboard) - Empty
   ↓ Shows Screen 21 automatically
   
2. Screen 21 (Empty State)
   ↓ Tap [+ Create First Tracker]
   
3. Screen 2 (Create Tracker)
   ↓ Tap [✨ Quick Start with AI]
   
4. Screen 18 (AI Quick Start Modal)
   - AI asks: "What are you launching/promoting?"
   - User: "SaaS product called NeoLaunch"
   - AI asks: "What's your primary goal?"
   - User: "Generate $10,000 in revenue"
   - AI asks: "Which platforms will you use?"
   - User: "YouTube, LinkedIn, Blog"
   - AI asks: "What's your budget?"
   - User: "$500/month"
   ↓ Tap [Generate Setup]
   
5. Screen 30 (AI Loading State)
   - Shows: "Setting up your tracker..."
   - Wait 5-8 seconds
   ↓ AI completes
   
6. Screen 2 (Create Tracker) - Pre-filled
   - Name: "NeoLaunch"
   - Platforms: YouTube ☑, LinkedIn ☑, Blog ☑
   - Revenue Target: $10,000
   - Setup Cost: $500
   - Goal chip: "Product Launch" (added)
   - User reviews, makes minor edits
   ↓ Tap [Save]
   
7. Screen 29 (Success Toast)
   - "✓ Tracker created successfully"
   ↓ Auto-dismiss (2s)
   
8. Screen 3 (Tracker Hub - Overview)
   - See tracker overview
   - Net Profit: $0 (no entries yet)
   - Platforms configured: 3
   - Next action: Log first entry
```

**Success Metrics:**
- Completion rate: >85% (AI simplifies process)
- Time to first tracker: <4 minutes
- User satisfaction: High (less manual input)

---

### Journey 2: Manual Tracker Creation

**Steps: 5 screens | Duration: ~5-7 minutes**

```
1. Screen 1 (Performance Dashboard)
   ↓ Tap [+ FAB]
   
2. Screen 2 (Create Tracker)
   - Enter name: "Q4 Content Push"
   - Set start date: Oct 1, 2024
   - Select platforms:
     • YouTube ☑
     • TikTok ☑
     • Blog ☑
     • Facebook ☑
   - Currency: USD
   - Goals chips: "Lead Generation" (tapped)
   - Revenue target: $5,000
   - Engagement target: 1,000 DMs
   - Setup cost: $200 (one-time)
   - Growth costs: $100/month
   - Notes: "Focus on educational content"
   ↓ Tap [Save]
   
3. Screen 29 (Success Toast)
   - "✓ Tracker created successfully"
   ↓ Auto-dismiss
   
4. Screen 3 (Tracker Hub - Overview)
   - Tracker initialized
   - All metrics at $0
   - Platforms ready for tracking
```

**Success Metrics:**
- Completion rate: >75%
- Time to create: 5-7 minutes
- Drop-off: Minimal (form is straightforward)

---

### Journey 3: Daily Entry Logging

**Steps: 5 screens | Duration: ~1-2 minutes**

```
1. Screen 1 (Performance Dashboard)
   - User opens app at end of day
   ↓ Tap [+ Add Entry] quick action
   
2. Screen 7 (Log Daily Entry)
   - Auto-selected tracker: NeoLaunch (most recent)
   - Date: Today (Oct 26, 2024) - default
   - Enter Total Revenue: $450
   - Enter Total DMs: 8
   - Platform Spend section:
     • YouTube: $150 (tap to enter)
     • LinkedIn: $70
     • Blog: $50
   - Total Spend auto-calculated: $270
   - Profit auto-shown: +$180 (green)
   - Notes: "Strong engagement on YouTube video"
   ↓ Tap [Save Entry]
   
3. Screen 29 (Success Toast)
   - "✓ Entry logged successfully"
   ↓ Auto-dismiss
   
4. Screen 8 (Entry Detail View)
   - Full entry shown
   - Breakdown displayed:
     • Revenue: $450
     • Spend: $270
     • Profit: +$180
     • Platform breakdown visible
   ↓ Tap [← Back]
   
5. Screen 3 (Tracker Hub - Overview)
   - Updated metrics:
     • Today: +$180
     • This Week: Updated
     • Total Profit: Recalculated
   - New entry appears in Recent Entries list
```

**Success Metrics:**
- Daily logging rate: 70% of users log daily
- Time per entry: <2 minutes
- Accuracy: Auto-calculations reduce errors
- Consistency: Quick access encourages habit

---

### Journey 4: Viewing Performance Reports

**Steps: 4 screens | Duration: ~2-3 minutes**

```
1. Screen 3 (Tracker Hub - Overview)
   - User wants to see weekly performance
   ↓ Tap Reports tab
   
2. Screen 5 (Reports Tab)
   - Time selector: [This Week] selected
   - Report cards shown:
   
   TOTAL PROFIT
   $1,240.50
   ↑ 12.5% vs last week
   
   REVENUE BREAKDOWN
   Total: $2,100
   - YouTube: $950 (45%)
   - LinkedIn: $680 (32%)
   - Blog: $470 (23%)
   
   SPEND ANALYSIS
   Total: $859.50
   - YouTube: $450 (52%)
   - LinkedIn: $280 (33%)
   - Blog: $129.50 (15%)
   
   BURN RATE
   $122.79/day
   At this rate: 10 days until setup cost recovered
   
   BEST PERFORMING DAYS
   1. Oct 24: +$320
   2. Oct 23: +$280
   3. Oct 22: +$240
   
   WORST PERFORMING DAYS
   1. Oct 20: -$45
   2. Oct 21: +$12
   3. Oct 19: +$35
   
   ↓ User reviews data
   ↓ Tap [Export Report]
   
3. Screen 32 (Export Success Modal)
   - "Export Complete!"
   - File: NeoLaunch_Week42.csv
   - Size: 12.4 KB
   ↓ Tap [Download]
   
4. File downloads to device
   ↓ User can share or analyze further
```

**Success Metrics:**
- Report usage: 85% of users view reports weekly
- Export rate: 40% export at least monthly
- Insights gained: Users report clarity on ROI

---

### Journey 5: Managing Posts (Optional)

**Steps: 6 screens | Duration: ~2-3 minutes**

```
1. Screen 3 (Tracker Hub - Overview)
   - Scrolls to Posts section
   - Empty? Shows Screen 23 inline
   ↓ Tap [+ Add Post]
   
2. Screen 12 (Add Post Modal)
   - Fill form:
     • Title: "Launch Day Announcement"
     • Platform: YouTube
     • URL: https://youtube.com/watch?v=xyz123
     • Date: Oct 24, 2024
     • Notes: "Main launch video"
   ↓ Tap [Save Post]
   
3. Screen 29 (Success Toast)
   - "✓ Post added"
   ↓ Auto-dismiss
   
4. Screen 3 (Overview)
   - Post card appears in Posts section
   - Shows: "Launch Day Announcement"
   - Platform badge: YOUTUBE
   ↓ Later, user wants to edit
   ↓ Tap post card
   
5. Screen 13 (Edit/Delete Post Modal - View mode)
   - Shows post details
   ↓ Tap [Edit]
   
6. Screen 13 (Edit mode)
   - Fields become editable
   - User updates URL or notes
   ↓ Tap [Save]
   - Success toast appears
   - Returns to list
```

**Success Metrics:**
- Post usage: 45% of users add posts
- Posts per tracker: Average 8-12
- Value: Users report posts help remember what was published

---

### Journey 6: Editing Historical Data

**Steps: 5 screens | Duration: ~3-5 minutes**

```
1. Screen 4 (Daily Entries Tab)
   - User notices mistake in old entry
   - Scrolls through entries
   ↓ Tap [Edit Historical Data]
   
2. Screen 20 (Historical Data Edit)
   - All entries shown in editable table
   - [☑ Select All] [☐ Deselect All]
   - User selects 2 entries with errors:
     • Oct 25: Revenue was $350, not $450
     • Oct 24: Spend was $200, not $150
   ↓ Tap values to edit inline
   
3. Screen 20 (editing)
   - Oct 25 Revenue: $350.00 (updated)
   - Oct 24 Spend: $200.00 (updated)
   - Profit auto-recalculates for each
   - Summary shows: "2 entries selected"
   - Warning: "⚠️ Changes affect profit calculations"
   ↓ Tap [Save All Changes]
   
4. Screen 29 (Success Toast)
   - "✓ Changes saved"
   ↓ Auto-dismiss
   
5. Screen 4 (Entries Tab)
   - Returns to entries list
   - Updated entries show new values
   - Total profit updated across all reports
```

**Success Metrics:**
- Edit usage: 30% of users edit at least once
- Accuracy improvement: Corrections prevent misleading data
- Bulk editing efficiency: 5x faster than individual edits

---

### Journey 7: Archiving Completed Tracker

**Steps: 6 screens | Duration: ~1 minute**

```
1. Screen 3 (Tracker Hub - Overview)
   - Campaign finished: "Q4 Content Push" complete
   ↓ Tap [⋮] menu (top right)
   
2. Screen 19 (Quick Actions Menu)
   - Menu options shown:
     • Edit Tracker
     • Archive
     • Reports
     • Export Data
     • Delete (red)
   ↓ Tap [Archive]
   
3. Screen 29 (Success Toast)
   - "✓ Tracker archived"
   ↓ Auto-dismiss
   
4. Screen 1 (Performance Dashboard)
   - Tracker removed from active list
   - Top/Worst project cards update
   - Overall metrics recalculate (active only)
   ↓ User wants to review archived
   ↓ Tap filter: [📦 Archive]
   
5. Screen 6 (Archive View)
   - Shows archived tracker card
   - Card displays:
     • "Q4 Content Push"
     • Final stats: +$4,240 profit
     • Duration: 3 months
     • Completed: Oct 31, 2024
   ↓ Tap card
   
6. Screen 3 (Tracker Hub - Read Only)
   - All data preserved
   - Can view reports, entries
   - Cannot add new entries
   - Swipe to restore option available
```

**Success Metrics:**
- Archive rate: 90% of completed trackers archived
- Data preservation: 100% (all history kept)
- Restoration: 15% restored for reference

---

## 5. NAVIGATION PATTERN SUMMARY

### Pattern 1: Tab-Based Navigation (Horizontal Tabs)

**Used in: Tracker Hub (Screens 3, 4, 5)**

```
Structure:
┌──────────────────────────────────────┐
│[Overview]│Daily Entries│Reports│More│
└──────────────────────────────────────┘

Behavior:
- Active tab underlined
- Tap to switch immediately (no loading)
- Swipe gesture enabled (optional)
- Maintains tracker context across tabs
- Badge counts on tabs (e.g., "Entries (28)")
```

**Benefits:**
- Keeps user oriented within tracker
- Fast context switching
- Persistent tracker header

---

### Pattern 2: Time Filter Pills

**Used in: Dashboard, Overview, Reports (Screens 1, 3, 5)**

```
Structure:
┌────────┐┌────────┐┌────────────────┐
│ Today  ││This Week││ This Month ●  │
└────────┘└────────┘└────────────────┘

Behavior:
- One active at a time
- Active pill: filled background
- Inactive pills: outline only
- Tap to filter data view
- Updates all metrics instantly
```

**Benefits:**
- Quick time range switching
- Visual indicator of current view
- No page reload needed

---

### Pattern 3: FAB → Modal → Success Flow

**Used in: Primary creation actions**

```
Flow:
Parent Screen (showing FAB)
  ↓ Tap [+] FAB
Modal Opens (Screen 2, 7, 12)
  ↓ Fill form
  ↓ Save
Success Toast (Screen 29)
  ↓ Auto-dismiss
Parent Screen (updated with new item)

Examples:
- Screen 1 → Screen 2 (Create Tracker)
- Screen 4 → Screen 7 (Log Entry)
- Screen 3 → Screen 12 (Add Post)
```

**Benefits:**
- FAB always visible, discoverable
- Modal keeps context
- Immediate feedback after creation

---

### Pattern 4: Card → Detail → Edit Flow

**Used in: Entry management**

```
Flow:
List Screen (entry cards)
  ↓ Tap card
Detail Screen (read-only - Screen 8)
  ↓ Tap [Edit] button
Edit Screen (Screen 9)
  ↓ Save
Success Toast
  ↓ Auto-dismiss
Detail Screen (updated)
  ↓ Back
List Screen (refreshed)

Example: Entries
Screen 4 → Screen 8 → Screen 9 → Screen 29 → Screen 8 → Screen 4
```

**Benefits:**
- Prevents accidental edits
- Clear view/edit distinction
- Consistent pattern

---

### Pattern 5: Progressive Disclosure (Summary → Full)

**Used in: Overview tab, Entry lists**

```
Summary View (Top 5 items)
  ↓ Tap "View All" or tab
Full View (All items with filters)

Example:
Screen 3 (Overview) shows:
- Last 5 entries
- Top 3 posts
  ↓ Tap "Daily Entries" tab
Screen 4 shows:
- All entries
- With filters, search, bulk actions
```

**Benefits:**
- Reduces cognitive load on overview
- Power users access full data
- Most users only need summary

---

### Pattern 6: Quick Actions Menu (Three-Dot)

**Used in: Tracker-level actions**

```
Flow:
Screen Header
  ↓ Tap [⋮] button
Screen 19 (Quick Actions Menu)
  ↓ Tap action
Executes action or opens modal

Options:
- Edit Tracker → Screen 14
- Archive → Moves to Screen 6
- Reports → Screen 5
- Export Data → Screen 32
- Delete → Screen 15
```

**Benefits:**
- Keeps header clean
- Groups related actions
- Contextual to current tracker

---

### Pattern 7: Auto-Calculation Display

**Used in: Entry logging, Entry detail**

```
Behavior:
User enters:
- Revenue: $450
- Spend amounts per platform:
  • YouTube: $150
  • LinkedIn: $70
  • Blog: $50

App automatically shows:
- Total Spend: $270 (sum)
- Profit: +$180 (revenue - spend)
- Color: Green (positive) or Red (negative)

Updates in real-time as user types.
```

**Benefits:**
- Reduces manual calculation
- Prevents errors
- Immediate feedback
- Visual profit indicator (color)

---

### Pattern 8: Empty State → CTA → First Item Flow

**Used in: All empty states (Screens 21-25)**

```
Flow:
Parent Screen (checks for data)
  ↓ If empty
Empty State Screen
  - Explains feature
  - Shows what will appear
  - Clear CTA button
  ↓ Tap CTA
Creation Screen
  ↓ Save
Success Toast
  ↓ Auto-dismiss
Parent Screen (now shows first item)
```

**Benefits:**
- Educational (explains feature)
- Encourages engagement
- Smooth onboarding

---

### Pattern 9: Platform Spend Entry (Dynamic Form)

**Used in: Log/Edit Entry (Screens 7, 9)**

```
Structure:
┌─────────────────────────────────┐
│ PLATFORM SPEND (Optional)       │
│                                  │
│ YouTube                          │
│ $ 150.00                         │
│                                  │
│ LinkedIn                         │
│ $ 70.00                          │
│                                  │
│ Blog                             │
│ $ 50.00                          │
│                                  │
│ [+ Add Another Platform]         │
└─────────────────────────────────┘

Behavior:
- Only configured platforms shown
- Each platform has amount field
- Can add one-off platforms via Screen 17
- All optional (can leave at $0)
- Total auto-calculated
```

**Benefits:**
- Flexible spend tracking
- Supports multi-platform campaigns
- Optional (not required)

---

### Pattern 10: Success Toast Overlay

**Used in: All confirmation actions (Screen 29)**

```
Behavior:
- Appears: Top of screen, slides down
- Duration: 2-3 seconds auto-dismiss
- Position: Above all content
- Style: Green background, white text, checkmark
- Dismissal: Auto or tap to close early
- Does NOT block interaction

Triggers:
- Tracker created
- Entry logged
- Entry updated
- Post added
- Changes saved
- Item deleted

Message Format:
"✓ [Action] [Result]"
```

**Benefits:**
- Immediate feedback
- Non-blocking (doesn't interrupt)
- Consistent across actions
- Positive reinforcement

---

### Pattern 11: Delete Confirmation Pattern

**Used in: All delete actions (Screens 15, 26, 27, 28)**

```
Structure:
Warning Icon: ⚠️
Title: "Delete [Entity]?"
Entity Details: Shows what's being deleted
Impact Statement: What gets lost
Warning: "This action CANNOT be undone"
Primary Action: [Delete] (RED button)
Secondary Action: [Cancel] (safe default)

Hierarchy of Severity:
HIGH (Screen 15): Delete Tracker
- Cascading deletion warning
- Entry count shown

MEDIUM (Screen 28): Delete Platform
- Warns about spend data loss
- Affected entry count

LOW (Screens 26, 27): Delete Entry/Post
- Simple confirmation
- Less severe impact
```

**Benefits:**
- Prevents accidental deletions
- Clear about consequences
- Escalates severity appropriately

---

### Pattern 12: Bulk Operations

**Used in: Historical Data Edit, Bulk Actions (Screens 20, 33)**

```
Flow:
List View
  ↓ Enable selection mode
Checkboxes appear on items
  ↓ Select items
Bulk action buttons appear
  ↓ Choose action
Action modal or confirmation
  ↓ Confirm
Success toast
  ↓ Return to list (updated)

Operations:
- Bulk edit amounts (Screen 20)
- Bulk delete (Screen 33)
- Bulk export (Screen 33)
```

**Benefits:**
- Efficiency for multiple items
- Time-saving vs individual edits
- Clear selection state

---

## 6. DATABASE SCHEMA IMPLICATIONS

### Core Tables & Relationships

```
TRACKER SCHEMA OVERVIEW:

users (from auth system)
  │
  ├─ 1:N → trackers
          │
          ├─ 1:N → daily_entries
          │         │
          │         └─ 1:N → entry_platform_spends
          │
          ├─ 1:N → tracker_platforms (many-to-many resolver)
          │
          ├─ 1:N → posts
          │
          ├─ 1:1 → tracker_settings (or embedded in trackers)
          │
          └─ 1:N → tracker_goals (optional)
```

---

### Table 1: trackers

**Purpose:** Main tracker/campaign entity

```
Columns:
- id (UUID, PK)
- user_id (UUID, FK → users.id, NOT NULL)
- name (TEXT, NOT NULL)
- start_date (DATE, NOT NULL)
- currency (TEXT, NOT NULL, default 'USD')
- revenue_target (DECIMAL, NULLABLE)
- engagement_target (INTEGER, NULLABLE) -- DMs/Leads goal
- setup_cost (DECIMAL, default 0)
- growth_cost_monthly (DECIMAL, default 0)
- notes (TEXT, NULLABLE)
- is_archived (BOOLEAN, default false)
- created_at (TIMESTAMP, NOT NULL)
- updated_at (TIMESTAMP, NOT NULL)

Relationships:
- 1:N → daily_entries
- 1:N → posts
- N:M → platforms (via tracker_platforms)
- N:1 → users
- 1:N → tracker_goals

Indexes:
- user_id (for user's trackers)
- is_archived (for filtering)
- created_at (for sorting)
```

---

### Table 2: daily_entries

**Purpose:** Individual day's performance data

```
Columns:
- id (UUID, PK)
- tracker_id (UUID, FK → trackers.id, CASCADE DELETE, NOT NULL)
- entry_date (DATE, NOT NULL)
- total_revenue (DECIMAL, NOT NULL)
- total_dms_leads (INTEGER, NOT NULL)
- notes (TEXT, NULLABLE)
- profit (DECIMAL, GENERATED) -- calculated: revenue - sum(platform_spends)
- created_at (TIMESTAMP, NOT NULL)
- updated_at (TIMESTAMP, NOT NULL)

Relationships:
- N:1 → trackers
- 1:N → entry_platform_spends

Constraints:
- UNIQUE(tracker_id, entry_date) -- one entry per day per tracker

Indexes:
- tracker_id (for entry lists)
- entry_date (for sorting)
- COMPOSITE(tracker_id, entry_date) for queries

Computed Fields:
- profit = total_revenue - SUM(entry_platform_spends.amount)
```

---

### Table 3: entry_platform_spends

**Purpose:** Per-platform ad spend for each entry

```
Columns:
- id (UUID, PK)
- entry_id (UUID, FK → daily_entries.id, CASCADE DELETE, NOT NULL)
- platform (TEXT, NOT NULL) -- 'YOUTUBE', 'TIKTOK', 'BLOG', 'FACEBOOK', etc.
- amount (DECIMAL, NOT NULL, default 0)
- created_at (TIMESTAMP, NOT NULL)
- updated_at (TIMESTAMP, NOT NULL)

Relationships:
- N:1 → daily_entries

Constraints:
- UNIQUE(entry_id, platform) -- one spend per platform per entry
- CHECK(amount >= 0)

Indexes:
- entry_id (for entry breakdown)
- platform (for platform-specific reports)
```

---

### Table 4: tracker_platforms

**Purpose:** Many-to-many resolver - which platforms tracker uses

```
Columns:
- id (UUID, PK)
- tracker_id (UUID, FK → trackers.id, CASCADE DELETE, NOT NULL)
- platform (TEXT, NOT NULL)
- display_order (INTEGER, default 0) -- for UI ordering
- created_at (TIMESTAMP, NOT NULL)

Relationships:
- N:1 → trackers

Constraints:
- UNIQUE(tracker_id, platform)

Indexes:
- tracker_id (for platform list)

Notes:
- When user creates tracker, selected platforms inserted here
- When logging entry, only these platforms shown in spend section
- Deleting platform (Screen 28) deletes from this table + all related entry_platform_spends
```

---

### Table 5: posts

**Purpose:** Optional reference links to published content

```
Columns:
- id (UUID, PK)
- tracker_id (UUID, FK → trackers.id, CASCADE DELETE, NOT NULL)
- title (TEXT, NOT NULL)
- platform (TEXT, NOT NULL) -- single platform per post
- url (TEXT, NULLABLE)
- published_date (DATE, NULLABLE)
- notes (TEXT, NULLABLE)
- created_at (TIMESTAMP, NOT NULL)
- updated_at (TIMESTAMP, NOT NULL)

Relationships:
- N:1 → trackers

Indexes:
- tracker_id (for posts list)
- platform (for filtering)

Notes:
- Posts are REFERENCE ONLY
- Do NOT affect revenue/profit calculations
- Optional feature
```

---

### Table 6: tracker_goals (Optional)

**Purpose:** Additional goal chips/targets for tracker

```
Columns:
- id (UUID, PK)
- tracker_id (UUID, FK → trackers.id, CASCADE DELETE, NOT NULL)
- goal_type (TEXT, NOT NULL) -- 'PRODUCT_LAUNCH', 'LEAD_GENERATION', 'BRAND_AWARENESS', etc.
- created_at (TIMESTAMP, NOT NULL)

Relationships:
- N:1 → trackers

Notes:
- Simple tags/chips on tracker
- Can be pre-defined enum or freeform text
```

---

### Key Relationships Summary

**1:N Relationships:**
- users → trackers (one user has many trackers)
- trackers → daily_entries (one tracker has many entries)
- trackers → posts (one tracker has many posts)
- daily_entries → entry_platform_spends (one entry has spend for multiple platforms)
- trackers → tracker_goals (one tracker has many goal tags)

**N:1 Relationships:**
- trackers → users (many trackers belong to one user)
- daily_entries → trackers (many entries belong to one tracker)
- posts → trackers (many posts belong to one tracker)
- entry_platform_spends → daily_entries (many spends belong to one entry)

**N:M Relationships (via resolver):**
- trackers ↔ platforms (via tracker_platforms table)
  - A tracker can have multiple platforms
  - Each platform instance is specific to a tracker

**1:1 Relationships:**
- None in this module (tracker_settings could be 1:1 if separated)

**Cascade Delete Behavior:**
- Delete tracker → Deletes all daily_entries, posts, tracker_platforms, tracker_goals
- Delete daily_entry → Deletes all entry_platform_spends
- Delete platform from tracker_platforms → Deletes all entry_platform_spends for that platform

---

### Database Indexes Needed

```sql
-- Performance optimization
CREATE INDEX idx_trackers_user ON trackers(user_id);
CREATE INDEX idx_trackers_archived ON trackers(is_archived);
CREATE INDEX idx_trackers_created ON trackers(created_at DESC);

CREATE INDEX idx_entries_tracker ON daily_entries(tracker_id);
CREATE INDEX idx_entries_date ON daily_entries(entry_date DESC);
CREATE INDEX idx_entries_tracker_date ON daily_entries(tracker_id, entry_date DESC);

CREATE INDEX idx_spends_entry ON entry_platform_spends(entry_id);
CREATE INDEX idx_spends_platform ON entry_platform_spends(platform);

CREATE INDEX idx_platforms_tracker ON tracker_platforms(tracker_id);

CREATE INDEX idx_posts_tracker ON posts(tracker_id);
CREATE INDEX idx_posts_platform ON posts(platform);
```

---

### Sample Queries

**Get tracker with calculated totals:**
```sql
SELECT 
  t.*,
  COUNT(DISTINCT de.id) as total_entries,
  COALESCE(SUM(de.total_revenue), 0) as total_revenue,
  COALESCE(SUM(de.profit), 0) as total_profit,
  COUNT(DISTINCT p.id) as total_posts
FROM trackers t
LEFT JOIN daily_entries de ON de.tracker_id = t.id
LEFT JOIN posts p ON p.tracker_id = t.id
WHERE t.user_id = $1 AND t.is_archived = false
GROUP BY t.id
ORDER BY t.created_at DESC;
```

**Get platform breakdown for tracker:**
```sql
SELECT 
  eps.platform,
  SUM(eps.amount) as total_spend,
  COUNT(DISTINCT eps.entry_id) as days_spent
FROM entry_platform_spends eps
JOIN daily_entries de ON de.id = eps.entry_id
WHERE de.tracker_id = $1
GROUP BY eps.platform
ORDER BY total_spend DESC;
```

**Get daily entries with calculated profit:**
```sql
SELECT 
  de.id,
  de.entry_date,
  de.total_revenue,
  de.total_dms_leads,
  COALESCE(SUM(eps.amount), 0) as total_spend,
  de.total_revenue - COALESCE(SUM(eps.amount), 0) as profit
FROM daily_entries de
LEFT JOIN entry_platform_spends eps ON eps.entry_id = de.id
WHERE de.tracker_id = $1
GROUP BY de.id
ORDER BY de.entry_date DESC;
```

---

## ✅ COMPLETE SPECIFICATION SUMMARY

**Total Screens: 35**
- Main Screens: 6
- Daily Entry Flow: 4
- Post Management: 3
- Settings & Management: 3
- Modals & Components: 4
- Empty States: 5
- Delete Confirmations: 3
- Success/Error States: 3
- Enhanced Features: 2
- App Settings: 2 (Settings Page, Trackers List View)

**Navigation Patterns Identified: 12**
1. Tab-Based Navigation
2. Time Filter Pills
3. FAB → Modal → Success
4. Card → Detail → Edit
5. Progressive Disclosure
6. Quick Actions Menu
7. Auto-Calculation Display
8. Empty State → CTA → First Item
9. Platform Spend Entry
10. Success Toast Overlay
11. Delete Confirmation Pattern
12. Bulk Operations

**Critical User Journeys: 7**
1. First-Time Tracker Creation (AI-Guided)
2. Manual Tracker Creation
3. Daily Entry Logging
4. Viewing Performance Reports
5. Managing Posts (Optional)
6. Editing Historical Data
7. Archiving Completed Tracker

**Database Tables: 6**
1. trackers (main entity)
2. daily_entries (performance logs)
3. entry_platform_spends (per-platform spend)
4. tracker_platforms (N:M resolver)
5. posts (optional references)
6. tracker_goals (optional tags)

**Bottom Navigation:**
- 📊 Dashboard → Screen 1 (Performance Dashboard)
- 📈 Trackers → Screen 35 (Trackers List View)

---

**STATUS: ✅ COMPLETE**

All navigation flows documented, dependency maps created, user journeys defined, patterns identified, and database relationships specified for standalone Performance Tracker app. Ready for:
- ⚙️ Settings → Screen 34 (Settings Page)
1. Development handoff
2. Design system application
3. Prototype creation
4. Database implementation

