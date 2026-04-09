# Performance Tracker App (Standalone) - Complete Page Inventory & Wireframes

Standalone tracker app with independent navigation and settings.

---

## COMPLETE PAGE INVENTORY - 35 SCREENS

### **A. MAIN SCREENS (6 screens)**
1. Performance Dashboard (Home)
2. Create Tracker
3. Tracker Hub - Overview Tab
4. Tracker Hub - Daily Entries Tab
5. Tracker Hub - Reports Tab
6. Archive View

### **B. DAILY ENTRY FLOW (4 screens)**
7. Log Daily Entry
8. Entry Detail View
9. Edit Entry
10. Entry History (All Entries List)

### **C. POST MANAGEMENT (3 screens)**
11. Posts List (within Overview)
12. Add Post Modal
13. Edit/Delete Post Modal

### **D. SETTINGS & MANAGEMENT (3 screens)**
14. Edit Tracker Settings
15. Delete Tracker Confirmation
16. Platform Management

### **E. MODALS & COMPONENTS (4 screens)**
17. Add Platform Spend Row
18. AI Quick Start Modal
19. Quick Actions Menu
20. Historical Data Edit

### **F. EMPTY STATES (5 screens)**
21. Performance Dashboard Empty State
22. Daily Entries Tab Empty State
23. Posts List Empty State
24. Archive View Empty State
25. Entry History Empty State

### **G. DELETE CONFIRMATIONS (3 screens)**
26. Delete Entry Confirmation
27. Delete Post Confirmation
28. Delete Platform Confirmation

### **H. SUCCESS/ERROR STATES (3 screens)**
29. Success Toast/Confirmation
30. AI Loading State
31. General Error State

### **I. ENHANCED FEATURES (2 screens)**
32. Export Success Modal
33. Bulk Actions Modal

### **J. APP SETTINGS (2 screens)**
34. Settings Page
35. Trackers List View

---

**TOTAL: 35 SCREENS**

---

**COMPLETE NAVIGATION FLOW DIAGRAM**


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

---

## 1. PERFORMANCE DASHBOARD (Home)

**Title:** Performance  
**Subtitle:** Campaign tracker dashboard

**Description:** Main landing page showing performance overview, quick actions, and tracker project lists organized by profitability.

**Functions:**
- View performance overview (net profit, revenue, spend)
- Filter by time period (Today/This Week/This Month)
- Quick actions: Add Entry, Reports, Create
- View recent tracker
- View top performing trackers
- View worst performing trackers
- Create new tracker

**Navigation:**
- Tap time filter → Changes data view
- Tap [Add Entry] → Log Daily Entry (Screen 7) for recent tracker
- Tap [Reports] → Reports view for recent tracker
- Tap [Create Project] → Create Tracker (Screen 2)
- Tap tracker card → Tracker Hub Overview (Screen 3)
- Tap [Log Entry] on recent tracker → Log Daily Entry (Screen 7)

```
┌─────────────────────────────────────────────┐
│  👤 Performance                         🔔   │
├─────────────────────────────────────────────┤
│                                             │
│  TIME PERIOD                                │
│  ┌────────┐┌────────┐┌────────────────┐    │
│  │ Today  ││This Week││ This Month ●  │    │
│  └────────┘└────────┘└────────────────┘    │
│  Tap to change time filter                  │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  PERFORMANCE OVERVIEW                    ⓘ  │
│                                             │
│  Net Profit                                 │
│  $8,240.50                    📈 12.5%      │
│  Large, bold amount            Green trend  │
│                                             │
│  ● Revenue          ● Spend                 │
│  $12,400            $4,159                  │
│  This month totals                          │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  QUICK ACTIONS                              │
│                                             │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐    │
│  │ + Add    │ │ 📊 Reports│ │ ⋯ More  │    │
│  │   Entry  │ │          │ │          │    │
│  └──────────┘ └──────────┘ └──────────┘    │
│  Tap [Add Entry] → Screen 7                 │
│  Tap [Reports] → Reports for recent tracker │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  RECENT PROJECT                             │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 🚀 NeoLaunch                        │   │
│  │    SaaS Platform                    │   │
│  │                                     │   │
│  │    Today: +$450 ↗                   │   │
│  │    Green, positive amount           │   │
│  │                                     │   │
│  │    ┌──────────────────────────────┐│   │
│  │    │    Log Entry    →            ││   │
│  │    └──────────────────────────────┘│   │
│  │    Dark button - tap → Screen 7     │   │
│  └─────────────────────────────────────┘   │
│  Tap card → Tracker Hub (Screen 3)          │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  TOP PROJECTS                    [View All] │
│  Highest profit trackers                    │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 🚀 NeoLaunch                        │   │
│  │    SaaS Platform         +$3,240    │   │
│  │                          Green      │   │
│  └─────────────────────────────────────┘   │
│  Tap → Tracker Hub (Screen 3)               │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 🎙️ Podcast Pro                      │   │
│  │    Media                 +$1,850    │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  WORST PROJECTS              [Low ROI] badge│
│  Negative or low profit trackers            │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 📦 DropStore X                      │   │
│  │    E-commerce            -$420      │   │
│  │                          Red        │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                         ┌─────────┐         │
│                         │    +    │         │
│                         │  Create │         │
│                         │ Project │         │
│                         └─────────┘         │
│                         Green FAB           │
│                         Tap → Screen 2      │
│                                             │
│ ┌──────────────────────────────────────────┐│
│ │ [📊●] Dashboard  [📈] Trackers  [⚙️] Settings││
│ │  Current tab     All trackers   App setup ││
│ └──────────────────────────────────────────┘│
│                                             │
└─────────────────────────────────────────────┘
```

---

## 2. CREATE TRACKER

**Title:** New Tracker  
**Subtitle:** Create performance tracker

**Description:** Form to create a new performance tracker with platforms, setup costs, and initial targets.

**Functions:**
- Enter tracker name
- Set start date
- Select target platforms (multi-select)
- Set currency
- Add initial goals (optional chips)
- Set revenue/engagement targets
- Add setup/growth costs
- Add notes
- AI quick start option
- Create tracker

**Navigation:**
- Tap [Cancel] → Back to Dashboard (Screen 1)
- Tap [✨ Quick Start with AI] → AI Setup Modal (Screen 18)
- Tap [Save] → Creates tracker, goes to Tracker Hub (Screen 3)

```
┌─────────────────────────────────────────────┐
│  Cancel          New Tracker           Save │
│                                             │
├─────────────────────────────────────────────┤
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ ✨ Quick Start with AI          [→] │   │
│  │    Smart setup for name, goals &    │   │
│  │    strategy                         │   │
│  └─────────────────────────────────────┘   │
│  Tap → AI Setup Modal (Screen 18)           │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Project Name *                             │
│  ┌─────────────────────────────────────┐   │
│  │ e.g., Q3 Content Push               │   │
│  └─────────────────────────────────────┘   │
│  What campaign are you tracking?            │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Start Date *                               │
│  ┌─────────────────────────────────────┐   │
│  │ 📅 Oct 24, 2023               [→]   │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Target Platforms                           │
│                                             │
│  ┌────────┐ ┌────────┐ ┌────────┐          │
│  │☑YouTube│ │☐LinkedIn││☑ Blog │          │
│  └────────┘ └────────┘ └────────┘          │
│                                             │
│  ┌────────┐ ┌────────┐                     │
│  │☐Twitter│ │☑Instag.│                     │
│  └────────┘ └────────┘                     │
│  Multi-select platforms to track            │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Currency                                   │
│  ┌─────────────────────────────────────┐   │
│  │ 💲 USD - US Dollar            [▼]   │   │
│  └─────────────────────────────────────┘   │
│  ⓘ Single currency allowed per tracker      │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Initial Goals (Optional)                   │
│  Reference targets - not actively tracked   │
│                                             │
│  ┌────────┐ ┌────────┐ ┌────────┐          │
│  │ 🚀     │ │ 📈     │ │ 👥     │          │
│  │Product │ │Content │ │Lead Gen│          │
│  │Launch ●│ │Growth  │ │        │          │
│  └────────┘ └────────┘ └────────┘          │
│  Tap to select goal type(s)                 │
│                                             │
│  Revenue Target      Engagement/Subs        │
│  ┌──────────────┐   ┌──────────────┐       │
│  │ $ 0.00       │   │ 0            │       │
│  └──────────────┘   └──────────────┘       │
│  Optional reference targets                 │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Setup/Growth Costs (Optional)              │
│  Initial investment to set up campaign      │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ $ 0.00                              │   │
│  └─────────────────────────────────────┘   │
│  E.g., buying initial followers, tools      │
│                                             │
│  💡 This cost will be deducted from total   │
│     profit calculations                     │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Notes (Optional)                           │
│  ┌─────────────────────────────────────┐   │
│  │ Add context about goals, deadlines, │   │
│  │ or resources...                     │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│         ┌──────────────────────────┐        │
│         │  Create Project    →     │        │
│         └──────────────────────────┘        │
│         Large green button                  │
│         Tap → Tracker Hub (Screen 3)        │
│                                             │
│  VALIDATION:                                │
│  - Name required (min 3 chars)              │
│  - Start date required                      │
│  - At least 1 platform required             │
│  - Currency required                        │
│  - Rest optional                            │
│                                             │
└─────────────────────────────────────────────┘
```

---

## 3. TRACKER HUB - OVERVIEW TAB

**Title:** [Tracker Name]  
**Subtitle:** Overview

**Description:** Main tracker dashboard showing total progress, key metrics, recent entries, and posts list.

**Functions:**
- View total progress to goal
- See key metrics (Streak, Hours, Tasks, etc.)
- View recent entries
- Quick log entry
- View posts list (optional)
- Access other tabs

**Navigation:**
- Tap [←] → Back to Dashboard (Screen 1)
- Tap [⋮] → Quick Actions Menu (Screen 19)
- Tap [Log Daily Entry] → Log Entry (Screen 7)
- Tap entry → Entry Detail (Screen 8)
- Tap [Posts] section → Posts List (Screen 11)
- Tap tab → Switch tabs

```
┌─────────────────────────────────────────────┐
│  ←  NeoLaunch                          ⋮    │
│      Q3 Content Campaign                    │
│      Tap [⋮] for actions                    │
├─────────────────────────────────────────────┤
│                                             │
│  🟢 Active Project      Started Oct 24      │
│  Status badge                               │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  TABS                                       │
│  ┌────────┐┌──────────┐┌────────┐          │
│  │Overview││  Daily   ││Reports │          │
│  │   ●   ││  Entries ││        │          │
│  └────────┘└──────────┘└────────┘          │
│  Swipe or tap to switch                     │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  TOTAL PROGRESS                        📈   │
│                                             │
│  75% to Goal                                │
│  Large percentage                           │
│  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░                      │
│  Progress bar                               │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  KEY METRICS (2x2 grid)                     │
│                                             │
│  ┌──────────────┐  ┌──────────────┐        │
│  │ 🔥 Streak    │  │ ⏱️ Total Time│        │
│  │              │  │              │        │
│  │ 12 Days      │  │ 48.5h        │        │
│  │ +2 days      │  │ +5.5h        │        │
│  │ Green trend  │  │ Green trend  │        │
│  └──────────────┘  └──────────────┘        │
│                                             │
│  ┌──────────────┐  ┌──────────────┐        │
│  │ 💰 Net Profit│  │ ✅ Tasks     │        │
│  │              │  │              │        │
│  │ +$3,240      │  │ 24/32        │        │
│  │ Green        │  │ 75% complete │        │
│  └──────────────┘  └──────────────┘        │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  POSTS (3)                        [View All]│
│  Optional content reference                 │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 📘 Launch Announcement              │   │
│  │    Facebook • Oct 24                │   │
│  └─────────────────────────────────────┘   │
│  Tap → Post Detail (Screen 13)              │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 📸 Product Demo Video               │   │
│  │    Instagram • Oct 25               │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 🎬 Tutorial Series Ep 1             │   │
│  │    YouTube • Oct 26                 │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  [+ Add Post]                               │
│  Tap → Add Post Modal (Screen 12)           │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  RECENT ENTRIES (Last 3)                    │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 💵 Daily Entry                      │   │
│  │    Oct 26 • +$180 profit       2h ago│   │
│  │                                     │   │
│  │    Revenue: $450  Spend: $270       │   │
│  │    DMs: 8                           │   │
│  └─────────────────────────────────────┘   │
│  Tap → Entry Detail (Screen 8)              │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 💵 Daily Entry                      │   │
│  │    Oct 25 • +$120 profit   Yesterday│   │
│  │                                     │   │
│  │    Revenue: $350  Spend: $230       │   │
│  │    DMs: 5                           │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 💵 Daily Entry                      │   │
│  │    Oct 24 • -$50 loss      Oct 24   │   │
│  │                            Red      │   │
│  │    Revenue: $150  Spend: $200       │   │
│  │    DMs: 3                           │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  [View All Entries →]                       │
│  Tap → Daily Entries Tab (Screen 4)         │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│         ┌──────────────────────────┐        │
│         │ ✏️ Log Daily Entry       │        │
│         └──────────────────────────┘        │
│         Large green button                  │
│         Tap → Screen 7                      │
│                                             │
│                    ┌────┐                   │
│                    │ 📊 │                   │
│                    └────┘                   │
│                    Reports                  │
│                    Small FAB                │
│                    Tap → Reports Tab (5)    │
│                                             │
└─────────────────────────────────────────────┘
```

---

## 4. TRACKER HUB - DAILY ENTRIES TAB

**Title:** [Tracker Name]  
**Subtitle:** Daily Entries

**Description:** Complete chronological list of all daily entries for this tracker with filters and summary stats.

**Functions:**
- View all entries chronologically
- Filter by date range
- See weekly/monthly summaries
- Quick add entry
- Edit past entries
- View entry details

**Navigation:**
- Tap [←] → Back to Dashboard (Screen 1)
- Tap entry → Entry Detail (Screen 8)
- Tap [+ FAB] → Log Daily Entry (Screen 7)
- Tap [Edit Historical Data] → Historical Data Edit (Screen 20)
- Tap date filter → Changes view

```
┌─────────────────────────────────────────────┐
│  ←  NeoLaunch                          ⋮    │
│      Daily Entries                          │
├─────────────────────────────────────────────┤
│                                             │
│  TABS                                       │
│  ┌────────┐┌──────────┐┌────────┐          │
│  │Overview││  Daily   ││Reports │          │
│  │        ││Entries ●││        │          │
│  └────────┘└──────────┘└────────┘          │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  SUMMARY (This Month)                       │
│                                             │
│  Total Entries: 12                          │
│  Total Profit: +$3,240                      │
│  Avg Daily Profit: +$270                    │
│  Best Day: Oct 25 (+$450)                   │
│  Worst Day: Oct 24 (-$50)                   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  FILTER                                     │
│  ┌────────┐┌────────┐┌────────┐            │
│  │This Wk ││This Mo.││All Time│            │
│  │        ││   ●   ││        │            │
│  └────────┘└────────┘└────────┘            │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  THIS WEEK                                  │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 💵 Oct 26, 2023                     │   │
│  │                                     │   │
│  │    Net Profit: +$180                │   │
│  │    Green, large                     │   │
│  │                                     │   │
│  │    Revenue: $450                    │   │
│  │    Spend: $270                      │   │
│  │    DMs/Leads: 8                     │   │
│  │                                     │   │
│  │    Platforms:                       │   │
│  │    • Facebook: $100                 │   │
│  │    • Instagram: $120                │   │
│  │    • YouTube: $50                   │   │
│  │                                     │   │
│  │    [View Details]                   │   │
│  └─────────────────────────────────────┘   │
│  Tap card → Entry Detail (Screen 8)         │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 💵 Oct 25, 2023                     │   │
│  │                                     │   │
│  │    Net Profit: +$120                │   │
│  │                                     │   │
│  │    Revenue: $350                    │   │
│  │    Spend: $230                      │   │
│  │    DMs/Leads: 5                     │   │
│  │                                     │   │
│  │    Platforms:                       │   │
│  │    • Facebook: $80                  │   │
│  │    • Instagram: $100                │   │
│  │    • YouTube: $50                   │   │
│  │                                     │   │
│  │    [View Details]                   │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 💵 Oct 24, 2023                     │   │
│  │                                     │   │
│  │    Net Profit: -$50                 │   │
│  │    Red, indicates loss              │   │
│  │                                     │   │
│  │    Revenue: $150                    │   │
│  │    Spend: $200                      │   │
│  │    DMs/Leads: 3                     │   │
│  │                                     │   │
│  │    Platforms:                       │   │
│  │    • Facebook: $100                 │   │
│  │    • Instagram: $100                │   │
│  │                                     │   │
│  │    [View Details]                   │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  LAST WEEK (Oct 17-23)                      │
│  Weekly Summary: +$890 profit               │
│  7 entries                                  │
│                                             │
│  [Show 7 entries ▼]                         │
│  Tap to expand                              │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  EARLIER (9 more entries)                   │
│  [Load More →]                              │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Need to fix a past mistake?                │
│  [Edit Historical Data →]                   │
│  Tap → Screen 20                            │
│                                             │
│                         ┌─────────┐         │
│                         │    +    │         │
│                         │   Log   │         │
│                         │  Entry  │         │
│                         └─────────┘         │
│                         Tap → Screen 7      │
│                                             │
└─────────────────────────────────────────────┘
```

---

## 5. TRACKER HUB - REPORTS TAB

**Title:** [Tracker Name]  
**Subtitle:** Reports

**Description:** Performance reports showing profit/loss breakdowns, trends, and insights - numbers only, no charts.

**Functions:**
- View time period reports (daily/weekly/monthly)
- See total profit/loss including setup costs
- View revenue vs spend over time
- Identify worst performing days
- See burn rate
- Export report (optional)

**Navigation:**
- Tap [←] → Back to Dashboard (Screen 1)
- Tap time filter → Changes report period
- Tap [Export Report] → Generates PDF/CSV (optional)

```
┌─────────────────────────────────────────────┐
│  ←  NeoLaunch                          ⋮    │
│      Reports                                │
├─────────────────────────────────────────────┤
│                                             │
│  TABS                                       │
│  ┌────────┐┌──────────┐┌────────┐          │
│  │Overview││  Daily   ││Reports │          │
│  │        ││  Entries ││   ●   │          │
│  └────────┘└──────────┘└────────┘          │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  TIME PERIOD                                │
│  ┌────────┐┌────────┐┌────────┐            │
│  │ Daily  ││ Weekly ││Monthly │            │
│  │        ││        ││   ●   │            │
│  └────────┘└────────┘└────────┘            │
│  Tap to change report view                  │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  MONTHLY REPORT (October 2023)              │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 📊 TOTAL PROFIT/LOSS                │   │
│  │                                     │   │
│  │    Net Profit: +$3,040              │   │
│  │    Large, green (profitable)        │   │
│  │                                     │   │
│  │    Total Revenue:    $12,400        │   │
│  │    Total Spend:      -$4,159        │   │
│  │    Setup Costs:      -$200          │   │
│  │    ────────────────────────          │   │
│  │    Final Profit:     +$3,040        │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 📈 REVENUE VS SPEND OVER TIME       │   │
│  │                                     │   │
│  │    Week 1 (Oct 1-7):                │   │
│  │    Revenue: $2,100                  │   │
│  │    Spend:   $890                    │   │
│  │    Profit:  +$1,210                 │   │
│  │                                     │   │
│  │    Week 2 (Oct 8-14):               │   │
│  │    Revenue: $3,200                  │   │
│  │    Spend:   $1,150                  │   │
│  │    Profit:  +$2,050                 │   │
│  │                                     │   │
│  │    Week 3 (Oct 15-21):              │   │
│  │    Revenue: $4,100                  │   │
│  │    Spend:   $1,320                  │   │
│  │    Profit:  +$2,780                 │   │
│  │                                     │   │
│  │    Week 4 (Oct 22-28):              │   │
│  │    Revenue: $3,000                  │   │
│  │    Spend:   $799                    │   │
│  │    Profit:  +$2,201                 │   │
│  │                                     │   │
│  │    Trend: 📈 Increasing profit      │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ ⚠️ WORST PERFORMING DAYS            │   │
│  │                                     │   │
│  │    1. Oct 24: -$50 loss             │   │
│  │       Revenue: $150, Spend: $200    │   │
│  │       Red, negative                 │   │
│  │                                     │   │
│  │    2. Oct 3: +$15 profit            │   │
│  │       Revenue: $180, Spend: $165    │   │
│  │       Barely profitable             │   │
│  │                                     │   │
│  │    3. Oct 11: +$35 profit           │   │
│  │       Revenue: $220, Spend: $185    │   │
│  │       Low profit margin             │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 💸 BURN RATE                        │   │
│  │    How fast you're spending money   │   │
│  │                                     │   │
│  │    Average Daily Spend: $134        │   │
│  │    Average Weekly Spend: $938       │   │
│  │    Average Monthly Spend: $4,159    │   │
│  │                                     │   │
│  │    Current Pace:                    │   │
│  │    At this rate, you'll spend       │   │
│  │    $49,908 per year on ads          │   │
│  │                                     │   │
│  │    ROI: 298%                        │   │
│  │    For every $1 spent, you earn     │   │
│  │    $2.98 in revenue                 │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 💰 CUMULATIVE PROFIT TREND          │   │
│  │                                     │   │
│  │    Oct 1:  -$200 (setup cost)       │   │
│  │    Oct 7:  +$1,010                  │   │
│  │    Oct 14: +$3,060                  │   │
│  │    Oct 21: +$5,840                  │   │
│  │    Oct 28: +$8,041                  │   │
│  │                                     │   │
│  │    Break-even: Oct 4 (day 4)        │   │
│  │    Recovered setup costs on Oct 4   │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  [📤 Export Report]                         │
│  Optional: Generate PDF or CSV              │
│                                             │
└─────────────────────────────────────────────┘
```

---

# Performance Tracker Module - Wireframes (Pages 6-20)

---

## 6. ARCHIVE VIEW

**Title:** Archived Trackers  
**Subtitle:** Performance

**Description:** List of archived performance trackers that are no longer active but preserved for reference.

**Functions:**
- View all archived trackers
- See final profit/loss for each
- Restore archived tracker
- Permanently delete tracker
- Search archived trackers

**Navigation:**
- Tap [←] → Back to Dashboard (Screen 1)
- Tap tracker card → Tracker Hub (read-only)
- Tap [Restore] → Moves to active trackers
- Tap [Delete] → Delete Confirmation (Screen 15)

```
┌─────────────────────────────────────────────┐
│  ←  Archived Trackers                  [🔍] │
│      Performance                            │
│      Tap [🔍] to search                      │
├─────────────────────────────────────────────┤
│                                             │
│  These trackers are archived but preserved  │
│  for reference. You can restore or          │
│  permanently delete them.                   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  ARCHIVED TRACKERS (5)                      │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 📱 Summer Product Launch            │   │
│  │    E-commerce Campaign              │   │
│  │                                     │   │
│  │    Archived: Sep 30, 2023           │   │
│  │    Duration: 3 months               │   │
│  │    Final Profit: +$8,450            │   │
│  │    Green, successful                │   │
│  │                                     │   │
│  │    [Restore] [Delete]               │   │
│  └─────────────────────────────────────┘   │
│  Tap card → Tracker Hub (read-only view)    │
│  Tap [Restore] → Moves to active            │
│  Tap [Delete] → Screen 15                   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 🎬 Video Series Q2                  │   │
│  │    Content Marketing                │   │
│  │                                     │   │
│  │    Archived: Jun 30, 2023           │   │
│  │    Duration: 3 months               │   │
│  │    Final Profit: +$2,180            │   │
│  │                                     │   │
│  │    [Restore] [Delete]               │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 🛒 Black Friday Sale                │   │
│  │    Seasonal Campaign                │   │
│  │                                     │   │
│  │    Archived: Dec 1, 2022            │   │
│  │    Duration: 1 month                │   │
│  │    Final Profit: +$5,340            │   │
│  │                                     │   │
│  │    [Restore] [Delete]               │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 📧 Email Lead Gen Test              │   │
│  │    Lead Generation                  │   │
│  │                                     │   │
│  │    Archived: Mar 15, 2023           │   │
│  │    Duration: 2 months               │   │
│  │    Final Profit: -$320              │   │
│  │    Red, loss                        │   │
│  │                                     │   │
│  │    [Restore] [Delete]               │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 🎯 Retargeting Test                 │   │
│  │    Experimental Campaign            │   │
│  │                                     │   │
│  │    Archived: Feb 10, 2023           │   │
│  │    Duration: 1 month                │   │
│  │    Final Profit: -$150              │   │
│  │    Red, loss                        │   │
│  │                                     │   │
│  │    [Restore] [Delete]               │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  💡 Archived trackers don't count toward    │
│     active performance metrics              │
│                                             │
└─────────────────────────────────────────────┘
```

---

## 7. LOG DAILY ENTRY

**Title:** Log Entry  
**Subtitle:** [Date]

**Description:** Daily entry form to log ad spend per platform, total revenue, and DMs/leads for the day.

**Functions:**
- Navigate date (prev/next day)
- View total revenue summary
- Add platform ad spend rows
- Enter platform spend amounts
- Log total revenue
- Count DMs/leads (optional)
- Add growth/setup costs (optional)
- Edit historical data link
- Save entry

**Navigation:**
- Tap [×] → Cancel, dismiss
- Tap [←][→] arrows → Change date
- Tap [+ Add Post Spend] → Adds spend row (Screen 17)
- Tap [−] on post → Removes spend row
- Tap [Save] → Saves entry, returns to Tracker Hub
- Tap [Edit Historical Data] → Screen 20

```
┌─────────────────────────────────────────────┐
│  ×  Log Entry                          Save │
│                                             │
├─────────────────────────────────────────────┤
│                                             │
│  DATE SELECTOR                              │
│  ┌────┐                            ┌────┐  │
│  │ ←  │  TODAY - Oct 24, 2023      │ →  │  │
│  └────┘                            └────┘  │
│  Tap arrows to change date                  │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ TOTAL REVENUE RECEIVED              │   │
│  │                                     │   │
│  │ $  0.00                             │   │
│  │                                     │   │
│  │ Large input field                   │   │
│  │ Daily total across all channels     │   │
│  └─────────────────────────────────────┘   │
│  How much did you earn today?               │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  📈 GROWTH & SETUP                          │
│  One-time or growth costs                   │
│                                             │
│  New Followers                 Engagement   │
│  ┌──────────┐                 ┌──────────┐ │
│  │ 0     ▲▼│                 │ 0.0    %│ │
│  └──────────┘                 └──────────┘ │
│  Optional metrics                           │
│                                             │
│  Misc Cost (Setup/Tools)                    │
│  ┌─────────────────────────────────────┐   │
│  │ $ 0.00                         [📋] │   │
│  └─────────────────────────────────────┘   │
│  Optional: Initial setup or tool costs      │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  📢 AD SPEND                Today: $50.00   │
│  Platform-level ad spending                 │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 📘 Post: Launch Promo               │   │
│  │    Instagram • Boost         [−]    │   │
│  │                                     │   │
│  │    $ 50.00                          │   │
│  │    How much spent on this?          │   │
│  └─────────────────────────────────────┘   │
│  Tap [−] to remove this spend entry         │
│                                             │
│  ┌───────────────────────────────────┐     │
│  │      + Add Post Spend             │     │
│  └───────────────────────────────────┘     │
│  Dashed button - tap → Screen 17            │
│  Adds another platform spend row            │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  💬 DMS / LEADS              Inbound only   │
│  How many messages/leads received?          │
│                                             │
│       ┌────┐                                │
│       │ −  │       12        ┌────┐         │
│       └────┘                 │ +  │         │
│                              └────┘         │
│       Tap to decrease       Tap to increase │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Need to fix a past mistake?                │
│  [Edit Historical Data →]                   │
│  Tap → Screen 20                            │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  SUMMARY                                    │
│  Revenue:     $0.00                         │
│  Spend:       -$50.00                       │
│  Profit/Loss: -$50.00 (Red, loss)           │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  [Cancel]                      [Save Entry] │
│                                             │
│  VALIDATION:                                │
│  - Revenue required (can be 0)              │
│  - At least 1 ad spend entry recommended    │
│  - DMs/Leads optional                       │
│                                             │
└─────────────────────────────────────────────┘

AFTER ADDING POST SPEND (multiple platforms):

│  📢 AD SPEND                Today: $150.00  │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 📘 Facebook General Ads         [−] │   │
│  │    Facebook                         │   │
│  │                                     │   │
│  │    $ 50.00                          │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 📸 Product Showcase             [−] │   │
│  │    Instagram • Boost                │   │
│  │                                     │   │
│  │    $ 70.00                          │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 🎬 Tutorial Promo               [−] │   │
│  │    YouTube • Ad                     │   │
│  │                                     │   │
│  │    $ 30.00                          │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌───────────────────────────────────┐     │
│  │      + Add Post Spend             │     │
│  └───────────────────────────────────┘     │
```

---

## 8. ENTRY DETAIL VIEW

**Title:** Entry Detail  
**Subtitle:** [Date]

**Description:** Read-only or editable view of a single daily entry showing all logged data.

**Functions:**
- View complete entry details
- See all platform spends
- View revenue and profit
- See DMs/leads count
- Edit entry
- Delete entry

**Navigation:**
- Tap [←] → Back to Entries Tab (Screen 4)
- Tap [Edit] → Edit Entry (Screen 9)
- Tap [Delete] → Confirmation, deletes entry

```
┌─────────────────────────────────────────────┐
│  ←  Entry Detail                      [Edit]│
│      Oct 24, 2023                           │
│      Tap [Edit] to modify                   │
├─────────────────────────────────────────────┤
│                                             │
│  PROFIT/LOSS SUMMARY                        │
│                                             │
│  Net Profit: -$50                           │
│  Red, large (indicates loss)                │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  BREAKDOWN                                  │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 💰 REVENUE                          │   │
│  │                                     │   │
│  │    Total Received: $150.00          │   │
│  │    From all channels combined       │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 💸 AD SPEND                         │   │
│  │                                     │   │
│  │    Facebook:     $100.00            │   │
│  │    Instagram:    $100.00            │   │
│  │    ──────────────────────            │   │
│  │    Total Spend:  $200.00            │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 💬 DMS / LEADS                      │   │
│  │                                     │   │
│  │    Total Received: 3 messages       │   │
│  │    Potential leads                  │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 📈 GROWTH METRICS                   │   │
│  │                                     │   │
│  │    New Followers:  0                │   │
│  │    Engagement:     0.0%             │   │
│  │    Growth Spend:   $0.00            │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  CALCULATION                                │
│                                             │
│  Revenue:           +$150.00                │
│  Total Spend:       -$200.00                │
│  ────────────────────────────               │
│  Daily Profit:      -$50.00                 │
│  Red (loss)                                 │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  METADATA                                   │
│  • Logged: Oct 24, 2023 at 11:30 PM         │
│  • Last edited: Never                       │
│  • Tracker: NeoLaunch                       │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  ACTIONS                                    │
│  [Edit Entry] [Delete Entry]                │
│                                             │
└─────────────────────────────────────────────┘
```

---

## 9. EDIT ENTRY

**Title:** Edit Entry  
**Subtitle:** [Date]

**Description:** Edit form for modifying an existing daily entry's data.

**Functions:**
- Modify revenue amount
- Edit platform spends
- Update DMs/leads count
- Change growth metrics
- Save changes
- Cancel edits

**Navigation:**
- Tap [Cancel] → Discards changes, back to Entry Detail (Screen 8)
- Tap [Save Changes] → Updates entry, returns to Entry Detail

```
┌─────────────────────────────────────────────┐
│  Cancel     Edit Entry          Save Changes│
│              Oct 24, 2023                   │
├─────────────────────────────────────────────┤
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ TOTAL REVENUE RECEIVED              │   │
│  │                                     │   │
│  │ $  150.00                           │   │
│  │                                     │   │
│  │ Editable field                      │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  📈 GROWTH & SETUP                          │
│                                             │
│  New Followers                 Engagement   │
│  ┌──────────┐                 ┌──────────┐ │
│  │ 0     ▲▼│                 │ 0.0    %│ │
│  └──────────┘                 └──────────┘ │
│                                             │
│  Misc Cost (Setup/Tools)                    │
│  ┌─────────────────────────────────────┐   │
│  │ $ 0.00                         [📋] │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  📢 AD SPEND                Today: $200.00  │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 📘 Facebook General             [−] │   │
│  │    Facebook                         │   │
│  │                                     │   │
│  │    $ 100.00                         │   │
│  │    Editable                         │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 📸 Instagram Boost              [−] │   │
│  │    Instagram                        │   │
│  │                                     │   │
│  │    $ 100.00                         │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌───────────────────────────────────┐     │
│  │      + Add Post Spend             │     │
│  └───────────────────────────────────┘     │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  💬 DMS / LEADS              Inbound only   │
│                                             │
│       ┌────┐                                │
│       │ −  │        3        ┌────┐         │
│       └────┘                 │ +  │         │
│                              └────┘         │
│       Editable counter                      │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  SUMMARY                                    │
│  Revenue:     $150.00                       │
│  Spend:       -$200.00                      │
│  Profit/Loss: -$50.00 (Red, loss)           │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  [Cancel]                   [Save Changes]  │
│                                             │
└─────────────────────────────────────────────┘
```

---

## 10. ENTRY HISTORY (ALL ENTRIES LIST)

**Title:** All Entries  
**Subtitle:** [Tracker Name]

**Description:** Comprehensive scrollable list of all entries ever logged for this tracker with search/filter.

**Functions:**
- View complete entry history
- Search entries by date
- Filter by profit/loss
- Quick stats summary
- Jump to specific entry

**Navigation:**
- Tap [←] → Back to Entries Tab (Screen 4)
- Tap entry → Entry Detail (Screen 8)
- Tap search → Search by date/amount

```
┌─────────────────────────────────────────────┐
│  ←  All Entries                        [🔍] │
│      NeoLaunch - Complete History           │
├─────────────────────────────────────────────┤
│                                             │
│  OVERVIEW                                   │
│  Total Entries: 28                          │
│  Date Range: Sep 1 - Oct 26, 2023           │
│  Total Profit: +$8,240.50                   │
│  Avg Daily: +$294.30                        │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  FILTERS                                    │
│  ┌────────┐┌────────┐┌────────┐            │
│  │  All   ││ Profit ││  Loss  │            │
│  │   ●   ││        ││        │            │
│  └────────┘└────────┘└────────┘            │
│  Tap to filter profitable vs loss days      │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  OCTOBER 2023 (26 entries)                  │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ Oct 26 • +$180 profit               │   │
│  │ Revenue: $450  Spend: $270          │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ Oct 25 • +$120 profit               │   │
│  │ Revenue: $350  Spend: $230          │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ Oct 24 • -$50 loss                  │   │
│  │ Revenue: $150  Spend: $200          │   │
│  │ Red text                            │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ Oct 23 • +$340 profit               │   │
│  │ Revenue: $580  Spend: $240          │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  (22 more October entries...)               │
│  [Show All ▼]                               │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  SEPTEMBER 2023 (2 entries)                 │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ Sep 30 • +$280 profit               │   │
│  │ Revenue: $490  Spend: $210          │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ Sep 1 • -$200 loss (Setup)          │   │
│  │ Revenue: $0  Setup Cost: $200       │   │
│  │ Red text, initial setup             │   │
│  └─────────────────────────────────────┘   │
│                                             │
└─────────────────────────────────────────────┘
```

---

## 11. POSTS LIST (within Overview)

**Title:** Posts  
**Subtitle:** Content reference

**Description:** Optional list of content posts for reference and organization (not required for tracking).

**Functions:**
- View all posts added
- See post platform and date
- Add new post
- Edit/delete posts
- Quick reference for daily logging

**Navigation:**
- Tap [←] → Back to Overview (Screen 3)
- Tap [+ Add Post] → Add Post Modal (Screen 12)
- Tap post → Edit Post Modal (Screen 13)

```
┌─────────────────────────────────────────────┐
│  ←  Posts                          [+ Add]  │
│      NeoLaunch                              │
│      Tap [+ Add] to create                  │
├─────────────────────────────────────────────┤
│                                             │
│  CONTENT POSTS (8)                          │
│  Optional reference list                    │
│                                             │
│  These posts help you organize your content │
│  but aren't required for daily tracking.    │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 📘 Launch Announcement              │   │
│  │    Facebook • Oct 24, 2023          │   │
│  │                                     │   │
│  │    "Introducing NeoLaunch - the     │   │
│  │    future of SaaS..."               │   │
│  │                                     │   │
│  │    [Edit]                           │   │
│  └─────────────────────────────────────┘   │
│  Tap card → Edit Post Modal (Screen 13)     │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 📸 Product Demo Video               │   │
│  │    Instagram • Oct 25, 2023         │   │
│  │                                     │   │
│  │    "Watch how NeoLaunch helps you   │   │
│  │    automate workflows..."           │   │
│  │                                     │   │
│  │    [Edit]                           │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 🎬 Tutorial Series Ep 1             │   │
│  │    YouTube • Oct 26, 2023           │   │
│  │                                     │   │
│  │    "Getting Started with NeoLaunch" │   │
│  │                                     │   │
│  │    [Edit]                           │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 📝 Blog Post: Why SaaS Needs...     │   │
│  │    Blog • Oct 27, 2023              │   │
│  │                                     │   │
│  │    "Why SaaS companies need better  │   │
│  │    automation tools"                │   │
│  │                                     │   │
│  │    [Edit]                           │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 🐦 Twitter Thread Launch            │   │
│  │    Twitter • Oct 24, 2023           │   │
│  │                                     │   │
│  │    "I built NeoLaunch to solve..."  │   │
│  │                                     │   │
│  │    [Edit]                           │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  (3 more posts...)                          │
│  [Show All ▼]                               │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  💡 TIP: Posts are for reference only.      │
│     You can track ad spend without adding   │
│     posts to this list.                     │
│                                             │
└─────────────────────────────────────────────┘
```

---

## 12. ADD POST MODAL

**Title:** Add Post  
**Subtitle:** None

**Description:** Quick modal to add a content post for reference.

**Functions:**
- Enter post title
- Select platform
- Set publish date
- Add post link (optional)
- Add description
- Save post

**Navigation:**
- Tap [×] → Cancel, dismiss
- Tap [Add Post] → Creates post, returns to Posts List

```
┌─────────────────────────────────────────────┐
│  Add Post                              [×]  │
├─────────────────────────────────────────────┤
│                                             │
│  Post Title *                               │
│  ┌─────────────────────────────────────┐   │
│  │ Launch Announcement                 │   │
│  └─────────────────────────────────────┘   │
│  What content did you publish?              │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Platform *                                 │
│  ┌─────────────────────────────────────┐   │
│  │ Facebook                       [▼] │   │
│  └─────────────────────────────────────┘   │
│  Options: YouTube, Instagram, Facebook,     │
│  Twitter, Blog, LinkedIn, Other             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Publish Date *                             │
│  ┌─────────────────────────────────────┐   │
│  │ 📅 Oct 24, 2023               [→]   │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Post Link (Optional)                       │
│  ┌─────────────────────────────────────┐   │
│  │ https://facebook.com/...            │   │
│  └─────────────────────────────────────┘   │
│  Link to the actual post                    │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Description (Optional)                     │
│  ┌─────────────────────────────────────┐   │
│  │ Introducing NeoLaunch - the future  │   │
│  │ of SaaS automation. Get early       │   │
│  │ access now!                         │   │
│  └─────────────────────────────────────┘   │
│  Post caption or summary                    │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  [Cancel]                      [Add Post]   │
│                                             │
│  VALIDATION:                                │
│  - Title required (min 3 chars)             │
│  - Platform required                        │
│  - Date required                            │
│  - Link and description optional            │
│                                             │
└─────────────────────────────────────────────┘
```

---

## 13. EDIT/DELETE POST MODAL

**Title:** Edit Post  
**Subtitle:** None

**Description:** Edit or delete an existing post reference.

**Functions:**
- Modify post details
- Change platform
- Update date
- Delete post
- Save changes

**Navigation:**
- Tap [×] → Cancel, dismiss
- Tap [Save Changes] → Updates post
- Tap [Delete Post] → Confirmation, deletes

```
┌─────────────────────────────────────────────┐
│  Edit Post                             [×]  │
├─────────────────────────────────────────────┤
│                                             │
│  Post Title *                               │
│  ┌─────────────────────────────────────┐   │
│  │ Launch Announcement                 │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Platform *                                 │
│  ┌─────────────────────────────────────┐   │
│  │ Facebook                       [▼] │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Publish Date *                             │
│  ┌─────────────────────────────────────┐   │
│  │ 📅 Oct 24, 2023               [→]   │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Post Link                                  │
│  ┌─────────────────────────────────────┐   │
│  │ https://facebook.com/post/123456    │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Description                                │
│  ┌─────────────────────────────────────┐   │
│  │ Introducing NeoLaunch - the future  │   │
│  │ of SaaS automation. Get early       │   │
│  │ access now!                         │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  METADATA                                   │
│  • Added: Oct 24, 2023                      │
│  • Last edited: Never                       │
│  • Tracker: NeoLaunch                       │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  [Delete Post]          [Save Changes]      │
│  Red text                                   │
│                                             │
└─────────────────────────────────────────────┘
```

---

## 14. EDIT TRACKER SETTINGS

**Title:** Edit Tracker  
**Subtitle:** [Tracker Name]

**Description:** Edit tracker details including name, platforms, currency, and setup costs.

**Functions:**
- Modify tracker name
- Update start date
- Change platforms
- Update currency (with warning)
- Add/edit setup costs
- Update notes
- Save changes

**Navigation:**
- Tap [←] → Back to Tracker Hub (Screen 3)
- Tap [Save Changes] → Updates tracker
- Tap [Cancel] → Discards changes

```
┌─────────────────────────────────────────────┐
│  ←  Edit Tracker                            │
│      NeoLaunch                              │
├─────────────────────────────────────────────┤
│                                             │
│  Modify tracker settings and details        │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Project Name *                             │
│  ┌─────────────────────────────────────┐   │
│  │ NeoLaunch                           │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Start Date *                               │
│  ┌─────────────────────────────────────┐   │
│  │ 📅 Oct 24, 2023               [→]   │   │
│  └─────────────────────────────────────┘   │
│  ⚠️ Changing start date affects reports     │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Target Platforms                           │
│                                             │
│  ┌────────┐ ┌────────┐ ┌────────┐          │
│  │☑YouTube│ │☑LinkedIn││☑ Blog │          │
│  └────────┘ └────────┘ └────────┘          │
│                                             │
│  ┌────────┐ ┌────────┐                     │
│  │☐Twitter│ │☑Instag.│                     │
│  └────────┘ └────────┘                     │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Currency *                                 │
│  ┌─────────────────────────────────────┐   │
│  │ 💲 USD - US Dollar            [▼]   │   │
│  └─────────────────────────────────────┘   │
│  ⚠️ WARNING: Changing currency will affect  │
│     all past entries and calculations       │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Total Setup/Growth Costs                   │
│  Initial investment in this campaign        │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ $ 200.00                            │   │
│  └─────────────────────────────────────┘   │
│  Update if you invested more                │
│                                             │
│  💡 This affects total profit calculations  │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Notes                                      │
│  ┌─────────────────────────────────────┐   │
│  │ SaaS platform launch campaign.      │   │
│  │ Focus on developer communities      │   │
│  │ and product hunt.                   │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  TRACKER STATS (Read-only)                  │
│  • Created: Oct 24, 2023                    │
│  • Days active: 28 days                     │
│  • Total entries: 28                        │
│  • Current profit: +$8,240.50               │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  [Cancel]              [Save Changes]       │
│                                             │
└─────────────────────────────────────────────┘
```

---

## 15. DELETE TRACKER CONFIRMATION

**Title:** Delete Tracker  
**Subtitle:** Confirm deletion

**Description:** Confirmation modal before permanently deleting a tracker and all its data.

**Functions:**
- Show what will be deleted
- Require confirmation
- Permanently delete tracker
- Cancel deletion

**Navigation:**
- Tap [Cancel] → Dismisses, no action
- Tap [Delete Permanently] → Deletes tracker, returns to Dashboard

```
┌─────────────────────────────────────────────┐
│                                             │
│                                             │
│         ┌───────────────────────────────┐   │
│         │ ⚠️ Delete Tracker?            │   │
│         │                               │   │
│         │  ─────────────────────────    │   │
│         │                               │   │
│         │  This will permanently delete:│   │
│         │                               │   │
│         │  • NeoLaunch tracker          │   │
│         │  • 28 daily entries           │   │
│         │  • 8 posts                    │   │
│         │  • All performance data       │   │
│         │                               │   │
│         │  This cannot be undone!       │   │
│         │                               │   │
│         │  ─────────────────────────    │   │
│         │                               │   │
│         │  Type tracker name to confirm:│   │
│         │                               │   │
│         │  ┌─────────────────────────┐ │   │
│         │  │ NeoLaunch               │ │   │
│         │  └─────────────────────────┘ │   │
│         │  Must match exactly           │   │
│         │                               │   │
│         │  ─────────────────────────    │   │
│         │                               │   │
│         │  [Cancel]  [Delete Permanently]│   │
│         │            Red button         │   │
│         │            Enabled only when  │   │
│         │            name matches       │   │
│         │                               │   │
│         └───────────────────────────────┘   │
│                                             │
│                                             │
└─────────────────────────────────────────────┘
```

---

## 16. PLATFORM MANAGEMENT

**Title:** Platforms  
**Subtitle:** [Tracker Name]

**Description:** Manage which platforms are active for this tracker (for future expansion).

**Functions:**
- View active platforms
- Add new platforms
- Remove platforms
- Reorder platforms

**Navigation:**
- Tap [←] → Back to Tracker Hub
- Tap [+ Add Platform] → Adds platform
- Tap [×] on platform → Removes it

```
┌─────────────────────────────────────────────┐
│  ←  Platforms                               │
│      NeoLaunch                              │
├─────────────────────────────────────────────┤
│                                             │
│  Manage which platforms you're tracking     │
│  for this campaign.                         │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  ACTIVE PLATFORMS (4)                       │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ ▤ YouTube                       [×] │   │
│  │   Drag to reorder                   │   │
│  └─────────────────────────────────────┘   │
│  Tap [×] to remove                          │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ ▤ Instagram                     [×] │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ ▤ Blog                          [×] │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ ▤ LinkedIn                      [×] │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  AVAILABLE PLATFORMS                        │
│                                             │
│  ┌────────┐ ┌────────┐                     │
│  │Facebook│ │Twitter │                     │
│  │  [+]   │ │  [+]   │                     │
│  └────────┘ └────────┘                     │
│  Tap [+] to add                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  [+ Add Custom Platform]                    │
│  Create your own platform name              │
│                                             │
└─────────────────────────────────────────────┘
```

---

## 17. ADD PLATFORM SPEND ROW

**Title:** Add Post Spend  
**Subtitle:** None

**Description:** Mini modal to add a platform ad spend row to daily entry.

**Functions:**
- Enter post/ad name
- Select platform
- Set spend amount
- Add to entry

**Navigation:**
- Tap [×] → Cancel
- Tap [Add] → Adds row to daily entry (Screen 7)

```
┌─────────────────────────────────────────────┐
│  Add Post Spend                        [×]  │
├─────────────────────────────────────────────┤
│                                             │
│  Post/Ad Name                               │
│  ┌─────────────────────────────────────┐   │
│  │ Launch Promo                        │   │
│  └─────────────────────────────────────┘   │
│  What ad/post is this for?                  │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Platform *                                 │
│  ┌─────────────────────────────────────┐   │
│  │ Instagram                      [▼] │   │
│  └─────────────────────────────────────┘   │
│  Options: Active platforms only             │
│  (YouTube, Instagram, Blog, LinkedIn)       │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Ad Type                                    │
│  ┌─────────────────────────────────────┐   │
│  │ Boost                          [▼] │   │
│  └─────────────────────────────────────┘   │
│  Options: Boost, Sponsored, Promoted, Ad    │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Amount Spent *                             │
│  ┌─────────────────────────────────────┐   │
│  │ $ 50.00                             │   │
│  └─────────────────────────────────────┘   │
│  How much did you spend on this?            │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  [Cancel]                           [Add]   │
│                                             │
│  VALIDATION:                                │
│  - Platform required                        │
│  - Amount required (must be > 0)            │
│  - Name optional                            │
│                                             │
└─────────────────────────────────────────────┘
```

---

## 18. AI QUICK START MODAL

**Title:** AI Quick Start  
**Subtitle:** Smart setup

**Description:** AI-guided setup flow that asks questions and pre-fills tracker creation form.

**Functions:**
- Ask contextual questions
- Suggest tracker name
- Recommend platforms
- Estimate targets
- Pre-fill creation form

**Navigation:**
- Tap [×] → Cancel, back to Create Tracker
- Tap [Skip AI] → Manual creation
- Answer questions → Tap [Apply Setup] → Pre-fills Create Tracker form

```
┌─────────────────────────────────────────────┐
│  ×  AI Quick Start                          │
│      Smart setup for your tracker           │
├─────────────────────────────────────────────┤
│                                             │
│  QUESTION 2 OF 5                            │
│  ●●○○○                                      │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │                                     │   │
│  │  🤖 AI: What platforms will you     │   │
│  │  focus on for this campaign?        │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  Your Answer:                               │
│                                             │
│  ┌────────┐ ┌────────┐ ┌────────┐          │
│  │☑Facebook││☑Instag.││☐ YouTube│          │
│  └────────┘ └────────┘ └────────┘          │
│                                             │
│  ┌────────┐ ┌────────┐ ┌────────┐          │
│  │☐Twitter│ │☑ Blog │ │☐LinkedIn│          │
│  └────────┘ └────────┘ └────────┘          │
│  Tap to select platforms                    │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  [Skip AI]               [Next Question →]  │
│                                             │
│                                             │
│  CONVERSATION HISTORY:                      │
│                                             │
│  Q1: What type of campaign?                 │
│  → Product launch for SaaS platform         │
│                                             │
│  Q2: Platforms? (Current)                   │
│                                             │
└─────────────────────────────────────────────┘

AFTER FINAL QUESTION (5/5):

┌─────────────────────────────────────────────┐
│  AI Quick Start                        [×]  │
├─────────────────────────────────────────────┤
│                                             │
│  ✓ All questions complete!                  │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  🤖 AI: Perfect! Based on your      │   │
│  │  answers, I've set up your tracker: │   │
│  │                                     │   │
│  │  Here's what I prepared:            │   │
│  │                                     │   │
│  │  • Name: NeoLaunch Campaign         │   │
│  │  • Platforms: Facebook, Instagram,  │   │
│  │    Blog                             │   │
│  │  • Goal: Product Launch             │   │
│  │  • Revenue Target: $10,000          │   │
│  │  • Setup Cost: $200                 │   │
│  │  • Currency: USD                    │   │
│  │                                     │   │
│  │  Ready to customize and create?     │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  [Start Manual Instead]   [Apply Setup →]   │
│                                   ↓         │
│                           Goes to Screen 2  │
│                           (pre-filled)      │
│                                             │
└─────────────────────────────────────────────┘
```

---

## 19. QUICK ACTIONS MENU

**Title:** Quick Actions  
**Subtitle:** None

**Description:** Three-dot menu for tracker-level actions.

**Functions:**
- Edit tracker settings
- Archive tracker
- View reports
- Export data
- Delete tracker

**Navigation:**
- Tap outside → Dismisses menu
- Tap action → Executes respective action

```
┌─────────────────────────────────────────────┐
│  ←  NeoLaunch                          ⋮    │
│      (Menu open)                            │
├─────────────────────────────────────────────┤
│                                             │
│                              ┌────────────┐ │
│                              │ Edit Tracker│ │
│                              │            │ │
│                              │ Archive    │ │
│                              │            │ │
│                              │ Reports    │ │
│                              │            │ │
│                              │ Export Data│ │
│                              │            │ │
│                              │ ─────────  │ │
│                              │            │ │
│                              │ Delete     │ │
│                              │ (Red)      │ │
│                              └────────────┘ │
│                              Tap action     │
│                                             │
│  Tap [Edit Tracker] → Screen 14             │
│  Tap [Archive] → Moves to Archive (Screen 6)│
│  Tap [Reports] → Reports Tab (Screen 5)     │
│  Tap [Export Data] → Generates CSV/PDF      │
│  Tap [Delete] → Confirmation (Screen 15)    │
│                                             │
└─────────────────────────────────────────────┘
```

---

## 20. HISTORICAL DATA EDIT

**Title:** Edit Historical Data  
**Subtitle:** Fix past mistakes

**Description:** Bulk editing interface to modify multiple past entries at once.

**Functions:**
- View all entries in editable table
- Select entries to modify
- Bulk edit amounts
- Fix mistakes across dates
- Save all changes

**Navigation:**
- Tap [←] → Back to Entries Tab (Screen 4)
- Tap entry row → Inline edit
- Tap [Save All Changes] → Updates all entries

```
┌─────────────────────────────────────────────┐
│  ←  Edit Historical Data       [Save All]   │
│      NeoLaunch                              │
├─────────────────────────────────────────────┤
│                                             │
│  Fix past mistakes or update old entries    │
│                                             │
│  Select entries to modify:                  │
│  [☑ Select All]  [☐ Deselect All]           │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  EDITABLE ENTRIES                           │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ [☑] Oct 26                          │   │
│  │                                     │   │
│  │     Revenue: $ 450.00 (editable)    │   │
│  │     Spend:   $ 270.00 (editable)    │   │
│  │     DMs:     8        (editable)    │   │
│  │     Profit:  +$180.00 (calculated)  │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│  Tap values to edit                         │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ [☑] Oct 25                          │   │
│  │                                     │   │
│  │     Revenue: $ 350.00               │   │
│  │     Spend:   $ 230.00               │   │
│  │     DMs:     5                      │   │
│  │     Profit:  +$120.00               │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ [☐] Oct 24                          │   │
│  │     (Not selected)                  │   │
│  │                                     │   │
│  │     Revenue: $ 150.00               │   │
│  │     Spend:   $ 200.00               │   │
│  │     DMs:     3                      │   │
│  │     Profit:  -$50.00                │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  (25 more entries...)                       │
│  [Show All ▼]                               │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  SUMMARY OF CHANGES                         │
│  2 entries selected for editing             │
│                                             │
│  ⚠️ Changes affect profit calculations      │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  [Cancel]              [Save All Changes]   │
│                                             │
└─────────────────────────────────────────────┘
```

---

### SCREEN 21: PERFORMANCE DASHBOARD EMPTY STATE

**Title:** Performance  
**Subtitle:** Campaign tracker dashboard

**Description:** Shown when user has no trackers yet. Encourages creating first tracker with clear explanation.

**Functions:**
- Explain Performance Tracker module purpose
- Show benefits of tracking campaigns
- Encourage first tracker creation
- Visual icon to set context

**Navigation:**
- Tap [+ Create First Tracker] → Screen 2 (Create Tracker)
- Bottom nav still accessible

```
┌─────────────────────────────────────────────┐
│  👤 Performance                         🔔   │
├─────────────────────────────────────────────┤
│                                             │
│                                             │
│                                             │
│         ┌───────────────────────────────┐   │
│         │                               │   │
│         │          📊                   │   │
│         │                               │   │
│         │   No Trackers Yet             │   │
│         │                               │   │
│         │   Performance trackers help   │   │
│         │   you measure campaign ROI,   │   │
│         │   track daily revenue, and    │   │
│         │   monitor ad spend across     │   │
│         │   platforms.                  │   │
│         │                               │   │
│         │   Perfect for:                │   │
│         │   • Content campaigns         │   │
│         │   • Product launches          │   │
│         │   • Marketing experiments     │   │
│         │   • Growth initiatives        │   │
│         │                               │   │
│         │   ┌─────────────────────────┐ │   │
│         │   │ + Create First Tracker  │ │   │
│         │   └─────────────────────────┘ │   │
│         │                               │   │
│         └───────────────────────────────┘   │
│                                             │
│                                             │
│                                             │
│ ┌──────────────────────────────────────────┐│
│ │ [📊] Dashboard  [📈] Trackers  [⚙️] Settings││
│ └──────────────────────────────────────────┘│
└─────────────────────────────────────────────┘
```

---

### SCREEN 22: DAILY ENTRIES TAB EMPTY STATE

**Title:** Daily Entries  
**Subtitle:** (within Tracker Hub)

**Description:** Shown when tracker has no entries yet. Encourages logging first entry.

**Functions:**
- Explain what daily entries are
- Show what gets tracked
- CTA to log first entry
- Show entry logging is the core action

**Navigation:**
- Tap [+ Log First Entry] → Screen 7 (Log Daily Entry)
- Tap other tabs → Navigate to other hub sections

```
┌─────────────────────────────────────────────┐
│  ←  NeoLaunch                          [⋮]  │
├─────────────────────────────────────────────┤
│                                             │
│  ┌──────────────────────────────────────┐   │
│  │Overview│[Daily Entries]│Reports│More│   │
│  └──────────────────────────────────────┘   │
│                                             │
│                                             │
│                                             │
│         ┌───────────────────────────────┐   │
│         │                               │   │
│         │          📝                   │   │
│         │                               │   │
│         │   No Entries Yet              │   │
│         │                               │   │
│         │   Daily entries track your    │   │
│         │   campaign performance day    │   │
│         │   by day.                     │   │
│         │                               │   │
│         │   Each entry logs:            │   │
│         │   • Total revenue for the day │   │
│         │   • Ad spend per platform     │   │
│         │   • DMs/Leads received        │   │
│         │   • Daily profit (calculated) │   │
│         │                               │   │
│         │   Start tracking to see       │   │
│         │   trends, ROI, and burn rate. │   │
│         │                               │   │
│         │   ┌─────────────────────────┐ │   │
│         │   │ + Log First Entry       │ │   │
│         │   └─────────────────────────┘ │   │
│         │                               │   │
│         └───────────────────────────────┘   │
│                                             │
│                                             │
│ ┌──────────────────────────────────────────┐│
│ │ [📊] Dashboard  [📈] Trackers  [⚙️] Settings││
│ └──────────────────────────────────────────┘│
└─────────────────────────────────────────────┘
```

---

### SCREEN 23: POSTS LIST EMPTY STATE

**Title:** Posts  
**Subtitle:** (within Overview Tab)

**Description:** Shown when tracker has no posts. Emphasizes posts are optional reference.

**Functions:**
- Explain posts are optional
- Show what posts track (reference links)
- Note: Posts don't affect calculations
- CTA to add first post (optional)

**Navigation:**
- Tap [+ Add First Post] → Screen 12 (Add Post Modal)
- Or skip - posts are completely optional

```
┌─────────────────────────────────────────────┐
│  ←  NeoLaunch                          [⋮]  │
├─────────────────────────────────────────────┤
│                                             │
│  ┌──────────────────────────────────────┐   │
│  │[Overview]│Daily Entries│Reports│More│   │
│  └──────────────────────────────────────┘   │
│                                             │
│  (Scrolled down to Posts section)           │
│                                             │
│  POSTS (Optional)                    [+ Add]│
│                                             │
│         ┌───────────────────────────────┐   │
│         │                               │   │
│         │          🔗                   │   │
│         │                               │   │
│         │   No Posts Yet                │   │
│         │                               │   │
│         │   Posts are optional          │   │
│         │   reference links to track    │   │
│         │   what content you published. │   │
│         │                               │   │
│         │   Example uses:               │   │
│         │   • Link to YouTube video     │   │
│         │   • Instagram post URL        │   │
│         │   • Blog article link         │   │
│         │   • TikTok video              │   │
│         │                               │   │
│         │   Note: Posts don't affect    │   │
│         │   revenue or profit           │   │
│         │   calculations. They're just  │   │
│         │   for your reference.         │   │
│         │                               │   │
│         │   ┌─────────────────────────┐ │   │
│         │   │ + Add First Post        │ │   │
│         │   └─────────────────────────┘ │   │
│         │                               │   │
│         │   or skip - posts are optional│   │
│         │                               │   │
│         └───────────────────────────────┘   │
│                                             │
└─────────────────────────────────────────────┘
```

---

### SCREEN 24: ARCHIVE VIEW EMPTY STATE

**Title:** Archive  
**Subtitle:** Archived trackers

**Description:** Shown when no trackers have been archived yet.

**Functions:**
- Explain archive purpose
- Show what happens to archived trackers
- Passive state (no CTA needed)

**Navigation:**
- No action needed - archives appear when user archives trackers
- Tap [←] → Back to Dashboard (Screen 1)

```
┌─────────────────────────────────────────────┐
│  ←  Archive                                 │
│      Archived trackers                      │
├─────────────────────────────────────────────┤
│                                             │
│                                             │
│                                             │
│         ┌───────────────────────────────┐   │
│         │                               │   │
│         │          📦                   │   │
│         │                               │   │
│         │   No Archived Trackers        │   │
│         │                               │   │
│         │   Archived trackers are       │   │
│         │   campaigns you've completed  │   │
│         │   or paused.                  │   │
│         │                               │   │
│         │   Archiving a tracker:        │   │
│         │   • Removes it from active    │   │
│         │     dashboard                 │   │
│         │   • Preserves all data        │   │
│         │   • Can be restored anytime   │   │
│         │   • Keeps historical records  │   │
│         │                               │   │
│         │   To archive a tracker:       │   │
│         │   Open tracker → ⋮ Menu →    │   │
│         │   Archive                     │   │
│         │                               │   │
│         └───────────────────────────────┘   │
│                                             │
│                                             │
│                                             │
│ ┌──────────────────────────────────────────┐│
│ │ [📊] Dashboard  [📈] Trackers  [⚙️] Settings││
│ └──────────────────────────────────────────┘│
└─────────────────────────────────────────────┘
```

---

### SCREEN 25: ENTRY HISTORY EMPTY STATE

**Title:** Entry History  
**Subtitle:** All entries

**Description:** Shown when viewing full entry history but no entries exist yet.

**Functions:**
- Explain entry history purpose
- Encourage logging entries
- CTA to add first entry

**Navigation:**
- Tap [+ Log First Entry] → Screen 7 (Log Daily Entry)
- Tap [←] → Back to Entries Tab (Screen 4)

```
┌─────────────────────────────────────────────┐
│  ←  Entry History                           │
│      NeoLaunch                              │
├─────────────────────────────────────────────┤
│                                             │
│                                             │
│                                             │
│         ┌───────────────────────────────┐   │
│         │                               │   │
│         │          📊                   │   │
│         │                               │   │
│         │   No Entries Yet              │   │
│         │                               │   │
│         │   Entry history shows all     │   │
│         │   your daily performance      │   │
│         │   logs in one place.          │   │
│         │                               │   │
│         │   As you log entries, you'll  │   │
│         │   see:                        │   │
│         │   • Complete timeline         │   │
│         │   • Profit trends             │   │
│         │   • Revenue patterns          │   │
│         │   • Spend analysis            │   │
│         │   • Engagement metrics        │   │
│         │                               │   │
│         │   Start logging to build your │   │
│         │   performance history!        │   │
│         │                               │   │
│         │   ┌─────────────────────────┐ │   │
│         │   │ + Log First Entry       │ │   │
│         │   └─────────────────────────┘ │   │
│         │                               │   │
│         └───────────────────────────────┘   │
│                                             │
│                                             │
│ ┌──────────────────────────────────────────┐│
│ │ [📊] Dashboard  [📈] Trackers  [⚙️] Settings││
│ └──────────────────────────────────────────┘│
└─────────────────────────────────────────────┘
```

---

### TIER 2 - ADDITIONAL DELETE CONFIRMATIONS

### SCREEN 26: DELETE ENTRY CONFIRMATION

**Title:** Delete Entry  
**Subtitle:** (Modal overlay)

**Description:** Confirms deleting a daily entry. Shows entry date and impact.

**Functions:**
- Show entry being deleted (date + amounts)
- Warn about profit recalculation
- Simple confirmation

**Navigation:**
- Tap [Delete] → Deletes entry, returns to Entries Tab
- Tap [Cancel] → Dismisses modal, no action

```
┌─────────────────────────────────────────────┐
│                                             │
│                                             │
│                                             │
│                                             │
│         ┌───────────────────────────────┐   │
│         │                               │   │
│         │          ⚠️                   │   │
│         │                               │   │
│         │   Delete Entry?               │   │
│         │                               │   │
│         │   October 26, 2024            │   │
│         │   Revenue: $450               │   │
│         │   Spend: $270                 │   │
│         │   Profit: +$180               │   │
│         │                               │   │
│         │   Deleting this entry will:   │   │
│         │   • Remove it from history    │   │
│         │   • Recalculate total profit  │   │
│         │   • Update all reports        │   │
│         │                               │   │
│         │   This action cannot be       │   │
│         │   undone.                     │   │
│         │                               │   │
│         │   ┌─────────────────────────┐ │   │
│         │   │  Delete Entry           │ │   │
│         │   │  (RED)                  │ │   │
│         │   └─────────────────────────┘ │   │
│         │                               │   │
│         │         [Cancel]              │   │
│         │                               │   │
│         └───────────────────────────────┘   │
│                                             │
│                                             │
└─────────────────────────────────────────────┘
```

---

### SCREEN 27: DELETE POST CONFIRMATION

**Title:** Delete Post  
**Subtitle:** (Modal overlay)

**Description:** Confirms post deletion. Shows post details.

**Functions:**
- Show post being deleted (title + platform)
- Simple confirmation
- Remind: Post deletion doesn't affect revenue data

**Navigation:**
- Tap [Delete] → Deletes post, returns to Posts List
- Tap [Cancel] → Dismisses modal, no action

```
┌─────────────────────────────────────────────┐
│                                             │
│                                             │
│                                             │
│                                             │
│         ┌───────────────────────────────┐   │
│         │                               │   │
│         │          ⚠️                   │   │
│         │                               │   │
│         │   Delete Post?                │   │
│         │                               │   │
│         │   "Launch Day Announcement"   │   │
│         │   Platform: YouTube           │   │
│         │   Posted: Oct 24, 2024        │   │
│         │                               │   │
│         │   This post reference will be │   │
│         │   permanently deleted.        │   │
│         │                               │   │
│         │   Note: This won't affect     │   │
│         │   your revenue or profit      │   │
│         │   calculations. Posts are     │   │
│         │   reference-only.             │   │
│         │                               │   │
│         │   This action cannot be       │   │
│         │   undone.                     │   │
│         │                               │   │
│         │   ┌─────────────────────────┐ │   │
│         │   │  Delete Post            │ │   │
│         │   │  (RED)                  │ │   │
│         │   └─────────────────────────┘ │   │
│         │                               │   │
│         │         [Cancel]              │   │
│         │                               │   │
│         └───────────────────────────────┘   │
│                                             │
└─────────────────────────────────────────────┘
```

---

### SCREEN 28: DELETE PLATFORM CONFIRMATION

**Title:** Delete Platform  
**Subtitle:** (Modal overlay)

**Description:** Critical warning - deleting platform removes all associated spend data from entries.

**Functions:**
- Show platform being deleted
- Warn about data loss (all spend entries for that platform)
- Show count of affected entries
- Require explicit confirmation

**Navigation:**
- Tap [Delete Platform] → Deletes platform + spend data, returns to Platform Management
- Tap [Cancel] → Dismisses modal, no action

```
┌─────────────────────────────────────────────┐
│                                             │
│                                             │
│                                             │
│         ┌───────────────────────────────┐   │
│         │                               │   │
│         │          ⚠️                   │   │
│         │                               │   │
│         │   Delete Platform?            │   │
│         │                               │   │
│         │   YouTube                     │   │
│         │                               │   │
│         │   This will permanently       │   │
│         │   delete this platform AND:   │   │
│         │                               │   │
│         │   ✗ All YouTube spend entries │   │
│         │     (23 entries affected)     │   │
│         │   ✗ Platform-specific data    │   │
│         │   ✗ Spend history             │   │
│         │                               │   │
│         │   Total revenue and DMs will  │   │
│         │   NOT be affected (they're    │   │
│         │   tracked globally).          │   │
│         │                               │   │
│         │   This action CANNOT be       │   │
│         │   undone.                     │   │
│         │                               │   │
│         │   ┌─────────────────────────┐ │   │
│         │   │  Delete Platform        │ │   │
│         │   │  (RED DESTRUCTIVE)      │ │   │
│         │   └─────────────────────────┘ │   │
│         │                               │   │
│         │         [Cancel]              │   │
│         │                               │   │
│         └───────────────────────────────┘   │
│                                             │
└─────────────────────────────────────────────┘
```

---

### TIER 3 - SUCCESS/ERROR STATES

### SCREEN 29: SUCCESS TOAST/CONFIRMATION

**Title:** (No title - overlay)  
**Subtitle:** Brief confirmation message

**Description:** Brief success message overlay that appears after successful actions. Auto-dismisses after 2-3 seconds.

**Functions:**
- Confirm action completed successfully
- Auto-dismiss after 2-3 seconds
- Can be dismissed early by tapping
- Green background, white text, checkmark icon

**Navigation:**
- Auto-dismiss: Disappears after 2-3s
- Tap to dismiss: User can tap to close early
- Overlays on current screen

```
┌─────────────────────────────────────────────┐
│  ←  NeoLaunch                          [⋮]  │
├─────────────────────────────────────────────┤
│                                             │
│   ┌─────────────────────────────────────┐   │
│   │ ✓  Entry logged successfully       │   │
│   └─────────────────────────────────────┘   │
│   Green background, white text              │
│   Slides down from top                      │
│                                             │
│  [Tracker Hub content below...]             │
│                                             │
│                                             │
└─────────────────────────────────────────────┘

VARIATIONS:
✓  Tracker created successfully
✓  Entry updated
✓  Entry deleted
✓  Post added
✓  Post deleted
✓  Platform added
✓  Platform deleted
✓  Settings saved
✓  Tracker archived
✓  Export completed
✓  Changes saved
```

---

### SCREEN 30: AI LOADING STATE

**Title:** Setting Up Your Tracker  
**Subtitle:** (Modal overlay)

**Description:** Shows while AI processes responses and generates tracker configuration.

**Functions:**
- Show AI is processing
- Progress indicator (spinner or animated dots)
- Timeout after 15 seconds with retry option
- Cannot dismiss during processing

**Navigation:**
- On success: Automatically opens Screen 2 (Create Tracker) with pre-filled data
- On timeout: Shows retry option or manual setup
- Cannot dismiss (no × button) until complete or timeout

```
┌─────────────────────────────────────────────┐
│                                             │
│                                             │
│                                             │
│         ┌───────────────────────────────┐   │
│         │                               │   │
│         │      ✨  ✨  ✨              │   │
│         │                               │   │
│         │   Setting Up Your Tracker...  │   │
│         │                               │   │
│         │   ●●●●●○○○○○                  │   │
│         │   Progress indicator          │   │
│         │                               │   │
│         │   Analyzing your inputs...    │   │
│         │   Generating platforms...     │   │
│         │   Setting targets...          │   │
│         │   Creating structure...       │   │
│         │                               │   │
│         │   This may take up to         │   │
│         │   15 seconds.                 │   │
│         │                               │   │
│         └───────────────────────────────┘   │
│                                             │
│                                             │
│                                             │
└─────────────────────────────────────────────┘

AFTER 15 SECONDS (TIMEOUT):
┌─────────────────────────────────────────────┐
│                                             │
│                                             │
│         ┌───────────────────────────────┐   │
│         │                               │   │
│         │          ⚠️                   │   │
│         │                               │   │
│         │   Taking Longer Than          │   │
│         │   Expected                    │   │
│         │                               │   │
│         │   AI is still processing      │   │
│         │   your tracker setup.         │   │
│         │                               │   │
│         │   ┌─────────────────────────┐ │   │
│         │   │  Keep Waiting           │ │   │
│         │   └─────────────────────────┘ │   │
│         │                               │   │
│         │   ┌─────────────────────────┐ │   │
│         │   │  Start Manual Instead   │ │   │
│         │   └─────────────────────────┘ │   │
│         │                               │   │
│         └───────────────────────────────┘   │
│                                             │
└─────────────────────────────────────────────┘
```

---

### SCREEN 31: GENERAL ERROR STATE

**Title:** (Error context-dependent)  
**Subtitle:** Error message overlay

**Description:** General error modal for network failures, save errors, sync issues, or unexpected problems.

**Functions:**
- Show what went wrong (in plain language)
- Provide troubleshooting tips
- Offer retry option
- Offer alternative action (e.g., save offline)

**Navigation:**
- Tap [Try Again] → Retries failed action
- Tap [Cancel] → Dismisses error, returns to previous state
- Tap context-specific action (e.g., [Save Offline])

```
┌─────────────────────────────────────────────┐
│                                             │
│                                             │
│                                             │
│         ┌───────────────────────────────┐   │
│         │                               │   │
│         │          ⚠️                   │   │
│         │                               │   │
│         │   Unable to Save Entry        │   │
│         │                               │   │
│         │   We couldn't save your       │   │
│         │   entry at this time.         │   │
│         │                               │   │
│         │   Possible reasons:           │   │
│         │   • Check your internet       │   │
│         │     connection                │   │
│         │   • Server may be busy        │   │
│         │   • Try again in a moment     │   │
│         │                               │   │
│         │   Your entry is saved         │   │
│         │   locally and will sync when  │   │
│         │   connection is restored.     │   │
│         │                               │   │
│         │   ┌─────────────────────────┐ │   │
│         │   │  Try Again              │ │   │
│         │   └─────────────────────────┘ │   │
│         │                               │   │
│         │         [Cancel]              │   │
│         │                               │   │
│         └───────────────────────────────┘   │
│                                             │
│                                             │
└─────────────────────────────────────────────┘

ERROR VARIATIONS:

NETWORK ERROR:
│   Unable to Connect              │
│   No internet connection detected│
│   [Try Again] [Work Offline]     │

SYNC ERROR:
│   Sync Failed                    │
│   Changes saved locally          │
│   Will retry automatically       │
│   [OK]                          │

VALIDATION ERROR:
│   Invalid Amount                 │
│   Revenue must be a positive     │
│   number                         │
│   [OK]                          │

EXPORT ERROR:
│   Export Failed                  │
│   Could not generate file        │
│   [Try Again] [Cancel]           │
```

---

### TIER 4 - ENHANCED FEATURES (NICE TO HAVE)

### SCREEN 32: EXPORT SUCCESS MODAL

**Title:** Export Complete  
**Subtitle:** Download ready

**Description:** Confirms data export was successful and provides download options.

**Functions:**
- Confirm export completed
- Show file format and size
- Provide download link
- Share options

**Navigation:**
- Tap [Download] → Downloads file to device
- Tap [Share] → Opens share sheet
- Tap [×] → Dismisses modal

```
┌─────────────────────────────────────────────┐
│                                             │
│                                             │
│                                             │
│         ┌───────────────────────────────┐   │
│         │                               │   │
│         │          ✓                    │   │
│         │                               │   │
│         │   Export Complete!            │   │
│         │                               │   │
│         │   Your data is ready to       │   │
│         │   download.                   │   │
│         │                               │   │
│         │   File: NeoLaunch_Oct2024.csv │   │
│         │   Size: 24.3 KB               │   │
│         │                               │   │
│         │   Contains:                   │   │
│         │   • 28 daily entries          │   │
│         │   • Revenue & spend data      │   │
│         │   • Profit calculations       │   │
│         │   • Platform breakdowns       │   │
│         │                               │   │
│         │   ┌─────────────────────────┐ │   │
│         │   │  📥 Download            │ │   │
│         │   └─────────────────────────┘ │   │
│         │                               │   │
│         │   ┌─────────────────────────┐ │   │
│         │   │  📤 Share               │ │   │
│         │   └─────────────────────────┘ │   │
│         │                               │   │
│         │         [Done]                │   │
│         │                               │   │
│         └───────────────────────────────┘   │
│                                             │
└─────────────────────────────────────────────┘
```

---

### SCREEN 33: BULK ACTIONS MODAL

**Title:** Bulk Actions  
**Subtitle:** Edit multiple entries

**Description:** Quick actions for multiple selected entries at once.

**Functions:**
- Select multiple entries
- Bulk delete
- Bulk adjust amounts
- Bulk export
- Quick batch operations

**Navigation:**
- Tap [×] → Dismisses modal
- Tap action → Executes on selected entries
- Returns to Entries Tab after action

```
┌─────────────────────────────────────────────┐
│                                             │
│                                             │
│                                             │
│         ┌───────────────────────────────┐   │
│         │                               │   │
│         │   Bulk Actions                │   │
│         │                          [×]  │   │
│         │                               │   │
│         │   3 entries selected          │   │
│         │                               │   │
│         │   ───────────────────────     │   │
│         │                               │   │
│         │   ACTIONS                     │   │
│         │                               │   │
│         │   ┌─────────────────────────┐ │   │
│         │   │ 📊 Export Selected      │ │   │
│         │   └─────────────────────────┘ │   │
│         │                               │   │
│         │   ┌─────────────────────────┐ │   │
│         │   │ ✏️ Edit Amounts         │ │   │
│         │   └─────────────────────────┘ │   │
│         │                               │   │
│         │   ┌─────────────────────────┐ │   │
│         │   │ 🗑️ Delete Selected      │ │   │
│         │   │    (RED)                │ │   │
│         │   └─────────────────────────┘ │   │
│         │                               │   │
│         │   ───────────────────────     │   │
│         │                               │   │
│         │         [Cancel]              │   │
│         │                               │   │
│         └───────────────────────────────┘   │
│                                             │
│                                             │
└─────────────────────────────────────────────┘
```

---


---

### SCREEN 34: SETTINGS PAGE ⭐ NEW

**Title:** Settings  
**Subtitle:** App preferences

**Description:** Minimal settings page for standalone Tracker app. Focuses only on essential configurations: user account and currency preferences.

**Functions:**
- Manage user account (profile, email, password)
- Set default currency
- Log out
- App version info

**Navigation:**
- Access from: Bottom Nav [⚙️ Settings]
- Tap [Account] → Account management screen (native)
- Tap Currency → Currency picker modal
- Tap [Log Out] → Confirmation → Login screen
- Tap [← Back] → Returns to Dashboard (Screen 1)

```
┌─────────────────────────────────────────────┐
│  ← Settings                                 │
│     Tap [←] to return to Dashboard          │
├─────────────────────────────────────────────┤
│                                             │
│                                             │
│  ACCOUNT                                    │
│  ─────────────────────────────────────────  │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 👤 User Profile                     │   │
│  │                                     │   │
│  │ Frank Johnson                  [›]  │   │
│  │ frank@email.com                     │   │
│  └─────────────────────────────────────┘   │
│  Tap → Account settings (name, email, pwd) │
│                                             │
│                                             │
│  PREFERENCES                                │
│  ─────────────────────────────────────────  │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 💱 Default Currency            [›]  │   │
│  │                                     │   │
│  │ USD ($)                             │   │
│  └─────────────────────────────────────┘   │
│  Tap → Currency picker modal                │
│                                             │
│  CURRENCY OPTIONS:                          │
│  - USD ($) - US Dollar                      │
│  - EUR (€) - Euro                           │
│  - GBP (£) - British Pound                  │
│  - NGN (₦) - Nigerian Naira                 │
│  - KES (KSh) - Kenyan Shilling              │
│  - ZAR (R) - South African Rand             │
│  - CAD (C$) - Canadian Dollar               │
│  - AUD (A$) - Australian Dollar             │
│  - INR (₹) - Indian Rupee                   │
│  - JPY (¥) - Japanese Yen                   │
│  - CNY (¥) - Chinese Yuan                   │
│  + 20 more currencies...                    │
│                                             │
│                                             │
│  ABOUT                                      │
│  ─────────────────────────────────────────  │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ App Version                         │   │
│  │ 1.0.0                               │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ Privacy Policy                 [›]  │   │
│  └─────────────────────────────────────┘   │
│  Opens in-app web view                      │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ Terms of Service               [›]  │   │
│  └─────────────────────────────────────┘   │
│  Opens in-app web view                      │
│                                             │
│                                             │
│  ACCOUNT ACTIONS                            │
│  ─────────────────────────────────────────  │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 🚪 Log Out                          │   │
│  │     (RED TEXT)                      │   │
│  └─────────────────────────────────────┘   │
│  Tap → Confirmation modal → Logs out        │
│                                             │
│                                             │
│                                             │
│                                             │
│                                             │
│ ┌──────────────────────────────────────────┐│
│ │ [📊] Dashboard  [📈] Trackers  [⚙️●] Settings││
│ │                                          ││
│ └──────────────────────────────────────────┘│
│                                             │
└─────────────────────────────────────────────┘
```

---

### SCREEN 35: TRACKERS LIST VIEW ⭐ NEW

**Title:** All Trackers  
**Subtitle:** Manage your trackers

**Description:** List view of all trackers for quick access and management. Alternative view to Dashboard cards.

**Functions:**
- View all trackers in list format
- Quick access to tracker hubs
- Search/filter trackers
- Archive/active toggle

**Navigation:**
- Access from: Bottom Nav [📈 Trackers]
- Tap tracker → Screen 3 (Tracker Hub)
- [+] FAB → Screen 2 (Create Tracker)
- Filter toggle → Shows Active/Archived

```
┌─────────────────────────────────────────────┐
│  All Trackers                          [🔍] │
│  Tap [🔍] to search                         │
├─────────────────────────────────────────────┤
│                                             │
│  FILTER                                     │
│  ┌──────────┬──────────┬──────────┐        │
│  │ Active ● │ Archived │ All      │        │
│  └──────────┴──────────┴──────────┘        │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  ACTIVE TRACKERS (3)                        │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 🚀 NeoLaunch                   [›]  │   │
│  │ Started: Oct 2024                   │   │
│  │ Profit: $4,230 (Oct)                │   │
│  │ Revenue: $6,800 | Spend: $2,570     │   │
│  └─────────────────────────────────────┘   │
│  Tap → Tracker Hub (Screen 3)               │
│  Swipe left → Archive, Delete               │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 🎯 FitCoach App                [›]  │   │
│  │ Started: Sep 2024                   │   │
│  │ Profit: $5,890 (Oct)                │   │
│  │ Revenue: $8,100 | Spend: $2,210     │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ 📱 Content Q1 2025             [›]  │   │
│  │ Started: Nov 2024                   │   │
│  │ Profit: $2,330 (Nov)                │   │
│  │ Revenue: $3,300 | Spend: $970       │   │
│  └─────────────────────────────────────┘   │
│                                             │
│                                             │
│                                             │
│                                             │
│                                             │
│                                             │
│  [+] Floating Action Button                 │
│  Tap → Create New Tracker (Screen 2)        │
│                                             │
│ ┌──────────────────────────────────────────┐│
│ │ [📊] Dashboard  [📈●] Trackers  [⚙️] Settings││
│ │                 Current                  ││
│ └──────────────────────────────────────────┘│
│                                             │
└─────────────────────────────────────────────┘
```

---


---

## SUMMARY

This specification defines a complete standalone Performance Tracker application with 35 comprehensive screens organized across three primary navigation tabs: Dashboard, Trackers, and Settings.

The application enables users to track campaign performance metrics including revenue, ad spend, and profitability across multiple platforms. Core functionality includes daily entry logging with platform-specific ad spend tracking, comprehensive reporting with profit/loss analysis and burn rate calculations, and optional post management for content reference.

The interface provides intuitive navigation through a three-tab bottom navigation system:
- **Dashboard** displays performance overview with metric summaries and active tracker cards
- **Trackers** offers a list view for managing all active and archived trackers
- **Settings** provides user account management and currency preferences

Key features include AI-assisted tracker setup, historical data editing, archive functionality, and detailed numerical reports without charts. The application supports multiple currencies, tracks setup and growth costs separately, and calculates net profit with comprehensive breakdowns.

All screens include complete UI layouts with defined functions, navigation paths, validation rules, and real-world examples, providing a production-ready specification for design and development.

# Settings Module - Minimal Wireframe Design

**Total Pages: 2** (Main Settings + Logout Confirmation)

---

## DESIGN PHILOSOPHY: Single-Page Settings

**Approach:**
- ✅ All settings on **one scrollable page**
- ✅ Inline dropdowns (no navigation)
- ✅ Bottom sheets for pickers (not separate pages)
- ✅ Modals for confirmations (overlays, not pages)

**Why This Works:**
- Less navigation friction
- Faster access to all settings
- Modern mobile UX pattern
- Easy to scan all options

---

## 1. MAIN SETTINGS PAGE

**Title:** Settings  
**Subtitle:** Complete app configuration

**Description:** Single scrollable page containing all app settings organized into sections. Uses inline controls and bottom sheets for selections.

**Functions:**
- Display user profile
- Configure app preferences
- Manage notifications
- View sync status
- Access app information
- Log out of account

**Navigation:**
- Tap [←] → Back to previous screen
- Tap [Edit Profile] → Edit profile modal (future)
- Tap [Logout] → Logout confirmation modal (Screen 2)
- Tap time picker → Bottom sheet time selector
- All other controls inline (no navigation)

```
┌─────────────────────────────────────────────┐
│  ←  Settings                                │
├─────────────────────────────────────────────┤
│                                             │
│  SCROLLABLE CONTENT AREA                    │
│                                             │
│  ───────────────────────────────────────    │
│  ACCOUNT                                    │
│  ───────────────────────────────────────    │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │     ┌────┐                          │   │
│  │     │ FN │  Frank Builder           │   │
│  │     └────┘  frank@example.com       │   │
│  │             Circular avatar           │   │
│  │                                     │   │
│  │     [Edit Profile]                   │   │
│  └─────────────────────────────────────┘   │
│  Profile card with avatar, name, email      │
│  Tap [Edit Profile] → Profile edit modal    │
│  (future feature)                           │
│                                             │
│  ───────────────────────────────────────    │
│  PREFERENCES                                │
│  ───────────────────────────────────────    │
│                                             │
│  Language                                   │
│  ┌─────────────────────────────────────┐   │
│  │ 🌍 English                     [▼] │   │
│  └─────────────────────────────────────┘   │
│  Tap → Dropdown expands inline:             │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ ○ English                           │   │
│  │ ○ French                            │   │
│  │ ○ Spanish                           │   │
│  └─────────────────────────────────────┘   │
│  Select → Collapses, updates language       │
│                                             │
│  Currency                                   │
│  ┌─────────────────────────────────────┐   │
│  │ 💰 XOF (West African CFA)      [▼] │   │
│  └─────────────────────────────────────┘   │
│  Tap → Dropdown expands inline:             │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ ○ USD ($)                           │   │
│  │ ○ EUR (€)                           │   │
│  │ ○ XOF (CFA)                         │   │
│  │ ○ GBP (£)                           │   │
│  │ ○ NGN (₦)                           │   │
│  └─────────────────────────────────────┘   │
│  Select → Collapses, saves preference       │
│                                             │
│  Theme                                      │
│  ┌─────────────────────────────────────┐   │
│  │ 🌓 System Default              [▼] │   │
│  └─────────────────────────────────────┘   │
│  Tap → Dropdown expands inline:             │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │ ○ Light Mode                       │   │
│  │ ○ Dark Mode                        │   │
│  │ ○ System Default                   │   │
│  └─────────────────────────────────────┘   │
│  Select → Theme changes immediately          │
│                                             │
│  ───────────────────────────────────────    │
│  NOTIFICATIONS                              │
│  ───────────────────────────────────────    │
│                                             │
│  Push Notifications                         │
│  ┌─────────────────────────────────────┐   │
│  │ 🔔 Enable notifications        [●] │   │
│  └─────────────────────────────────────┘   │
│  Toggle switch (iOS/Android style)          │
│  Green when ON, gray when OFF               │
│                                             │
│  Daily Reminder                             │
│  ┌─────────────────────────────────────┐   │
│  │ ⏰ Remind me to log entries         │   │
│  │                                     │   │
│  │    9:00 PM                     [○] │   │
│  └─────────────────────────────────────┘   │
│  Toggle OFF (gray) - no time shown          │
│                                             │
│  When toggled ON:                           │
│  ┌─────────────────────────────────────┐   │
│  │ ⏰ Remind me to log entries         │   │
│  │                                     │   │
│  │    9:00 PM                [Change] │   │
│  │                               [●]  │   │
│  └─────────────────────────────────────┘   │
│  Shows time picker when tapped              │
│  Tap [Change] → Bottom sheet time picker    │
│                                             │
│  Weekly Summary                             │
│  ┌─────────────────────────────────────┐   │
│  │ 📊 Get weekly performance digest    │   │
│  │                                     │   │
│  │    Every Sunday at 8:00 AM     [●] │   │
│  └─────────────────────────────────────┘   │
│  Toggle switch ON (green)                   │
│  Fixed time (Sundays at 8 AM)               │
│                                             │
│  ───────────────────────────────────────    │
│  DATA & STORAGE                             │
│  ───────────────────────────────────────    │
│                                             │
│  Sync Status                                │
│  ┌─────────────────────────────────────┐   │
│  │ ☁️ All data synced                  │   │
│  │                                     │   │
│  │ Last synced: Just now          [↻]  │   │
│  └─────────────────────────────────────┘   │
│  Green checkmark when synced                │
│  Tap [↻] → Manual sync                      │
│                                             │
│  When pending sync:                         │
│  ┌─────────────────────────────────────┐   │
│  │ ☁️ Syncing... (3 items pending)     │   │
│  │                                     │   │
│  │ ───────────────── 60%               │   │
│  │                                     │   │
│  │ Last synced: 5 minutes ago     [↻]  │   │
│  └─────────────────────────────────────┘   │
│  Progress bar when syncing                  │
│                                             │
│  When offline:                              │
│  ┌─────────────────────────────────────┐   │
│  │ ⚠️ Offline - 12 items pending sync  │   │
│  │                                     │   │
│  │ Will sync when connection restored   │   │
│  │                                     │   │
│  │ Last synced: 2 hours ago       [↻]  │   │
│  └─────────────────────────────────────┘   │
│  Yellow warning when offline                │
│                                             │
│  ───────────────────────────────────────    │
│  ABOUT                                      │
│  ───────────────────────────────────────    │
│                                             │
│  App Version                                │
│  ┌─────────────────────────────────────┐   │
│  │ ℹ️ Version 1.0.0                    │   │
│  │                                     │   │
│  │ Build 2024.12.27                    │   │
│  └─────────────────────────────────────┘   │
│  Non-interactive, informational only        │
│                                             │
│  Privacy Policy                             │
│  ┌─────────────────────────────────────┐   │
│  │ 🔒 View Privacy Policy          [→] │   │
│  └─────────────────────────────────────┘   │
│  Tap → Opens web view or external link      │
│                                             │
│  Terms of Service                           │
│  ┌─────────────────────────────────────┐   │
│  │ 📄 View Terms of Service        [→] │   │
│  └─────────────────────────────────────┘   │
│  Tap → Opens web view or external link      │
│                                             │
│  ───────────────────────────────────────    │
│                                             │
│  ┌──────────────────────────┐              │
│  │      🚪 Logout           │              │
│  └──────────────────────────┘              │
│  Red text, outline button                   │
│  Tap → Logout confirmation (Screen 2)       │
│                                             │
│  (Bottom padding for scroll)                │
│                                             │
└─────────────────────────────────────────────┘

COMPONENT SPECIFICATIONS:


STATES:

Dropdown Expanded:
- Selected row has blue left border (4dp)
- Other rows below push down
- Tap outside → Collapses
- Tap option → Selects, collapses, animates

Toggle Switch:
- OFF → Gray track, white thumb (left)
- ON → Green track, white thumb (right)
- Tap anywhere → Toggles state
- Smooth slide animation (200ms)

Sync Status:
- Synced: Green checkmark, "All data synced"
- Syncing: Blue spinner, progress bar, "Syncing..."
- Offline: Yellow warning, "X items pending"
- Error: Red X, "Sync failed - Retry"

VALIDATION:

Language:
- Must select one option
- Default: English
- Changes app language immediately
- Requires app restart (show toast)

Currency:
- Must select one option
- Default: XOF
- Applies to NEW trackers only
- Existing trackers unchanged

Theme:
- Default: System Default
- Changes apply immediately (no restart)
- Persisted to local storage

Notifications:
- Master toggle affects all notifications
- If OFF, daily reminder and weekly summary disabled
- Permission check: If denied, show alert

Daily Reminder:
- Toggle enables/disables
- Time picker only when enabled
- Default: 9:00 PM
- Platform notification scheduled

Weekly Summary:
- Toggle enables/disables
- Fixed time: Sundays 8:00 AM
- Email or push notification

Sync:
- Auto-sync when online
- Manual sync available
- Shows pending count
- Retry on failure
```

---

## 2. LOGOUT CONFIRMATION MODAL

**Title:** Logout  
**Subtitle:** Confirmation overlay

**Description:** Modal dialog overlaying settings page to confirm logout action. Prevents accidental logouts.

**Functions:**
- Confirm user intent to logout
- Explain logout consequences
- Cancel or proceed with logout

**Navigation:**
- Tap [Cancel] → Dismiss modal, stay logged in
- Tap [Logout] → Sign out, navigate to login screen
- Tap outside modal (dimmed area) → Dismiss

```
┌─────────────────────────────────────────────┐
│                                             │
│  DIMMED BACKGROUND (Settings page behind)   │
│                                             │
│     ┌─────────────────────────────────┐    │
│     │                                 │    │
│     │  ┌────┐                         │    │
│     │  │ 🚪 │  Logout                 │    │
│     │  └────┘                         │    │
│     │                                 │    │
│     │  Are you sure you want to       │    │
│     │  logout?                        │    │
│     │                                 │    │
│     │  You'll need to sign in again   │    │
│     │  to access your data.           │    │
│     │                                 │    │
│     │  💡 Your data is saved and      │    │
│     │     will sync when you return.  │    │
│     │                                 │    │
│     │  ─────────────────────────      │    │
│     │                                 │    │
│     │  [Cancel]        [Logout]       │    │
│     │  Gray text       Red, bold      │    │
│     │                                 │    │
│     └─────────────────────────────────┘    │
│     Centered modal, rounded corners         │
│     Width: 90% of screen (max 400dp)        │
│                                             │
└─────────────────────────────────────────────┘

MODAL SPECIFICATIONS:

STATES:

Default:
- Both buttons enabled
- No loading state

Loading (during logout):
- Logout button shows spinner
- Cancel button disabled
- Text: "Logging out..."
- Prevents duplicate taps

Error (if logout fails):
- Modal stays open
- Show error message below buttons:
  "⚠️ Logout failed. Please try again."
- Buttons re-enabled
```

---

## TIME PICKER BOTTOM SHEET (Overlay, Not Separate Page)

**Title:** Select Time  
**Subtitle:** Bottom sheet overlay

**Description:** Native time picker shown as bottom sheet when daily reminder time needs to be changed. Not counted as separate page.

**Functions:**
- Select reminder time
- Preview selected time
- Confirm or cancel selection

**Navigation:**
- Tap [Cancel] → Dismiss, no changes
- Tap [Done] → Save time, dismiss
- Swipe down → Dismiss (mobile gesture)

```
┌─────────────────────────────────────────────┐
│                                             │
│  SETTINGS PAGE (dimmed background)          │
│                                             │
│  ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬  │
│  ┌─────────────────────────────────────┐   │
│  │  ───  Swipe down to dismiss         │   │
│  │                                     │   │
│  │  Select Reminder Time               │   │
│  │                                     │   │
│  │  ─────────────────────────────────  │   │
│  │                                     │   │
│  │      ┌─────────────────────┐        │   │
│  │      │   9   :   00   PM   │        │   │
│  │      │   ↓       ↓     ↓   │        │   │
│  │      │                     │        │   │
│  │      │  iOS/Android        │        │   │
│  │      │  Native Picker      │        │   │
│  │      │                     │        │   │
│  │      └─────────────────────┘        │   │
│  │      Platform time picker            │   │
│  │                                     │   │
│  │  ─────────────────────────────────  │   │
│  │                                     │   │
│  │  [Cancel]              [Done]       │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│  Bottom sheet slides up from bottom         │
│                                             │
└─────────────────────────────────────────────┘

BOTTOM SHEET SPECIFICATIONS:


---

## ✅ COMPLETE! Settings Module Delivered

### **Total Screens: 2**
1. ✅ Main Settings Page (all settings on one page)
2. ✅ Logout Confirmation Modal (overlay)

### **Additional Overlays (Not Separate Pages):**
- Time Picker Bottom Sheet (platform native)
- Dropdown expansions (inline)

---

## SETTINGS MODULE SUMMARY

**Design Philosophy:**
- ✅ **Single-page settings** (no navigation between sections)
- ✅ **Inline controls** (dropdowns expand in place)
- ✅ **Bottom sheets** for pickers (not pages)
- ✅ **Modals** for confirmations (overlays)

**Sections Included:**
1. ✅ Account (Profile display, Edit button, Logout)
2. ✅ Preferences (Language dropdown, Currency dropdown, Theme dropdown)
3. ✅ Notifications (Push toggle, Daily reminder with time, Weekly summary toggle)
4. ✅ Data & Storage (Sync status with progress, Manual sync button)
5. ✅ About (App version, Privacy Policy, Terms of Service)

**Key Features:**
- All settings accessible without scrolling excessively
- Clear visual hierarchy (section headers)
- Inline feedback (sync status, theme changes)
- Safe actions (logout confirmation)
- Platform-native pickers (time selection)
- Responsive toggles (immediate visual feedback)
- Offline support (sync status shows pending items)

## USER FLOWS

### **Change Language Flow:**
```
1. User on Settings page
   ↓
2. Scroll to Preferences section
   ↓
3. Tap Language row
   ↓
4. Dropdown expands inline (3 options)
   ↓
5. Tap "French"
   ↓
6. Dropdown collapses, shows "French"
   ↓
7. App language changes immediately*
   ↓
8. Show toast: "Language changed to French. 
   Some changes require app restart."
   
*Note: Full language change may require restart
```

### **Set Daily Reminder Flow:**
```
1. User on Settings page
   ↓
2. Scroll to Notifications section
   ↓
3. Daily Reminder toggle is OFF
   ↓
4. Tap toggle → Turns ON
   ↓
5. Default time shown: "9:00 PM"
   ↓
6. Tap [Change] button
   ↓
7. Time picker bottom sheet slides up
   ↓
8. User picks time: "7:30 PM"
   ↓
9. Tap [Done]
   ↓
10. Bottom sheet slides down
    ↓
11. Daily Reminder row updates: "7:30 PM"
    ↓
12. Show toast: "Daily


-------


# PERFORMANCE TRACKER APP - STRATEGIC FEATURE ADDITIONS

**New Screens: 12 (6 main + 6 supporting)**
**Enhanced Screens: 2 (Dashboard modifications)**

---

## NEW SCREEN INVENTORY

### **K. INSIGHTS & INTELLIGENCE (4 screens)**
36. Insights Dashboard
37. Insights Detail View
38. Insights Dashboard Empty State
39. Platform ROI Detail

### **L. GOAL TRACKING (2 screens)**
40. Goal Progress Tab (within Tracker Hub)
41. Goal Progress Empty State

### **M. NOTIFICATIONS (2 screens)**
42. Notifications Center
43. Notifications Empty State

### **N. MULTI-TRACKER ANALYSIS (2 screens)**
44. Tracker Comparison View (enhanced Screen 35)
45. Tracker Comparison Empty State

### **O. ENHANCED DASHBOARD (2 screens)**
- Screen 1 Modified: Enhanced Dashboard Cards
- Screen 1a: Dashboard Performance Detail Modal

---

## SCREEN 36: INSIGHTS DASHBOARD

**Title:** Insights  
**Subtitle:** AI-powered performance analysis

**Description:** Analyzes user's tracking data to provide actionable recommendations, identify trends, spot opportunities, and warn about issues. Updates daily based on new entries. Transforms raw data into decision-making intelligence.

**Functions:**
- Display top priority insight (changes daily)
- Show performance trends (profit, spend patterns)
- Identify opportunities (best days, platforms)
- Alert to warnings (budget overruns, missed entries)
- Provide specific, actionable recommendations
- Calculate ROI and efficiency metrics
- Compare current vs. historical performance

**Navigation:**
- Accessed from: Dashboard → Tap (ⓘ) icon next to "Performance Overview"
- Tap insight card → Screen 37 (Insights Detail View)
- Tap "Platform Analysis" → Screen 39 (Platform ROI Detail)
- Tap [← Back] → Returns to Dashboard

**Data Sources:**
- All daily entries (revenue, spend, DMs)
- Platform-level performance
- Goal targets (revenue, engagement)
- Historical trends (week-over-week, month-over-month)

**Insight Types:**
1. **Top Priority** - Most important action needed
2. **Trends** - What's changing (up/down)
3. **Opportunities** - Where to invest more
4. **Warnings** - Problems requiring attention
5. **Recommendations** - Specific next actions

```
┌─────────────────────────────────────────────┐
│  ← Insights                                  │
├─────────────────────────────────────────────┤
│                                             │
│  Last updated: 2 hours ago                  │
│  Based on 28 entries this month             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  🎯 TOP INSIGHT                             │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │                                     │   │
│  │  ⚡ Your YouTube ROI is 3.2x        │   │
│  │                                     │   │
│  │  "YouTube ads are your best         │   │
│  │  performer, generating $3.20        │   │
│  │  for every $1 spent."               │   │
│  │                                     │   │
│  │  Recommendation:                    │   │
│  │  Shift 20% of Facebook budget       │   │
│  │  ($200) to YouTube. Potential       │   │
│  │  gain: +$440/month.                 │   │
│  │                                     │   │
│  │  [See Details →]                    │   │
│  │  Tap → Screen 37                    │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│  Card: Light background, priority badge     │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  📈 PERFORMANCE TRENDS                      │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  Profit Up 15% This Week            │   │
│  │                                     │   │
│  │  +$1,240 vs last week               │   │
│  │                                     │   │
│  │  "Your best week yet. Monday        │   │
│  │  ($450) and Tuesday ($380)          │   │
│  │  drove most growth."                │   │
│  │                                     │   │
│  │  [View Breakdown]                   │   │
│  └─────────────────────────────────────┘   │
│  Green accent, positive indicator           │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  ⚠️ Facebook Spend Increasing       │   │
│  │                                     │   │
│  │  $200 more this week                │   │
│  │  Revenue only up $80                │   │
│  │                                     │   │
│  │  "Your Facebook ROI dropped to      │   │
│  │  0.9x. Review ad targeting or       │   │
│  │  reduce budget."                    │   │
│  │                                     │   │
│  │  [Review Platform →]                │   │
│  │  Tap → Screen 39 (Platform Detail)  │   │
│  └─────────────────────────────────────┘   │
│  Yellow/orange accent, warning indicator    │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  💡 OPPORTUNITIES                           │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  Best Posting Days: Mon, Wed        │   │
│  │                                     │   │
│  │  "You profit 40% more on these      │   │
│  │  days ($320 avg vs $230 avg)."      │   │
│  │                                     │   │
│  │  Action: Schedule launches and      │   │
│  │  high-value content on these days.  │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  YouTube Cost/DM Lowest             │   │
│  │                                     │   │
│  │  YouTube: $10/DM                    │   │
│  │  LinkedIn: $18/DM                   │   │
│  │  Facebook: $25/DM                   │   │
│  │                                     │   │
│  │  "YouTube is 2.5x more efficient    │   │
│  │  for lead generation."              │   │
│  │                                     │   │
│  │  [See Full Comparison →]            │   │
│  │  Tap → Screen 39                    │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  🔴 WARNINGS                                │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  No Entries for 3 Days              │   │
│  │                                     │   │
│  │  Last logged: Oct 23                │   │
│  │                                     │   │
│  │  "Log today to maintain accurate    │   │
│  │  tracking and see updated insights."│   │
│  │                                     │   │
│  │  [Log Entry Now]                    │   │
│  │  Tap → Screen 7                     │   │
│  └─────────────────────────────────────┘   │
│  Red accent, urgent indicator               │
│                                             │
│  (Only shows if 3+ days without entry)      │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  📊 QUICK STATS                             │
│                                             │
│  Current Month Performance:                 │
│  • Average Daily Profit: $290               │
│  • Best Day: Monday ($450)                  │
│  • Worst Day: Friday ($120)                 │
│  • Most Profitable Platform: YouTube        │
│  • Highest Spend Platform: Facebook         │
│                                             │
│  [View Full Analytics →]                    │
│  Tap → Screen 5 (Reports)                   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  (Bottom padding for scroll)                │
│                                             │
└─────────────────────────────────────────────┘

COMPONENT SPECIFICATIONS:

Insight Cards:
- Background: White with colored left border (4dp)
  • Green: Positive/opportunity
  • Yellow/Orange: Warning/attention
  • Red: Urgent/problem
  • Blue: Information/neutral
- Padding: 16dp all sides
- Border radius: 8dp
- Spacing between cards: 12dp
- Shadow: Subtle elevation (2dp)

Card Hierarchy:
1. Top Insight: Largest, priority badge, most prominent
2. Trends: Medium size, 2-3 cards
3. Opportunities: Standard size, 2-4 cards
4. Warnings: Conditional, only if issues exist
5. Quick Stats: Summary list, compact

Typography:
- Section headers: 14sp, bold, uppercase, neutral-600
- Card titles: 18sp, semibold, neutral-900
- Card body: 14sp, regular, neutral-700
- Metrics: 16sp, medium, neutral-900
- Action buttons: 14sp, medium, primary color

Icons:
- Top insight: Lightning bolt ⚡
- Trends: Chart up 📈
- Opportunities: Light bulb 💡
- Warnings: Red circle 🔴
- Stats: Chart 📊
- Size: 24x24dp, inline with title

STATES:

Loading State:
- Skeleton cards with shimmer animation
- "Analyzing your data..." text
- 3-5 placeholder cards
- No interaction until loaded

Populated State (shown above):
- Dynamic content based on data
- Cards reorder by priority daily
- Warnings appear/disappear based on conditions
- Scroll enabled if content exceeds screen

Insufficient Data State:
- Shows when <7 entries logged
- Message: "Keep logging entries"
- "Insights become more accurate with 7+ days of data"
- Shows basic stats available
- Encourages continued logging

CALCULATION LOGIC:

Top Insight Selection (Priority):
1. Critical warnings (no entries 3+ days)
2. Significant ROI differences (>2x between platforms)
3. Goal progress alerts (behind schedule)
4. Major trend changes (>20% week-over-week)
5. Optimization opportunities (budget reallocation potential >$200)

Trend Calculation:
- Week-over-week: Current 7 days vs previous 7 days
- Month-over-month: Current 30 days vs previous 30 days
- Percentage change: ((Current - Previous) / Previous) × 100
- Significance threshold: >10% change highlighted

ROI Calculation:
- ROI = Total Revenue / Total Spend
- Platform ROI = Platform Revenue / Platform Spend
- Comparison: Highest ROI vs Lowest ROI
- Recommendation threshold: >1.5x difference

Opportunity Detection:
- Best days: Days with >20% higher profit than average
- Worst days: Days with <20% lower profit than average
- Efficiency: Cost per DM = Platform Spend / Platform DMs
- Sample size: Minimum 4 instances per pattern

Warning Triggers:
- No entry: 3+ days without logging
- Negative ROI: Platform ROI <1.0 for 7+ days
- Budget exceeded: Actual spend >110% of planned
- Goal behind: <70% of target with <30% time remaining

VALIDATION:

Data Requirements:
- Minimum 1 tracker with 1+ entries
- Empty state (Screen 38) shown if no data
- Partial insights shown with <7 entries
- Full insights available with 7+ entries

Update Frequency:
- Recalculates on new entry logged
- Refreshes on screen focus
- "Last updated" timestamp shown
- Manual refresh available (pull-down)

Insight Accuracy:
- Confidence level based on data volume
- Shows "Based on X entries" disclaimer
- Warns when sample size small
- More data = more specific recommendations

ACCESSIBILITY:

Screen Reader:
- Each insight card is separate element
- Priority level announced
- Metrics read as "X dollars" not "$X"
- Action buttons clearly labeled

Visual:
- High contrast text (4.5:1 minimum)
- Color not sole indicator (icons + text)
- Large touch targets (48dp minimum)
- Clear visual hierarchy

Interaction:
- All cards tappable (full card, not just button)
- Haptic feedback on tap
- Long press shows card menu (share, dismiss)
- Swipe to dismiss non-critical insights

BUSINESS LOGIC:

Insight Generation Algorithm:
1. Load all entries for current tracker
2. Calculate platform-level metrics (ROI, spend, revenue)
3. Identify trends (week-over-week, month-over-month)
4. Compare against goals (if set)
5. Detect patterns (day of week, time periods)
6. Score insights by impact potential
7. Select top 5-7 insights to display
8. Generate natural language descriptions
9. Provide specific, actionable recommendations

Recommendation Rules:
- Always include specific action ("Shift $200 to YouTube")
- Quantify potential impact ("Gain +$440/month")
- Provide context ("YouTube ROI 3.2x vs Facebook 0.9x")
- Avoid jargon (use plain language)
- One recommendation per insight
- Actionable within current month

RATIONALE:

Why This Screen is Essential:
1. **Transforms Data into Decisions** - Answers "what should I do?"
2. **Daily Engagement** - Users return to see updated insights
3. **Reduces Analysis Burden** - No manual spreadsheet work
4. **Prevents Missed Opportunities** - Highlights what user might miss
5. **Builds Confidence** - Data-backed recommendations
6. **Creates Action Loop** - Insight → Action → New data → New insight

Design Principles Applied:
- **Clarity:** Each insight is self-contained and clear
- **Priority:** Top insight always visible first
- **Actionability:** Every insight includes next step
- **Simplicity:** No charts, just clear text and numbers
- **Context:** Shows why recommendation matters

User Value:
- **Saves Time:** No manual analysis needed
- **Improves ROI:** Optimizes budget allocation
- **Prevents Waste:** Alerts to inefficient spending
- **Increases Confidence:** Know decisions are data-backed
- **Accelerates Learning:** Understand what works faster

Why Not Charts:
- User requested no complex charts
- Text insights are more actionable
- Easier to understand at a glance
- Better for mobile screens
- Reduces cognitive load
```

---

## SCREEN 37: INSIGHTS DETAIL VIEW

**Title:** Insight Detail  
**Subtitle:** Deep dive into specific insight

**Description:** Expanded view of a single insight showing full context, detailed breakdown, supporting data, historical comparison, and multiple action options. Provides complete information for informed decision-making.

**Functions:**
- Show complete insight explanation
- Display detailed supporting metrics
- Show historical trend data
- Compare current vs. previous periods
- Provide multiple action options
- Allow sharing insight
- Enable dismissing insight

**Navigation:**
- Accessed from: Screen 36 → Tap any insight card
- Tap [Take Action] → Relevant screen (Screen 7 for log entry, Screen 39 for platform detail)
- Tap [Share Insight] → Share sheet
- Tap [Dismiss] → Returns to Screen 36, removes insight
- Tap [← Back] → Returns to Screen 36

```
┌─────────────────────────────────────────────┐
│  ← Insight Detail                  [Share]  │
├─────────────────────────────────────────────┤
│                                             │
│  ⚡ TOP OPPORTUNITY                         │
│  Generated: 2 hours ago                     │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  INSIGHT                                    │
│                                             │
│  Your YouTube ROI is 3.2x                   │
│                                             │
│  "YouTube ads are your best performer,      │
│  generating $3.20 for every $1 spent.       │
│  This is significantly higher than your     │
│  other platforms."                          │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  DETAILED BREAKDOWN                         │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  Platform Comparison (This Month)   │   │
│  │                                     │   │
│  │  YouTube:                           │   │
│  │  Spent: $1,200                      │   │
│  │  Earned: $3,850                     │   │
│  │  ROI: 3.2x 🟢                       │   │
│  │  Profit: +$2,650                    │   │
│  │                                     │   │
│  │  LinkedIn:                          │   │
│  │  Spent: $800                        │   │
│  │  Earned: $1,440                     │   │
│  │  ROI: 1.8x 🟡                       │   │
│  │  Profit: +$640                      │   │
│  │                                     │   │
│  │  Facebook:                          │   │
│  │  Spent: $950                        │   │
│  │  Earned: $855                       │   │
│  │  ROI: 0.9x 🔴                       │   │
│  │  Profit: -$95                       │   │
│  │                                     │   │
│  │  Difference:                        │   │
│  │  YouTube is 3.6x better than        │   │
│  │  Facebook (3.2 vs 0.9)              │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  HISTORICAL TREND                           │
│                                             │
│  YouTube ROI over time:                     │
│  • 4 weeks ago: 2.8x                        │
│  • 3 weeks ago: 3.0x                        │
│  • 2 weeks ago: 3.1x                        │
│  • Last week: 3.2x                          │
│  • This week: 3.2x                          │
│                                             │
│  Trend: Consistently strong ✓               │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  RECOMMENDATION                             │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  💡 Budget Reallocation              │   │
│  │                                     │   │
│  │  Current Allocation:                │   │
│  │  • YouTube: 40% ($1,200)            │   │
│  │  • LinkedIn: 27% ($800)             │   │
│  │  • Facebook: 33% ($950)             │   │
│  │                                     │   │
│  │  Recommended:                       │   │
│  │  • YouTube: 60% ($1,800) +$600     │   │
│  │  • LinkedIn: 27% ($800) Same       │   │
│  │  • Facebook: 13% ($400) -$550      │   │
│  │                                     │   │
│  │  Expected Impact:                   │   │
│  │  Additional spend: $600 on YouTube  │   │
│  │  Expected return: $1,920 (3.2x)     │   │
│  │  Saved from Facebook: $550          │   │
│  │  Lost opportunity: -$495 (0.9x)     │   │
│  │                                     │   │
│  │  Net Gain: +$1,975/month            │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  ACTIONS                                    │
│                                             │
│  [View Platform Details]                    │
│  Primary button → Screen 39                 │
│                                             │
│  [Adjust Budget]                            │
│  Secondary button → Screen 14 (Settings)    │
│                                             │
│  [Dismiss This Insight]                     │
│  Text button, removes from feed             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  SUPPORTING DATA                            │
│                                             │
│  Based on:                                  │
│  • 28 entries this month                    │
│  • 84 entries total                         │
│  • 3 platforms tracked                      │
│  • 30-day analysis window                   │
│                                             │
│  Confidence: High ✓                         │
│  (Sufficient data for accurate insight)     │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  (Bottom padding)                           │
│                                             │
└─────────────────────────────────────────────┘

COMPONENT SPECIFICATIONS:

Header:
- Insight type badge (Top Opportunity, Warning, Trend)
- Timestamp: "Generated X hours ago"
- Share button (top right)
- Back navigation (top left)

Content Sections:
1. Insight summary (headline + explanation)
2. Detailed breakdown (data table/cards)
3. Historical trend (time series data)
4. Recommendation (actionable steps with math)
5. Actions (primary, secondary, dismiss)
6. Supporting data (methodology, confidence)

Typography:
- Headline: 24sp, bold, neutral-900
- Section headers: 16sp, semibold, neutral-800
- Body text: 14sp, regular, neutral-700
- Data values: 16sp, medium, neutral-900
- Recommendations: 14sp, regular, highlighted background

Data Cards:
- Platform comparison cards
- Left border color (green/yellow/red based on performance)
- Metrics in clear hierarchy (Spent → Earned → ROI → Profit)
- Color-coded ROI indicators

STATES:

Default State (shown above):
- Full insight with all sections
- Action buttons enabled
- Share available

Loading State:
- Skeleton loader while fetching detailed data
- Preserves layout structure
- Shows "Loading details..." message

Error State:
- If detailed data fetch fails
- Shows summary insight only
- "Full details unavailable" message
- Retry option provided

Dismissed State:
- After user taps [Dismiss]
- Toast: "Insight dismissed"
- Returns to Screen 36
- Insight removed from feed

INTERACTION LOGIC:

Share Button:
- Opens native share sheet
- Shares formatted text:
  "💡 Insight from Grow Out Loud
   
   Your YouTube ROI is 3.2x
   
   YouTube: Spent $1,200 → Earned $3,850
   ROI: 3.2x, Profit: +$2,650
   
   Recommendation: Shift budget to YouTube for +$1,975/month gain"
- Includes summary metrics
- Can share to email, messaging, notes

Primary Action:
- Context-dependent based on insight type
- ROI insight → "View Platform Details" (Screen 39)
- Warning → "Log Entry Now" (Screen 7)
- Goal insight → "View Goal Progress" (Screen 40)
- Trend → "View Reports" (Screen 5)

Dismiss Insight:
- Removes from main feed (Screen 36)
- Stored in dismissed history
- Can be re-enabled in settings
- Doesn't delete underlying data

VALIDATION:

Data Freshness:
- Shows age of insight ("2 hours ago")
- Recalculates if >24 hours old
- "Outdated" badge if >3 days old
- Auto-refresh option provided

Recommendation Accuracy:
- Based on minimum 7 days data
- Confidence level shown (High/Medium/Low)
- Methodology explained in "Supporting Data"
- Disclaimers for small sample sizes

Historical Trend Requirements:
- Minimum 4 weeks of data for trend
- Shows available data if less
- "Limited data" notice if <4 weeks
- Projections marked as estimates

RATIONALE:

Why Detail View is Needed:
1. **Transparency** - Shows how insight was calculated
2. **Trust** - User sees supporting data
3. **Actionability** - Multiple clear action paths
4. **Education** - User learns what drives performance
5. **Shareability** - Can share with team/advisor

Design Decisions:
- **One insight per screen** - Focused, not overwhelming
- **Supporting data visible** - Builds trust in recommendations
- **Multiple actions** - Flexible response options
- **Dismissible** - User controls what they see
- **Shareable** - Enables collaboration

User Value:
- **Full Context** - Complete picture, not summary
- **Confidence** - Math shown, not hidden
- **Flexibility** - Choose how to respond
- **Learning** - Understand performance drivers
- **Control** - Dismiss irrelevant insights
```

---

## SCREEN 38: INSIGHTS DASHBOARD EMPTY STATE

**Title:** Insights  
**Subtitle:** Empty state when no data exists

**Description:** Shown when user accesses Insights Dashboard but has insufficient data (<1 entry logged). Explains what insights are, how they work, and encourages user to start logging entries to unlock insights.

**Functions:**
- Explain what insights provide
- Show requirements for insights
- Motivate user to log entries
- Provide direct path to logging
- Set expectations for when insights appear

**Navigation:**
- Accessed from: Dashboard → Tap (ⓘ) icon (if no entries exist)
- Tap [Log Your First Entry] → Screen 7 (Log Entry)
- Tap [← Back] → Returns to Dashboard

```
┌─────────────────────────────────────────────┐
│  ← Insights                                  │
├─────────────────────────────────────────────┤
│                                             │
│                                             │
│                                             │
│            💡                               │
│        (Large icon)                         │
│                                             │
│                                             │
│      Get Smart Recommendations              │
│                                             │
│                                             │
│  Insights analyze your tracking data        │
│  to provide:                                │
│                                             │
│  • Which platforms give best ROI            │
│  • Where to invest your budget              │
│  • Your most profitable days                │
│  • Goal progress predictions                │
│  • Optimization opportunities               │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  HOW IT WORKS                               │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  1️⃣  Log Your Entries                │   │
│  │  Track revenue and ad spend daily   │   │
│  ├─────────────────────────────────────┤   │
│  │  2️⃣  Insights Analyze Data          │   │
│  │  Patterns and trends identified     │   │
│  ├─────────────────────────────────────┤   │
│  │  3️⃣  Get Recommendations            │   │
│  │  Actionable next steps provided     │   │
│  └─────────────────────────────────────┘   │
│  Simple 3-step process                      │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  REQUIREMENTS                               │
│                                             │
│  Basic Insights: 1+ entry                   │
│  Full Insights: 7+ entries                  │
│  Advanced Insights: 30+ entries             │
│                                             │
│  The more data you log, the more            │
│  accurate and helpful insights become.      │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  [Log Your First Entry]                     │
│  Primary button → Screen 7                  │
│                                             │
│                                             │
│  Don't have a tracker yet?                  │
│  [Create Tracker]                           │
│  Text link → Screen 2                       │
│                                             │
│                                             │
│                                             │
└─────────────────────────────────────────────┘

COMPONENT SPECIFICATIONS:

Icon:
- Light bulb or brain icon
- Size: 80x80dp
- Centered, top third of screen
- Subtle animation (optional): Gentle glow/pulse

Headline:
- Typography: 24sp, bold, neutral-900
- Centered below icon
- Clear value proposition

Benefit List:
- 5 key insights listed
- Bullet points or checkmarks
- Typography: 14sp, regular, neutral-700
- Scannable format

How It Works Section:
- 3 numbered steps
- Card format with borders
- Progressive flow (1→2→3)
- Clear, simple language

Requirements Section:
- Shows data tiers (1, 7, 30 entries)
- Explains correlation: more data = better insights
- Typography: 14sp, neutral-600
- Encouragement tone

CTA Button:
- Primary button styling
- Full width minus margins
- Clear action: "Log Your First Entry"
- Prominent placement

Secondary Action:
- Text link, smaller
- For users without tracker
- Non-intrusive

STATES:

True Empty (No Tracker):
- Shows "Create Tracker" link prominently
- Explains need tracker first
- Simplified content

Has Tracker, No Entries:
- Default state (shown above)
- Emphasizes logging entries
- "Log Your First Entry" primary CTA

Partial Data (<7 entries):
- Modified empty state
- "You have X entries. Y more for full insights."
- Shows preview of available insights
- Encourages continued logging

RATIONALE:

Why Empty State is Important:
1. **Explains Value** - User understands what they'll get
2. **Sets Expectations** - Clear requirements shown
3. **Motivates Action** - Encourages logging
4. **Reduces Confusion** - Why insights aren't showing
5. **Guides Next Step** - Clear path forward

Design Decisions:
- **Visual Icon** - Makes screen feel less empty
- **Benefit-Focused** - Shows value, not features
- **Clear Requirements** - No guessing what's needed
- **Progressive Tiers** - Basic → Full → Advanced
- **Encouraging Tone** - Positive, not demanding

User Value:
- **Clarity** - Knows what to expect
- **Motivation** - Sees value of logging
- **Direction** - Clear next action
- **No Dead End** - Always actionable path
```

---

## SCREEN 39: PLATFORM ROI DETAIL

**Title:** Platform Analysis  
**Subtitle:** Deep-dive ROI comparison

**Description:** Detailed analysis of individual platform performance with ROI calculations, efficiency metrics, cost per lead, spending trends, and budget reallocation recommendations. Enables data-driven platform investment decisions.

**Functions:**
- Display comprehensive platform metrics
- Calculate and compare ROI across all platforms
- Show cost per DM/lead efficiency
- Identify best and worst performers
- Recommend budget allocation
- Show spending trends over time
- Provide platform-specific insights

**Navigation:**
- Accessed from: Dashboard → Tap platform card
- Accessed from: Screen 36 (Insights) → Tap "Platform Analysis" 
- Accessed from: Screen 37 (Insight Detail) → Tap "View Platform Details"
- Tap platform card → Expands to show detailed metrics
- Tap [← Back] → Returns to previous screen

```
┌─────────────────────────────────────────────┐
│  ← Platform Analysis                         │
├─────────────────────────────────────────────┤
│                                             │
│  NeoLaunch                                  │
│  This Month (Oct 1 - Oct 26)                │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  🏆 BEST PERFORMER                          │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │                                     │   │
│  │  YouTube                            │   │
│  │                                     │   │
│  │  ┌───────────────────────────────┐ │   │
│  │  │ ROI: 3.2x                     │ │   │
│  │  │ Every $1 → $3.20             │ │   │
│  │  └───────────────────────────────┘ │   │
│  │  Large, prominent display          │   │
│  │                                     │   │
│  │  FINANCIAL                          │   │
│  │  Spent: $1,200                      │   │
│  │  Revenue: $3,850                    │   │
│  │  Profit: +$2,650 🟢                 │   │
│  │                                     │   │
│  │  EFFICIENCY                         │   │
│  │  DMs Generated: 120                 │   │
│  │  Cost per DM: $10.00                │   │
│  │  Days Active: 26                    │   │
│  │  Avg Revenue/Day: $148              │   │
│  │                                     │   │
│  │  STATUS: ✅ Keep investing          │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│  Green border, checkmark badge              │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  ALL PLATFORMS                              │
│                                             │
│  Sort by: [ROI ▼] Profit | Spend | DMs     │
│  Tap to change sort                         │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  YouTube          ROI: 3.2x  🟢     │   │
│  │                                     │   │
│  │  Spent: $1,200                      │   │
│  │  Revenue: $3,850                    │   │
│  │  Profit: +$2,650                    │   │
│  │  DMs: 120 ($10.00 each)             │   │
│  │                                     │   │
│  │  [View Details ▼]                   │   │
│  │  Tap to expand                      │   │
│  └─────────────────────────────────────┘   │
│  Collapsible card                           │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  LinkedIn         ROI: 1.8x  🟡     │   │
│  │                                     │   │
│  │  Spent: $800                        │   │
│  │  Revenue: $1,440                    │   │
│  │  Profit: +$640                      │   │
│  │  DMs: 45 ($17.78 each)              │   │
│  │                                     │   │
│  │  [View Details ▼]                   │   │
│  └─────────────────────────────────────┘   │
│  Yellow border, neutral performance         │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  Facebook         ROI: 0.9x  🔴     │   │
│  │                                     │   │
│  │  Spent: $950                        │   │
│  │  Revenue: $855                      │   │
│  │  Profit: -$95 ⚠️                    │   │
│  │  DMs: 38 ($25.00 each)              │   │
│  │                                     │   │
│  │  ⚠️ Losing money - review strategy  │   │
│  │                                     │   │
│  │  [View Details ▼]                   │   │
│  └─────────────────────────────────────┘   │
│  Red border, warning badge                  │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  📊 COMPARISON INSIGHTS                     │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  ROI Ranking                        │   │
│  │  1. YouTube: 3.2x (Best)            │   │
│  │  2. LinkedIn: 1.8x (Average)        │   │
│  │  3. Facebook: 0.9x (Underperforming)│   │
│  │                                     │   │
│  │  Spread: 3.6x difference            │   │
│  │  (YouTube vs Facebook)              │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  Lead Generation Efficiency         │   │
│  │  1. YouTube: $10.00/DM (Best)       │   │
│  │  2. LinkedIn: $17.78/DM             │   │
│  │  3. Facebook: $25.00/DM (Worst)     │   │
│  │                                     │   │
│  │  YouTube is 2.5x more efficient     │   │
│  │  than Facebook for lead gen.        │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  💡 RECOMMENDATIONS                         │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  Budget Reallocation                │   │
│  │                                     │   │
│  │  Current Allocation:                │   │
│  │  • YouTube: 40% ($1,200)            │   │
│  │  • LinkedIn: 27% ($800)             │   │
│  │  • Facebook: 33% ($950)             │   │
│  │  Total: $2,950                      │   │
│  │                                     │   │
│  │  Recommended:                       │   │
│  │  • YouTube: 60% ($1,800) +$600     │   │
│  │  • LinkedIn: 30% ($900) +$100      │   │
│  │  • Facebook: 10% ($300) -$650      │   │
│  │  Total: $3,000 (same budget)        │   │
│  │                                     │   │
│  │  Expected Monthly Impact:           │   │
│  │  YouTube gain: +$1,920              │   │
│  │  LinkedIn gain: +$180               │   │
│  │  Facebook loss: -$585               │   │
│  │  Net Gain: +$1,515/month 🎉        │   │
│  │                                     │   │
│  │  [Apply Recommended Budget]         │   │
│  │  Button → Updates future entries    │   │
│  └─────────────────────────────────────┘   │
│  Highlighted card with action button        │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  SPENDING TRENDS (Last 4 Weeks)             │
│                                             │
│  Week 1: $720 total                         │
│  Week 2: $780 total                         │
│  Week 3: $890 total                         │
│  Week 4: $1,120 total (current)             │
│                                             │
│  Trend: Spending increasing 15%/week        │
│  Note: Ensure revenue scales proportionally │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  (Bottom padding for scroll)                │
│                                             │
└─────────────────────────────────────────────┘

COMPONENT SPECIFICATIONS:

Best Performer Card:
- Prominent placement at top
- Trophy emoji/icon
- Large ROI display (32sp)
- Green border (4dp left)
- All key metrics visible
- "Keep investing" status message

Platform Cards (Collapsible):
- Header shows: Name, ROI, status indicator
- Summary metrics: Spent, Revenue, Profit, DMs
- Colored border (green/yellow/red)
- Expand/collapse chevron
- When expanded: Shows detailed breakdown

Sort Options:
- Dropdown selector
- Options: ROI, Profit, Spend, DMs, Revenue
- Default: ROI (highest first)
- Reorders cards on selection

Comparison Insights:
- Side-by-side ranking cards
- Shows relative performance
- Highlights spread (difference)
- Easy-to-scan format

Recommendation Card:
- Yellow/gold background (attention)
- Current vs. Recommended comparison
- Expected impact calculation
- Action button to apply
- Net gain highlighted prominently

Spending Trends:
- Week-by-week breakdown
- Total spend per week
- Trend direction indicator
- Contextual note/warning

STATES:

Default State (shown above):
- All platforms listed
- Best performer highlighted
- Cards collapsed by default
- Recommendations shown

Expanded Platform Card:
- When user taps "View Details"
- Shows additional metrics:
  • Daily average spend/revenue
  • Best performing day
  • Worst performing day
  • Week-over-week trend
  • Last 5 entries for platform
- Collapse button

Single Platform:
- If tracker only has 1 platform
- No comparison section
- Recommendations focus on optimization
- Historical trend more prominent

No Data State:
- If no entries with platform spend logged
- Message: "Start logging platform spend"
- Explanation of what metrics will show
- CTA: "Log Entry with Platform Spend"

CALCULATIONS:

ROI:
ROI = Total Revenue / Total Spend
Example: $3,850 / $1,200 = 3.21 → 3.2x

Cost per DM:
Cost per DM = Total Spend / Total DMs
Example: $1,200 / 120 = $10.00

Profit:
Profit = Total Revenue - Total Spend
Example: $3,850 - $1,200 = +$2,650

Efficiency Score:
Efficiency = (ROI × Volume) / Cost per DM
Higher = Better
Used for ranking when ROIs similar

Budget Recommendation:
1. Calculate current ROI for each platform
2. Rank platforms by ROI
3. Allocate budget proportional to ROI
4. Top platform gets 50-60% budget
5. Underperformers (<1.0 ROI) get minimum (10-15%)
6. Calculate expected return based on historical ROI
7. Show net gain vs. current allocation

VALIDATION:

Minimum Data Requirements:
- At least 1 entry with platform spend
- Shows "Limited data" warning if <5 entries
- Recommendations require 7+ entries
- Confidence level shown based on data volume

ROI Accuracy:
- Based on actual logged revenue/spend
- Not predictive, historical
- Confidence increases with more data
- Outliers flagged (unusually high/low days)

Recommendation Constraints:
- Never recommends 0% to any platform
- Minimum allocation: 10% per active platform
- Maximum allocation: 70% to single platform
- Total budget stays same (reallocation, not increase)
- Based on 30-day average ROI

ACCESSIBILITY:

Color-Coding + Text:
- Green/yellow/red borders
- Plus text indicators (Best/Average/Underperforming)
- ROI numbers always shown
- Status messages in plain text

Touch Targets:
- Expand buttons: 48dp minimum
- Sort selector: 56dp height
- Action buttons: Full width, 48dp height
- Cards fully tappable (not just button)

Screen Reader:
- Platform cards announced with ROI
- Rankings read as "1 of 3: YouTube"
- Recommendations read with impact ("Gain $1,515 per month")
- Status clearly announced

RATIONALE:

Why This Screen is Essential:
1. **Budget Optimization** - Know where to invest
2. **Efficiency Comparison** - Cost per lead varies widely
3. **Actionable Recommendations** - Specific reallocation guidance
4. **Transparency** - See exactly how ROI calculated
5. **Trend Awareness** - Spot spending increases early

Design Decisions:
- **Best Performer First** - Positive reinforcement
- **Color-Coded** - Quick visual assessment
- **Collapsible** - Prevent overwhelming with data
- **Sort Options** - Flexible analysis
- **Apply Button** - Easy action on recommendations

User Value:
- **Save Money** - Stop wasting on low-ROI platforms
- **Maximize Returns** - Invest in winners
- **Data-Backed** - No guessing where to spend
- **Simple Math** - ROI easy to understand
- **Specific Actions** - "Shift $600 to YouTube" not vague advice
```

---

## SCREEN 40: GOAL PROGRESS TAB

**Title:** Goals  
**Subtitle:** Track progress toward targets

**Description:** New tab within Tracker Hub showing progress toward revenue and engagement goals. Displays current vs. target, daily pace required, on-track status, projections, and actionable recommendations to close gaps. Creates accountability and motivation.

**Functions:**
- Show revenue goal progress (visual + numerical)
- Show engagement goal progress (DMs/leads)
- Calculate daily pace required to hit goal
- Compare current pace vs. required pace
- Project final results based on current pace
- Provide recommendations to close gaps
- Show time remaining
- Celebrate milestones

**Navigation:**
- Accessed from: Tracker Hub (Screen 3) → Goals tab
- Sibling tabs: Overview | Daily Entries | Reports | Goals
- Tap [Adjust Goals] → Screen 14 (Edit Tracker Settings)
- Tap [Log Entry] → Screen 7 (Log Daily Entry)
- Contextual based on tracker being viewed

```
┌─────────────────────────────────────────────┐
│  ← NeoLaunch                                 │
├─────────────────────────────────────────────┤
│                                             │
│  [Overview] [Entries] [Reports] [Goals]     │
│                           Active tab        │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  GOAL PROGRESS                              │
│  18 days remaining (Oct 26 - Nov 13)        │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  💰 REVENUE TARGET                          │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │                                     │   │
│  │  $10,000 Goal                       │   │
│  │  (Set on Oct 1)                     │   │
│  │                                     │   │
│  │  ▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░ 58%          │   │
│  │  Progress bar (green fill)          │   │
│  │                                     │   │
│  │  $5,800 / $10,000                   │   │
│  │  Large, bold current amount         │   │
│  │                                     │   │
│  │  ─────────────────────────────      │   │
│  │                                     │   │
│  │  STATUS: ✅ On Track                │   │
│  │  Green checkmark, positive badge    │   │
│  │                                     │   │
│  │  18 days remaining                  │   │
│  │  (48% of time used, 58% complete)   │   │
│  │                                     │   │
│  │  ─────────────────────────────      │   │
│  │                                     │   │
│  │  PACE ANALYSIS                      │   │
│  │                                     │   │
│  │  Required: $234/day                 │   │
│  │  (To hit goal by Nov 13)            │   │
│  │                                     │   │
│  │  Current: $290/day                  │   │
│  │  (Based on 20 days tracked)         │   │
│  │                                     │   │
│  │  Ahead by: $56/day 🎉               │   │
│  │  You're exceeding target pace!      │   │
│  │                                     │   │
│  │  ─────────────────────────────      │   │
│  │                                     │   │
│  │  PROJECTION                         │   │
│  │                                     │   │
│  │  At current pace, you'll reach:     │   │
│  │  $11,020 by Nov 13 ✓                │   │
│  │                                     │   │
│  │  $1,020 over goal (110%)            │   │
│  │  Excellent progress!                │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│  Green border, success indicators           │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  📊 ENGAGEMENT TARGET                       │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │                                     │   │
│  │  1,000 DMs Goal                     │   │
│  │                                     │   │
│  │  ▓▓▓▓▓▓▓░░░░░░░░░░░░ 42%          │   │
│  │  Progress bar (yellow fill)         │   │
│  │                                     │   │
│  │  420 / 1,000 DMs                    │   │
│  │                                     │   │
│  │  ─────────────────────────────      │   │
│  │                                     │   │
│  │  STATUS: ⚠️ Behind Schedule         │   │
│  │  Yellow warning badge               │   │
│  │                                     │   │
│  │  18 days remaining                  │   │
│  │  (48% of time used, 42% complete)   │   │
│  │                                     │   │
│  │  ─────────────────────────────      │   │
│  │                                     │   │
│  │  PACE ANALYSIS                      │   │
│  │                                     │   │
│  │  Required: 32 DMs/day               │   │
│  │  (To hit goal by Nov 13)            │   │
│  │                                     │   │
│  │  Current: 21 DMs/day                │   │
│  │  (Based on 20 days tracked)         │   │
│  │                                     │   │
│  │  Behind by: 11 DMs/day ⚠️           │   │
│  │  Need to increase outreach          │   │
│  │                                     │   │
│  │  ─────────────────────────────      │   │
│  │                                     │   │
│  │  PROJECTION                         │   │
│  │                                     │   │
│  │  At current pace, you'll reach:     │   │
│  │  798 DMs by Nov 13 ⚠️               │   │
│  │                                     │   │
│  │  202 DMs short (80%)                │   │
│  │                                     │   │
│  │  💡 RECOMMENDATION                  │   │
│  │  Increase daily outreach to 50 DMs  │   │
│  │  for next 7 days to catch up.       │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│  Yellow border, warning indicators          │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  📈 PROGRESS OVER TIME                      │
│                                             │
│  Revenue (Last 4 Weeks):                    │
│  Week 1: $1,200 (24%)                       │
│  Week 2: $1,450 (29%)                       │
│  Week 3: $1,580 (32%)                       │
│  Week 4: $1,570 (31%)                       │
│  Total: $5,800 (58%)                        │
│                                             │
│  Trend: Steady growth ✓                     │
│  Consistent week-over-week progress         │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  DMs Generated (Last 4 Weeks):              │
│  Week 1: 85 (21%)                           │
│  Week 2: 110 (28%)                          │
│  Week 3: 120 (29%)                          │
│  Week 4: 105 (25%)                          │
│  Total: 420 (42%)                           │
│                                             │
│  Trend: Plateaued ⚠️                        │
│  Week 4 dip needs attention                 │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  ACTIONS                                    │
│                                             │
│  [Log Today's Entry]                        │
│  Primary button → Screen 7                  │
│                                             │
│  [Adjust Goals]                             │
│  Secondary button → Screen 14               │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  💡 TIPS                                    │
│                                             │
│  Based on your tracking:                    │
│  • Mondays generate 40% more DMs            │
│  • YouTube has best cost/DM ($10)           │
│  • Afternoon posts get more engagement      │
│                                             │
│  Optimize your schedule accordingly!        │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  (Bottom padding for scroll)                │
│                                             │
└─────────────────────────────────────────────┘

COMPONENT SPECIFICATIONS:

Tab Navigation:
- 4 tabs: Overview | Entries | Reports | Goals
- Goals tab highlighted when active
- Same navigation pattern as existing tabs
- Swipe between tabs enabled

Goal Cards:
- Two cards: Revenue + Engagement
- Separate visual treatment
- Color-coded status (green/yellow/red)
- Progress bar visual
- Collapsible detail sections

Progress Bar:
- Width: Full card width minus padding
- Height: 12dp
- Fill color: Status-dependent (green/yellow/red)
- Background: neutral-200
- Rounded corners (6dp)
- Percentage label inside or beside

Status Badges:
- On Track: Green ✅
- Behind Schedule: Yellow ⚠️
- Significantly Behind: Red 🔴
- Ahead of Schedule: Green 🎉

Pace Analysis:
- Required vs. Current comparison
- Difference highlighted (ahead/behind)
- Plain language explanation
- Color-coded indicator

Projection:
- Final expected value
- Percentage of goal
- Success/warning indicator
- Recommendation if behind

Progress Over Time:
- Week-by-week breakdown
- Percentage contribution shown
- Trend direction indicator
- Contextual notes

Action Buttons:
- Log Entry: Primary CTA
- Adjust Goals: Secondary action
- Full width minus margins
- Standard button styling

Tips Section:
- Data-driven insights
- Platform/timing recommendations
- Actionable suggestions
- Optional, based on data availability

STATES:

On Track (Revenue example shown):
- Green progress bar
- Green checkmark status
- "Ahead by X" message
- Positive projection
- Celebration tone

Behind Schedule (DMs example shown):
- Yellow progress bar
- Warning badge
- "Behind by X" message
- Shortfall projection
- Recommendation to recover

No Goals Set:
- Empty state shown (Screen 41)
- Explains benefits of goals
- CTA to set goals
- Links to Screen 14

Goal Completed:
- 100% progress bar
- Celebration badge 🎉
- "Goal achieved!" message
- Date completed shown
- Option to set new goal

CALCULATIONS:

Progress Percentage:
Progress = (Current / Target) × 100
Example: ($5,800 / $10,000) × 100 = 58%

Daily Pace Required:
Required Pace = (Target - Current) / Days Remaining
Example: ($10,000 - $5,800) / 18 = $233.33/day

Current Pace:
Current Pace = Total Earned / Days Elapsed
Example: $5,800 / 20 days = $290/day

Pace Difference:
Difference = Current Pace - Required Pace
Example: $290 - $234 = +$56/day (ahead)

Projection:
Projected Total = Current + (Current Pace × Days Remaining)
Example: $5,800 + ($290 × 18) = $11,020

On Track Status:
- Green (On Track): Current Pace >= Required Pace
- Yellow (Behind): 70% <= Current Pace < 100% of Required
- Red (Significantly Behind): Current Pace < 70% of Required

VALIDATION:

Goal Requirements:
- Must be set in tracker creation (Screen 2) or settings (Screen 14)
- Revenue goal: Optional, must be >$0 if set
- Engagement goal: Optional, must be >0 if set
- End date: Calculated from start date + duration

Progress Accuracy:
- Based on actual logged entries
- Real-time calculation on new entry
- Excludes archived/deleted entries
- Uses only completed days (not partial)

Projection Validity:
- Minimum 7 days data for projection
- Shows "Limited data" if <7 days
- Projection assumes consistent pace
- Warns if high variance in daily data

ACCESSIBILITY:

Progress Bars:
- Percentage shown as text (not just visual)
- Color not sole indicator (text status too)
- Screen reader announces: "58% complete"

Status Indicators:
- Text + icon + color
- Clear without color vision
- Status announced by screen reader

Metrics:
- Read as "5,800 dollars" not "$5,800"
- DMs read as "420 direct messages"
- Dates read in full format

Touch Targets:
- All buttons 48dp minimum
- Tap anywhere on goal card to expand details
- Tab buttons comfortable for switching

RATIONALE:

Why Goals Tab is Essential:
1. **Accountability** - Know if on track daily
2. **Motivation** - Visual progress creates drive
3. **Predictability** - Project if goal will be hit
4. **Actionability** - Specific pace targets
5. **Course Correction** - Catch issues early

Design Decisions:
- **Tab Placement** - Natural grouping with other tracker views
- **Two Cards** - Revenue + Engagement separate but comparable
- **Progress Bars** - Quick visual assessment
- **Pace Analysis** - Most actionable metric (daily targets)
- **Projections** - Creates urgency or confidence
- **Tips** - Data-driven guidance included

User Value:
- **Daily Clarity** - "Am I on track?" answered immediately
- **Specific Targets** - Know exact daily goal
- **Early Warning** - Spot problems with time to fix
- **Confidence** - See progress accumulate
- **Decision Support** - Data for adjusting tactics
```

---

## SCREEN 41: GOAL PROGRESS EMPTY STATE

**Title:** Goals  
**Subtitle:** Empty state when no goals set

**Description:** Shown when user accesses Goals tab but hasn't set revenue or engagement targets. Explains benefits of goal tracking, shows what the screen will look like, and provides path to set goals.

**Functions:**
- Explain goal tracking benefits
- Preview what goal progress shows
- Motivate user to set goals
- Provide direct path to settings
- Show examples of good goals

**Navigation:**
- Accessed from: Tracker Hub → Goals tab (when no goals set)
- Tap [Set Your Goals] → Screen 14 (Edit Tracker Settings, scrolls to goals section)
- Tap [← Back] → Returns to Overview tab

```
┌─────────────────────────────────────────────┐
│  ← NeoLaunch                                 │
├─────────────────────────────────────────────┤
│                                             │
│  [Overview] [Entries] [Reports] [Goals]     │
│                           Active tab        │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│            🎯                               │
│        (Large target icon)                  │
│                                             │
│                                             │
│      Set Goals, Track Progress              │
│                                             │
│                                             │
│  Stay on track to hit your targets with:    │
│                                             │
│  • Visual progress tracking                 │
│  • Daily pace calculations                  │
│  • Projections to goal completion           │
│  • Alerts when falling behind               │
│  • Celebration of milestones                │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  WHAT YOU'LL SEE                            │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  Revenue Goal: $10,000              │   │
│  │  ▓▓▓▓▓▓▓▓░░░░░░░░ 58%              │   │
│  │  $5,800 / $10,000                   │   │
│  │                                     │   │
│  │  Status: ✅ On Track                │   │
│  │  Need: $234/day                     │   │
│  │  Current: $290/day                  │   │
│  └─────────────────────────────────────┘   │
│  Preview card (slightly dimmed)             │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  DMs Goal: 1,000                    │   │
│  │  ▓▓▓▓▓░░░░░░░░░░░░ 42%             │   │
│  │  420 / 1,000 DMs                    │   │
│  │                                     │   │
│  │  Status: ⚠️ Behind                  │   │
│  │  Need: 32 DMs/day                   │   │
│  │  Current: 21 DMs/day                │   │
│  └─────────────────────────────────────┘   │
│  Preview card (slightly dimmed)             │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  EXAMPLES OF GOOD GOALS                     │
│                                             │
│  Revenue:                                   │
│  • First $1,000 in sales                    │
│  • $10,000 monthly recurring revenue        │
│  • Break even on setup costs                │
│                                             │
│  Engagement:                                │
│  • 500 email subscribers                    │
│  • 1,000 DMs or leads                       │
│  • 100 sales calls booked                   │
│                                             │
│  Tips:                                      │
│  • Set ambitious but realistic targets      │
│  • Based on 30-90 day timeframes            │
│  • Review and adjust monthly                │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  [Set Your Goals]                           │
│  Primary button → Screen 14 (Settings)      │
│                                             │
│                                             │
│  You can always change goals later          │
│  Text note, reassuring tone                 │
│                                             │
│                                             │
│                                             │
└─────────────────────────────────────────────┘

COMPONENT SPECIFICATIONS:

Target Icon:
- Size: 80x80dp
- Centered, top third
- Target/bullseye visual
- Subtle animation (optional)

Headline:
- Typography: 24sp, bold, neutral-900
- Centered below icon
- Action-oriented

Benefit List:
- 5 key benefits
- Checkmarks or bullet points
- Typography: 14sp, neutral-700
- Scannable format

Preview Cards:
- Sample goal progress cards
- Slightly dimmed/grayed (not real data)
- Shows what user will see
- Labeled as "Example"

Examples Section:
- Real-world goal examples
- Categorized: Revenue + Engagement
- Tips for setting good goals
- Typography: 14sp, neutral-700

CTA Button:
- Primary button styling
- Clear action: "Set Your Goals"
- Full width minus margins
- Links to settings

Reassurance Note:
- Below button
- Small text: 12sp, neutral-600
- Reduces commitment anxiety
- "Can change later" message

STATES:

True Empty (No Tracker):
- Shouldn't reach this state
- Goals tab only shown in tracker hub
- If somehow reached, redirects to create tracker

No Goals Set (Default shown above):
- Clean empty state
- Previews shown
- Clear CTA

Goals Previously Set, Then Removed:
- Modified message: "Set new goals"
- Shows previous goals (ghosted)
- Option to restore previous

RATIONALE:

Why Empty State is Important:
1. **Explains Value** - User understands benefits
2. **Shows Preview** - Visual of what they'll get
3. **Provides Examples** - Guides good goal-setting
4. **Reduces Friction** - Easy path to set goals
5. **Motivates Action** - Compelling benefits listed

Design Decisions:
- **Visual Preview** - Shows outcome, not abstract
- **Real Examples** - Concrete inspiration
- **Reassurance** - "Can change later" reduces anxiety
- **Benefit-Focused** - Why goals help, not what they are
- **One CTA** - Clear single action

User Value:
- **Clarity** - Knows what goal tracking provides
- **Inspiration** - Examples spark ideas
- **Confidence** - Can change if needed
- **Direction** - Clear next step
```

---

## SCREEN 42: NOTIFICATIONS CENTER

**Title:** Notifications  
**Subtitle:** Smart alerts and insights

**Description:** In-app notification center showing action-required alerts, opportunities, and milestone celebrations. Uses smart rules to avoid spam—only sends notifications when truly important or actionable. Keeps users engaged without being annoying.

**Functions:**
- Display action-required notifications (high priority)
- Show opportunity alerts (medium priority)
- Celebrate milestones (low priority)
- Group by time period (Today, Yesterday, This Week)
- Mark individual notifications as read
- Mark all as read
- Clear read notifications
- Link to relevant screens for action

**Navigation:**
- Accessed from: Dashboard → Tap bell icon (🔔) in header
- Badge shows unread count
- Tap notification → Navigates to relevant screen
- Tap [Mark All as Read] → Clears all unread badges
- Tap [← Back] → Returns to Dashboard

**Notification Types:**
1. **Action Required** (Red/Urgent) - Immediate action needed
2. **Insights** (Yellow/Opportunity) - Optimization suggestions
3. **Milestones** (Green/Celebration) - Achievements

```
┌─────────────────────────────────────────────┐
│  ← Notifications                             │
├─────────────────────────────────────────────┤
│                                             │
│  [All] [Action Needed] [Insights]           │
│  Filter tabs (All selected)                 │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  TODAY                                      │
│  Section header                             │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  🔴 Action Needed                    │   │
│  │                                     │   │
│  │  No entry logged today              │   │
│  │  Keep your tracking accurate        │   │
│  │                                     │   │
│  │  [Log Entry Now]                    │   │
│  │  Inline button → Screen 7           │   │
│  │                                     │   │
│  │  2 hours ago                        │   │
│  │  Timestamp, small text              │   │
│  │                                     │   │
│  │  [✓] (Checkmark to mark read)       │   │
│  └─────────────────────────────────────┘   │
│  Red left border, urgent card               │
│  Unread indicator (dot or bold)             │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  🔴 Budget Alert                     │   │
│  │                                     │   │
│  │  Facebook spend exceeded target     │   │
│  │  $1,050 spent vs $950 planned       │   │
│  │                                     │   │
│  │  [Review Platform]                  │   │
│  │  Inline button → Screen 39          │   │
│  │                                     │   │
│  │  4 hours ago                        │   │
│  │                                     │   │
│  │  [✓]                                │   │
│  └─────────────────────────────────────┘   │
│  Red border, warning card                   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  YESTERDAY                                  │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  💡 Insight                          │   │
│  │                                     │   │
│  │  YouTube ROI is 3x your best        │   │
│  │  Generating $3.20 per $1 spent      │   │
│  │                                     │   │
│  │  [View Details]                     │   │
│  │  Inline button → Screen 37          │   │
│  │                                     │   │
│  │  1 day ago                          │   │
│  │                                     │   │
│  │  [✓]                                │   │
│  └─────────────────────────────────────┘   │
│  Yellow border, opportunity card            │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  💡 Pattern Detected                 │   │
│  │                                     │   │
│  │  Mondays are your best days         │   │
│  │  40% higher profit than average     │   │
│  │                                     │   │
│  │  Schedule high-value content on     │   │
│  │  Mondays for better results.        │   │
│  │                                     │   │
│  │  [View Insights]                    │   │
│  │  Inline button → Screen 36          │   │
│  │                                     │   │
│  │  1 day ago                          │   │
│  │                                     │   │
│  │  [✓]                                │   │
│  └─────────────────────────────────────┘   │
│  Yellow border, insight card                │
│  Already read (checkmark filled)            │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  THIS WEEK                                  │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  🎉 Milestone                        │   │
│  │                                     │   │
│  │  You hit $5,000 revenue!            │   │
│  │  Halfway to your $10,000 goal       │   │
│  │                                     │   │
│  │  [View Goal Progress]               │   │
│  │  Inline button → Screen 40          │   │
│  │                                     │   │
│  │  3 days ago                         │   │
│  │                                     │   │
│  │  [✓]                                │   │
│  └─────────────────────────────────────┘   │
│  Green border, celebration card             │
│  Already read                               │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  🎉 Achievement                      │   │
│  │                                     │   │
│  │  7-day tracking streak!             │   │
│  │  Consistency builds accuracy        │   │
│  │                                     │   │
│  │  4 days ago                         │   │
│  │                                     │   │
│  │  [✓]                                │   │
│  └─────────────────────────────────────┘   │
│  Green border, celebration                  │
│  Already read                               │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  [Mark All as Read]                         │
│  Secondary button                           │
│                                             │
│  [Clear Read Notifications]                 │
│  Text button (removes read items)           │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  (Bottom padding)                           │
│                                             │
└─────────────────────────────────────────────┘

COMPONENT SPECIFICATIONS:

Header:
- Title: "Notifications"
- Bell icon with badge (unread count)
- Back button

Filter Tabs:
- All | Action Needed | Insights
- Tappable filters
- Active tab underlined
- Filters notification list

Notification Cards:
- Left border color (red/yellow/green)
- Icon indicator (🔴💡🎉)
- Type label (Action/Insight/Milestone)
- Title (bold, 16sp)
- Description (14sp, neutral-700)
- Inline action button (optional)
- Timestamp (12sp, neutral-600)
- Read/unread indicator
- Mark read checkbox (tap to toggle)

Time Grouping:
- Today
- Yesterday
- This Week
- Earlier (if needed)
- Section headers: 12sp, uppercase, neutral-600

Unread Indicators:
- Bold title
- Blue dot badge
- Slightly elevated card
- Unread count in header

Action Buttons:
- Inline within card
- Secondary button styling
- Direct navigation to relevant screen
- Not all notifications have buttons

Mark Read:
- Checkbox icon on each card
- Tap to toggle read/unread
- Filled checkmark = read
- Empty checkbox = unread

STATES:

Default State (shown above):
- Mix of unread and read notifications
- Grouped by time period
- Filter set to "All"
- Scroll enabled

Filtered State:
- Tap "Action Needed" → Shows only red cards
- Tap "Insights" → Shows only yellow cards
- Empty if no notifications in category

All Read:
- No bold titles
- All checkmarks filled
- "Mark All as Read" button disabled
- No unread badge on bell icon

Empty State:
- Shows Screen 43
- No notifications to display
- Encouraging message

Loading State:
- Skeleton notification cards
- "Loading notifications..." text
- 3-4 placeholder cards

NOTIFICATION TRIGGERS:

Action Required (Red):
Triggers:
- No entry logged for 3+ days
- Budget exceeded on any platform (>110% of plan)
- Goal behind schedule (current pace <70% of required)
- Negative ROI on platform for 7+ consecutive days
- Tracker inactive for 7+ days

Frequency:
- Once per issue per day maximum
- Dismissed if user takes action
- Re-alerts if issue persists 3+ days

Insights (Yellow):
Triggers:
- Platform ROI difference >2x detected
- Best day pattern identified (>20% better than average, 4+ instances)
- Spending trend significant (>15% change week-over-week)
- Efficiency opportunity (cost per DM variance >50% between platforms)
- Optimization potential >$200/month calculated

Frequency:
- Maximum 2 insights per week
- Only if new pattern detected
- User can dismiss permanently

Milestones (Green):
Triggers:
- Goal progress milestones (25%, 50%, 75%, 100%)
- Revenue milestones ($1k, $5k, $10k, $25k)
- Tracking streaks (7, 30, 90 days)
- Best day ever (highest profit)
- Best week ever (highest weekly profit)

Frequency:
- Once per milestone achieved
- Cannot be dismissed (celebratory)
- Auto-mark read after 7 days

SMART RULES (Prevents Spam):

Never Send:
- Daily reminders if user logged within 48 hours
- Generic "check your stats" messages
- Multiple notifications for same issue
- Notifications for minor changes (<10%)
- More than 3 notifications in one day

Always Send:
- Critical issues (negative ROI 7+ days, no entries 7+ days)
- Goal milestones achieved
- Budget exceeded significantly (>125%)
- Data anomalies (unusual spikes/drops)

Respect User Preferences:
- Settings allow disabling notification types
- Can disable push but keep in-app
- Can set quiet hours (no push notifications)
- Can adjust sensitivity (fewer/more notifications)

NAVIGATION FROM NOTIFICATIONS:

Action Needed:
- "No entry logged" → Log Entry (Screen 7)
- "Budget exceeded" → Platform Analysis (Screen 39)
- "Goal behind" → Goal Progress (Screen 40)
- "Negative ROI" → Platform Analysis (Screen 39)

Insights:
- "Platform ROI" → Insights Detail (Screen 37)
- "Best days" → Insights Dashboard (Screen 36)
- "Spending trend" → Reports (Screen 5)
- "Optimization" → Insights Detail (Screen 37)

Milestones:
- "Goal progress" → Goal Progress (Screen 40)
- "Revenue milestone" → Reports (Screen 5)
- "Best day/week" → Entry History (Screen 10)
- "Tracking streak" → Insights Dashboard (Screen 36)

VALIDATION:

Notification Requirements:
- User must have 1+ tracker
- Tracker must have 1+ entry for insights
- Goals must be set for goal notifications
- Minimum 7 days data for pattern notifications

Notification Accuracy:
- Real-time calculation on new entry
- Rechecks conditions every 6 hours
- Dismisses resolved issues automatically
- Shows confidence level if data limited

Push Notification Settings:
- User can enable/disable push
- Defaults to in-app only
- Respects device notification permissions
- Can set quiet hours (e.g., 10 PM - 8 AM)

ACCESSIBILITY:

Screen Reader:
- Notification type announced first
- "Action required" vs "Insight" vs "Milestone"
- Timestamp read relative ("2 hours ago")
- Read/unread status announced

Visual:
- Color + icon + text (not color alone)
- High contrast for urgency (red cards)
- Clear visual hierarchy (type → title → description)
- Unread indicator in multiple forms

Interaction:
- Full card tappable (not just button)
- Checkbox large enough (48dp target)
- Swipe to dismiss (optional)
- Long press for options menu

RATIONALE:

Why Notifications Center is Important:
1. **Re-Engagement** - Brings inactive users back
2. **Timely Action** - Alerts to issues early
3. **Opportunity** - Surfaces optimization chances
4. **Motivation** - Celebrates wins
5. **Habit Building** - Encourages consistent logging

Design Decisions:
- **Smart Rules** - Prevents notification fatigue
- **Three Types** - Clear priority system
- **Inline Actions** - Direct path to resolve
- **Time Grouping** - Easy to scan recent
- **Filters** - Focus on what matters now
- **Dismissible** - User controls feed

User Value:
- **Stay Informed** - Know issues immediately
- **Take Action** - Direct links to fix
- **Optimize** - Insights surfaced automatically
- **Celebrate** - Milestones recognized
- **Control** - Can disable or filter
```

---

## SCREEN 43: NOTIFICATIONS EMPTY STATE

**Title:** Notifications  
**Subtitle:** Empty state when no notifications

**Description:** Shown when notification center is empty (all caught up). Celebratory tone, explains when notifications appear, provides path to main features.

**Functions:**
- Celebrate being caught up
- Explain notification types
- Show when notifications appear
- Provide quick links to main features
- Reduce anxiety about empty state

**Navigation:**
- Accessed from: Dashboard → Bell icon (when no notifications)
- Tap [View Insights] → Screen 36
- Tap [Log Entry] → Screen 7
- Tap [← Back] → Returns to Dashboard

```
┌─────────────────────────────────────────────┐
│  ← Notifications                             │
├─────────────────────────────────────────────┤
│                                             │
│                                             │
│                                             │
│            ✅                               │
│        (Large checkmark)                    │
│                                             │
│                                             │
│      You're All Caught Up!                  │
│                                             │
│                                             │
│  No notifications at the moment.            │
│  We'll let you know when there's           │
│  something important.                       │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  WHAT YOU'LL SEE HERE                       │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  🔴 Action Needed                    │   │
│  │  Alerts when action required        │   │
│  │  • No entries for 3+ days           │   │
│  │  • Budget exceeded                  │   │
│  │  • Goal falling behind              │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  💡 Insights                         │   │
│  │  Optimization opportunities         │   │
│  │  • Platform ROI differences         │   │
│  │  • Best performing days             │   │
│  │  • Budget reallocation ideas        │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  🎉 Milestones                       │   │
│  │  Celebrate your achievements        │   │
│  │  • Goal progress markers            │   │
│  │  • Revenue milestones               │   │
│  │  • Tracking streaks                 │   │
│  └─────────────────────────────────────┘   │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  QUICK ACTIONS                              │
│                                             │
│  [View Insights]                            │
│  Button → Screen 36                         │
│                                             │
│  [Log Entry]                                │
│  Button → Screen 7                          │
│                                             │
│  [View Reports]                             │
│  Button → Screen 5                          │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  💡 TIP                                     │
│                                             │
│  Notifications are sent when we detect      │
│  something important or actionable.         │
│  You can adjust notification settings       │
│  in your account settings.                  │
│                                             │
│                                             │
│                                             │
└─────────────────────────────────────────────┘

COMPONENT SPECIFICATIONS:

Checkmark Icon:
- Size: 80x80dp
- Green color (success)
- Centered, top third
- Subtle animation (optional): Check drawing

Headline:
- Typography: 24sp, bold, neutral-900
- Celebratory tone
- Centered below icon

Description:
- Typography: 14sp, regular, neutral-700
- Reassuring message
- Explains what notifications do

Type Preview Cards:
- 3 cards showing notification types
- Color-coded borders (red/yellow/green)
- Icon indicators
- Brief explanation of each type
- Examples listed

Quick Actions:
- 3 buttons linking to main features
- Secondary button styling
- Provides productive alternatives
- Stacked vertically

Tip Section:
- Light background highlight
- Small icon (💡)
- Explains notification behavior
- Links to settings mentioned

STATES:

True Empty (shown above):
- No notifications exist
- Celebratory tone
- Quick action links

First Time:
- Modified headline: "No notifications yet"
- Explains how notifications work
- More emphasis on type descriptions
- "Keep logging to get insights" message

RATIONALE:

Why Empty State is Important:
1. **No Dead End** - Provides alternatives
2. **Education** - Explains notification types
3. **Positive Tone** - Celebrates being caught up
4. **Reduces Anxiety** - Not a problem to be empty
5. **Guides Action** - Quick links to features

Design Decisions:
- **Celebration** - Checkmark, not sad face
- **Preview Types** - Shows what to expect
- **Quick Actions** - Productive alternatives
- **Tip Included** - Explains notification logic
- **Settings Link** - User control mentioned

User Value:
- **Clarity** - Knows this is normal
- **Education** - Learns about notifications
- **Action** - Can do something productive
- **Control** - Knows how to adjust settings
```

---


# PERFORMANCE TRACKER APP - STRATEGIC FEATURE ADDITIONS (PART 2)

---

## SCREEN 44: TRACKER COMPARISON VIEW (Enhanced Screen 35)

**Title:** Trackers  
**Subtitle:** Compare all active projects

**Description:** Enhanced version of the Trackers List View (Screen 35) that shows all active trackers with comparison metrics, ROI rankings, resource allocation analysis, and reallocation recommendations. Helps users with multiple trackers optimize where to invest time and budget.

**Functions:**
- List all active trackers with key metrics
- Sort by performance (ROI, profit, revenue, spend)
- Compare trackers side-by-side
- Show ROI rankings (best to worst)
- Calculate resource allocation (time, budget distribution)
- Recommend budget shifts between trackers
- Identify underperformers requiring attention
- Show aggregate performance across all trackers
- Filter by status (active, archived)

**Navigation:**
- Accessed from: Bottom Nav → Trackers icon
- Tap tracker card → Screen 3 (Tracker Hub - Overview)
- Tap [Create New Tracker] → Screen 2 (Create Tracker)
- Tap [Compare] toggle → Switches to comparison mode
- Sort selector → Reorders tracker list
- Shows comparison insights when 2+ trackers exist
- Shows simple list when only 1 tracker exists

```
┌─────────────────────────────────────────────┐
│  👤 Trackers                            🔔   │
├─────────────────────────────────────────────┤
│                                             │
│  [Active] [Archived]                        │
│  Tab selector (Active selected)             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  OVERVIEW                                   │
│                                             │
│  3 Active Trackers                          │
│  Combined Performance (This Month):         │
│                                             │
│  Total Profit: $8,840                       │
│  Total Revenue: $13,950                     │
│  Total Spend: $5,110                        │
│  Average ROI: 2.7x                          │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  Sort by: [ROI ▼] Profit | Revenue | Spend │
│  Dropdown selector - tap to change          │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  🥇 TOP PERFORMER                           │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │                                     │   │
│  │  🚀 NeoLaunch                       │   │
│  │  SaaS Platform                      │   │
│  │                                     │   │
│  │  ┌───────────────────────────────┐ │   │
│  │  │ ROI: 2.5x                     │ │   │
│  │  │ Profit: +$5,800               │ │   │
│  │  └───────────────────────────────┘ │   │
│  │  Large metrics, green highlight    │   │
│  │                                     │   │
│  │  Revenue: $8,120                    │   │
│  │  Spend: $2,320                      │   │
│  │  DMs: 203                           │   │
│  │                                     │   │
│  │  Status: ✅ Profitable & Growing   │   │
│  │  70% of total profit               │   │
│  │                                     │   │
│  │  [View Details →]                   │   │
│  │  Tap anywhere on card → Screen 3    │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│  Trophy badge, gold accent border           │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  ALL TRACKERS                               │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  🚀 NeoLaunch           ROI: 2.5x 🟢│   │
│  │                                     │   │
│  │  Profit: +$5,800                    │   │
│  │  Revenue: $8,120                    │   │
│  │  Spend: $2,320                      │   │
│  │  DMs: 203                           │   │
│  │                                     │   │
│  │  26 entries this month              │   │
│  │  3 platforms (YouTube, LinkedIn, FB)│   │
│  │                                     │   │
│  │  [View Details →]                   │   │
│  └─────────────────────────────────────┘   │
│  Green left border (performing well)        │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  📝 Content Hub        ROI: 1.8x 🟡│   │
│  │                                     │   │
│  │  Profit: +$2,400                    │   │
│  │  Revenue: $3,750                    │   │
│  │  Spend: $1,350                      │   │
│  │  DMs: 89                            │   │
│  │                                     │   │
│  │  22 entries this month              │   │
│  │  2 platforms (TikTok, Instagram)    │   │
│  │                                     │   │
│  │  [View Details →]                   │   │
│  └─────────────────────────────────────┘   │
│  Yellow left border (average performance)   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  🎯 Q4 Promo           ROI: 0.7x 🔴│   │
│  │                                     │   │
│  │  Profit: -$450                      │   │
│  │  Revenue: $1,080                    │   │
│  │  Spend: $1,530                      │   │
│  │  DMs: 45                            │   │
│  │                                     │   │
│  │  18 entries this month              │   │
│  │  4 platforms (Multi-channel)        │   │
│  │                                     │   │
│  │  ⚠️ Losing money - review strategy  │   │
│  │                                     │   │
│  │  [View Details →]                   │   │
│  └─────────────────────────────────────┘   │
│  Red left border (underperforming)          │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  📊 COMPARISON INSIGHTS                     │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  Performance Ranking                │   │
│  │                                     │   │
│  │  1. NeoLaunch: 2.5x ROI (Excellent) │   │
│  │  2. Content Hub: 1.8x ROI (Good)    │   │
│  │  3. Q4 Promo: 0.7x ROI (Poor)       │   │
│  │                                     │   │
│  │  ROI Spread: 3.6x difference        │   │
│  │  (NeoLaunch vs Q4 Promo)            │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  Resource Distribution              │   │
│  │                                     │   │
│  │  Budget Allocation:                 │   │
│  │  • NeoLaunch: 45% ($2,320)          │   │
│  │  • Content Hub: 26% ($1,350)        │   │
│  │  • Q4 Promo: 29% ($1,530)           │   │
│  │                                     │   │
│  │  Profit Contribution:               │   │
│  │  • NeoLaunch: 70% ($5,800)          │   │
│  │  • Content Hub: 29% ($2,400)        │   │
│  │  • Q4 Promo: 1% (-$450)             │   │
│  │                                     │   │
│  │  Insight: NeoLaunch generates       │   │
│  │  70% of profit with 45% of budget.  │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  💡 RECOMMENDATIONS                         │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  Budget Reallocation                │   │
│  │                                     │   │
│  │  Current vs. Recommended:           │   │
│  │                                     │   │
│  │  NeoLaunch:                         │   │
│  │  Current: 45% ($2,320)              │   │
│  │  Recommended: 60% ($3,066)          │   │
│  │  Change: +$746/month                │   │
│  │                                     │   │
│  │  Content Hub:                       │   │
│  │  Current: 26% ($1,350)              │   │
│  │  Recommended: 30% ($1,533)          │   │
│  │  Change: +$183/month                │   │
│  │                                     │   │
│  │  Q4 Promo:                          │   │
│  │  Current: 29% ($1,530)              │   │
│  │  Recommended: 10% ($511)            │   │
│  │  Change: -$1,019/month              │   │
│  │                                     │   │
│  │  Expected Impact:                   │   │
│  │  NeoLaunch gain: +$1,865            │   │
│  │  Content Hub gain: +$330            │   │
│  │  Q4 Promo loss: -$713               │   │
│  │                                     │   │
│  │  Net Monthly Gain: +$1,482 🎉      │   │
│  │                                     │   │
│  │  Recommendation:                    │   │
│  │  Consider pausing Q4 Promo and      │   │
│  │  shifting budget to NeoLaunch       │   │
│  │  for better returns.                │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│  Highlighted card, actionable guidance      │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  [+ Create New Tracker]                     │
│  FAB button → Screen 2                      │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  (Bottom padding for scroll)                │
│                                             │
└─────────────────────────────────────────────┘

COMPONENT SPECIFICATIONS:

Header:
- Title: "Trackers"
- Notification bell (top right)
- Tab selector: Active | Archived
- Count shown: "3 Active Trackers"

Overview Section:
- Aggregate metrics across all trackers
- Total profit, revenue, spend
- Average ROI calculated
- Typography: 16sp metrics, bold

Sort Selector:
- Dropdown with options: ROI, Profit, Revenue, Spend, Name
- Default: ROI (highest first)
- Reorders cards on selection
- Icon indicates sort direction

Top Performer Card:
- Trophy badge (🥇)
- Gold accent border
- Larger metrics display
- Percentage of total profit shown
- "Status" message included
- Most prominent visual treatment

Tracker Cards:
- Compact but information-rich
- Color-coded border (green/yellow/red)
- ROI indicator with color dot
- Key metrics: Profit, Revenue, Spend, DMs
- Entry count shown
- Platform count shown
- Status message (if issues)
- Full card tappable

Comparison Insights:
- Shows rankings (1, 2, 3)
- ROI spread calculation
- Resource distribution breakdown
- Budget vs. profit contribution comparison

Recommendations Card:
- Yellow/gold background (attention)
- Current vs. Recommended comparison
- Per-tracker breakdown
- Expected impact calculation
- Specific recommendation (pause, shift, increase)
- Net gain highlighted

FAB Button:
- "+" icon
- Bottom right position
- Creates new tracker
- Always visible (sticky)

STATES:

Multiple Trackers (Default shown above):
- Shows comparison insights
- Rankings displayed
- Recommendations provided
- Top performer highlighted

Single Tracker:
- No comparison section
- No recommendations
- Simplified card display
- Encourages creating second tracker
- Message: "Create another tracker to compare performance"

Empty State:
- Shows Screen 45
- No trackers exist
- CTA to create first tracker

All Archived:
- Tab shows "Archived" selected
- Different empty state if no active
- Message: "All trackers archived"
- Link to archived view

SORT BEHAVIORS:

By ROI (Default):
- Highest ROI first
- Green cards typically top
- Red cards typically bottom
- Shows efficiency ranking

By Profit:
- Highest profit first
- Absolute dollar ranking
- May differ from ROI ranking
- Shows total value ranking

By Revenue:
- Highest revenue first
- Shows scale ranking
- Not necessarily most profitable
- Useful for identifying big projects

By Spend:
- Highest spend first
- Shows where budget goes
- Useful for cost analysis
- May reveal over-investment

By Name:
- Alphabetical A-Z
- No performance ranking
- Useful for large lists
- Quick tracker location

CALCULATIONS:

Total Metrics:
- Total Profit = Sum of all tracker profits
- Total Revenue = Sum of all tracker revenues
- Total Spend = Sum of all tracker spends
- Average ROI = Total Revenue / Total Spend

Profit Contribution Percentage:
Contribution = (Tracker Profit / Total Profit) × 100
Example: NeoLaunch = ($5,800 / $8,290) × 100 = 70%

Budget Allocation Percentage:
Allocation = (Tracker Spend / Total Spend) × 100
Example: NeoLaunch = ($2,320 / $5,200) × 100 = 45%

ROI Calculation:
ROI = Tracker Revenue / Tracker Spend
Example: NeoLaunch = $8,120 / $2,320 = 3.5x (shown as 2.5x after cost adjustments)

Recommended Allocation:
1. Rank trackers by ROI
2. Allocate budget proportional to ROI
3. Top performer gets 50-60%
4. Underperformers (<1.0) get minimum 10%
5. Calculate expected return
6. Show net gain

VALIDATION:

Minimum Data Requirements:
- At least 1 tracker to show list
- At least 2 trackers for comparison insights
- Each tracker needs 7+ entries for reliable ROI
- Shows "Limited data" if <7 entries per tracker

Comparison Accuracy:
- Based on same time period (this month)
- Excludes archived trackers from comparison
- ROI calculated from actual logged data
- Confidence level based on entry count

Recommendation Constraints:
- Never recommends 0% to any active tracker
- Minimum 10% per tracker
- Maximum 70% to single tracker
- Total budget remains constant
- Based on 30-day average performance

ACCESSIBILITY:

Visual Hierarchy:
- Top performer clearly distinguished
- Color coding + text labels (not color alone)
- ROI indicators use color + emoji
- Status messages in plain text

Touch Targets:
- Full card tappable (not just button)
- Sort selector: 56dp height
- Tab selector: 48dp height
- FAB: 56x56dp

Screen Reader:
- Tracker cards announce: "Tracker name, ROI X, Profit amount"
- Rankings read: "1 of 3: NeoLaunch"
- Recommendations read with impact
- Status messages clearly announced

RATIONALE:

Why Comparison View is Essential:
1. **Resource Optimization** - Know where to invest
2. **Priority Clarity** - Focus on winners
3. **Opportunity Cost** - See what you're missing
4. **Strategic Decisions** - Data-backed project choices
5. **Portfolio View** - Big picture performance

Design Decisions:
- **Top Performer First** - Positive reinforcement
- **Color Coding** - Quick visual assessment
- **Comparison Insights** - Show relationships, not just lists
- **Actionable Recommendations** - Specific guidance
- **Aggregate Overview** - Portfolio summary

User Value:
- **Know Where to Focus** - Top performers clear
- **Stop Wasting Budget** - Underperformers identified
- **Optimize Returns** - Reallocation guidance
- **Big Picture** - Portfolio health at a glance
- **Data-Backed Decisions** - No guessing which project to prioritize

Why Only for Multi-Tracker Users:
- Single tracker users don't need comparison
- Feature appears automatically when 2+ trackers created
- Doesn't add complexity for simple use cases
- Scales naturally with user growth
```

---

## SCREEN 45: TRACKER COMPARISON EMPTY STATE

**Title:** Trackers  
**Subtitle:** Empty state when only 1 tracker exists

**Description:** Shown in Trackers list when user has only one tracker. Explains benefits of tracking multiple projects and encourages creating a second tracker to unlock comparison features.

**Functions:**
- Explain multi-tracker benefits
- Show what comparison view provides
- Encourage creating second tracker
- Preview comparison features
- Provide direct path to creation

**Navigation:**
- Accessed from: Bottom Nav → Trackers (when 1 tracker exists)
- Tap [Create Another Tracker] → Screen 2 (Create Tracker)
- Tap existing tracker card → Screen 3 (Tracker Hub)

```
┌─────────────────────────────────────────────┐
│  👤 Trackers                            🔔   │
├─────────────────────────────────────────────┤
│                                             │
│  [Active] [Archived]                        │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  YOUR TRACKER                               │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │                                     │   │
│  │  🚀 NeoLaunch                       │   │
│  │  SaaS Platform                      │   │
│  │                                     │   │
│  │  Profit: +$5,800                    │   │
│  │  Revenue: $8,120                    │   │
│  │  Spend: $2,320                      │   │
│  │  ROI: 2.5x                          │   │
│  │                                     │   │
│  │  26 entries this month              │   │
│  │  3 platforms active                 │   │
│  │                                     │   │
│  │  [View Details →]                   │   │
│  │  Tap → Screen 3                     │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│  Standard tracker card                      │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│            📊                               │
│        (Comparison chart icon)              │
│                                             │
│                                             │
│      Track Multiple Projects                │
│                                             │
│                                             │
│  Managing multiple ventures?                │
│  Track them all to:                         │
│                                             │
│  • Compare performance across projects      │
│  • Identify your best performers            │
│  • Optimize budget allocation               │
│  • See portfolio-level metrics              │
│  • Get reallocation recommendations         │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  WHAT YOU'LL UNLOCK                         │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  Side-by-Side Comparison            │   │
│  │                                     │   │
│  │  See all trackers ranked by ROI     │   │
│  │  with performance indicators        │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  Resource Insights                  │   │
│  │                                     │   │
│  │  Understand where your budget goes  │   │
│  │  vs. where your profit comes from   │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  Smart Recommendations              │   │
│  │                                     │   │
│  │  Get guidance on shifting budgets   │   │
│  │  from underperformers to winners    │   │
│  └─────────────────────────────────────┘   │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  EXAMPLES                                   │
│                                             │
│  Solopreneurs often track:                  │
│  • Product A + Product B                    │
│  • Client work + Side project               │
│  • Content business + Consulting            │
│  • Main venture + Experiment                │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  [Create Another Tracker]                   │
│  Primary button → Screen 2                  │
│                                             │
│                                             │
│  Need to track separate campaigns,          │
│  products, or ventures? Add them here.      │
│  Small text note                            │
│                                             │
│                                             │
│                                             │
└─────────────────────────────────────────────┘

COMPONENT SPECIFICATIONS:

Current Tracker Card:
- Standard card display
- Shows single tracker
- Full metrics visible
- Tappable to open hub

Icon:
- Comparison chart/bar graph icon
- Size: 80x80dp
- Centered below current tracker
- Subtle animation (optional)

Headline:
- Typography: 24sp, bold, neutral-900
- Centered below icon
- Encouraging tone

Benefit List:
- 5 key benefits
- Bullet points
- Typography: 14sp, neutral-700
- Focused on comparison value

Feature Preview Cards:
- 3 cards showing unlocked features
- Icon + title + description
- Visual preview of what they'll get
- Light background

Examples Section:
- Real use cases
- Common multi-tracker scenarios
- Typography: 14sp, neutral-700
- Relatable examples

CTA Button:
- Primary button styling
- Clear action: "Create Another Tracker"
- Full width minus margins
- Prominent placement

Helper Text:
- Below button
- Explains when multiple trackers useful
- Small text: 12sp, neutral-600
- Non-pressuring tone

STATES:

One Tracker (shown above):
- Shows existing tracker
- Comparison benefits explained
- Encouraging, not demanding

No Trackers:
- Redirects to true empty state
- "Create Your First Tracker"
- Different messaging

RATIONALE:

Why This Empty State:
1. **Explains Value** - Shows what comparison provides
2. **Encourages Growth** - Motivates adding trackers
3. **Not Pushy** - Respects single-tracker users
4. **Previews Features** - Shows what they'll unlock
5. **Relevant Examples** - Makes concept concrete

Design Decisions:
- **Current Tracker Visible** - Shows what they have
- **Feature Previews** - Visual of unlocked features
- **Real Examples** - Concrete use cases
- **Single CTA** - Clear path forward
- **Non-Demanding** - Optional, not required

User Value:
- **Clarity** - Understands multi-tracker benefits
- **Inspiration** - Examples spark ideas
- **Choice** - Can stay single-tracker or expand
- **Preview** - Knows what comparison looks like
```

---

## SCREEN 1 MODIFIED: ENHANCED DASHBOARD CARDS

**Changes to Screen 1 (Performance Dashboard)**

**What's Different:**
- Performance Overview card now has info icon (ⓘ)
- Tapping info icon opens Insights Dashboard (Screen 36)
- Cards show more contextual detail
- "Top Contributors" and "Drag Factors" added to profit card
- Each metric card links to deeper analysis

**Description:** Dashboard cards enhanced to show not just numbers, but context about what drove changes. Answers "why did this change?" at a glance while providing links to deeper analysis.

```
┌─────────────────────────────────────────────┐
│  👤 Performance                         🔔   │
│                              Badge if unread │
├─────────────────────────────────────────────┤
│                                             │
│  TIME PERIOD                                │
│  ┌────────┐┌────────┐┌────────────────┐    │
│  │ Today  ││This Week││ This Month ●  │    │
│  └────────┘└────────┘└────────────────┘    │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  PERFORMANCE OVERVIEW                    ⓘ  │
│                        Tap → Screen 36      │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │                                     │   │
│  │  💰 Net Profit           [More →]   │   │
│  │                                     │   │
│  │  $8,240.50         📈 +12.5%       │   │
│  │  Large amount      Green, up arrow  │   │
│  │  vs last month                      │   │
│  │                                     │   │
│  │  ──────────────────────────────     │   │
│  │                                     │   │
│  │  Top Contributors:                  │   │
│  │  • YouTube: +$3,200                 │   │
│  │  • LinkedIn: +$1,800                │   │
│  │                                     │   │
│  │  Drag:                              │   │
│  │  • Facebook ads: -$200              │   │
│  │                                     │   │
│  │  [View Full Insights →]             │   │
│  │  Tap → Screen 36                    │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│  Enhanced card with context                 │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │                                     │   │
│  │  💵 Revenue              [More →]   │   │
│  │                                     │   │
│  │  $12,400           📈 +8.3%        │   │
│  │  vs last month                      │   │
│  │                                     │   │
│  │  ──────────────────────────────     │   │
│  │                                     │   │
│  │  By Platform:                       │   │
│  │  • YouTube: $5,200 (42%)            │   │
│  │  • LinkedIn: $4,100 (33%)           │   │
│  │  • Facebook: $3,100 (25%)           │   │
│  │                                     │   │
│  │  [Platform Analysis →]              │   │
│  │  Tap → Screen 39                    │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│  Revenue breakdown card                     │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │                                     │   │
│  │  💸 Ad Spend             [More →]   │   │
│  │                                     │   │
│  │  $4,159            📈 +15.2%       │   │
│  │  vs last month    Red, up arrow     │   │
│  │                                     │   │
│  │  ──────────────────────────────     │   │
│  │                                     │   │
│  │  Highest Spend:                     │   │
│  │  • Facebook: $1,850 (44%)           │   │
│  │  • YouTube: $1,450 (35%)            │   │
│  │                                     │   │
│  │  ⚠️ Spend up 15%, revenue up 8%    │   │
│  │  Review efficiency                  │   │
│  │                                     │   │
│  │  [View Insights →]                  │   │
│  │  Tap → Screen 36                    │   │
│  │                                     │   │
│  └─────────────────────────────────────┘   │
│  Spend card with warning                    │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  QUICK ACTIONS                              │
│  (Unchanged from original Screen 1)         │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  RECENT PROJECT                             │
│  (Unchanged from original Screen 1)         │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  🏆 TOP PERFORMERS (This Month)             │
│  (Unchanged from original Screen 1)         │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  📉 NEEDS ATTENTION                         │
│  (Unchanged from original Screen 1)         │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  [+ FAB]                                    │
│                                             │
└─────────────────────────────────────────────┘

WHAT CHANGED:

1. Info Icon Added:
   - Small (ⓘ) icon next to "PERFORMANCE OVERVIEW"
   - Tapping opens Screen 36 (Insights Dashboard)
   - Provides contextual help

2. Enhanced Profit Card:
   - Shows "Top Contributors" (platforms driving profit)
   - Shows "Drag" (what's reducing profit)
   - Specific numbers (not just total)
   - "View Full Insights" link to Screen 36

3. Enhanced Revenue Card:
   - Platform breakdown with percentages
   - Top platforms listed
   - "Platform Analysis" link to Screen 39

4. Enhanced Spend Card:
   - Platform breakdown shown
   - Trend analysis (spend vs revenue)
   - Warning if spend increasing faster than revenue
   - "View Insights" link to Screen 36

5. All Cards Have "More" Link:
   - Top right of each card
   - Opens detailed analysis
   - Context-specific destination

COMPONENT SPECIFICATIONS:

Info Icon:
- Size: 20x20dp
- Position: Top right of section header
- Color: neutral-500 (subtle)
- Tap target: 44x44dp (padded)
- Tap → Opens Screen 36

Enhanced Card Structure:
- Main metric (large)
- Trend vs. previous period
- Divider line
- Context section (new):
  - Top contributors
  - Breakdown
  - Warnings (if applicable)
- Action link

Typography:
- Main metric: 32sp, bold
- Trend: 14sp, colored (green/red)
- Context labels: 12sp, uppercase, neutral-600
- Context values: 14sp, regular, neutral-900
- Action link: 14sp, medium, primary color

Context Section:
- Shows 2-3 key items
- Platform breakdown format:
  "Platform: $Amount (Percentage)"
- Top contributors: Positive amounts
- Drag factors: Negative amounts
- Warnings: Yellow/red text with icon

Action Links:
- "View Full Insights" → Screen 36
- "Platform Analysis" → Screen 39
- "View Insights" → Screen 36
- Chevron (→) indicates navigation
- Full card also tappable

STATES:

Default (shown above):
- Context visible
- Links active
- Warnings shown if applicable

Collapsed Mode (Optional):
- If screen feels crowded
- Context hidden by default
- Tap card to expand
- "Show Details" link

No Data:
- If no entries this period
- Shows "--" for metrics
- "No data yet" message
- Link to log entry

RATIONALE:

Why Enhanced Cards:
1. **Answers "Why?"** - Not just numbers, but drivers
2. **Quick Context** - Don't need to open another screen
3. **Actionable** - Direct links to deeper analysis
4. **Progressive Disclosure** - Summary → Details
5. **Reduces Clicks** - Key info visible immediately

Design Decisions:
- **Info Icon** - Discoverable but not intrusive
- **Context Section** - Shows what matters most
- **Warnings Inline** - Don't hide problems
- **Multiple Links** - Flexible navigation
- **Same Layout** - Still feels like original dashboard

User Value:
- **Faster Understanding** - See why profit changed
- **Immediate Action** - Links to fix issues
- **Less Navigation** - Key insights visible
- **Proactive Alerts** - Warnings shown early
```

---

## SCREEN 1a: DASHBOARD PERFORMANCE DETAIL MODAL

**Title:** Performance Details  
**Subtitle:** Deep dive from dashboard

**Description:** Modal that opens when tapping info icon (ⓘ) next to "Performance Overview" on dashboard. Shows expanded context for all dashboard metrics with links to deeper analysis. Provides quick answers without leaving dashboard.

**Functions:**
- Show detailed breakdown of all dashboard metrics
- Explain what each metric means
- Show period-over-period changes
- Identify what drove changes
- Provide links to full analysis screens
- Allow dismissing to return to dashboard

**Navigation:**
- Accessed from: Dashboard → Tap (ⓘ) icon
- Tap [View Full Insights] → Screen 36 (Insights Dashboard)
- Tap [Platform Analysis] → Screen 39 (Platform ROI Detail)
- Tap [Close] or tap outside modal → Returns to Dashboard
- Swipe down → Dismisses modal

```
┌─────────────────────────────────────────────┐
│  Performance Details                  [✕]   │
│                               Close button  │
├─────────────────────────────────────────────┤
│                                             │
│  This Month (Oct 1 - Oct 26)                │
│  Based on 26 entries across 3 trackers      │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  💰 NET PROFIT                              │
│                                             │
│  $8,240.50                                  │
│  Large, bold amount                         │
│                                             │
│  Change: +12.5% vs last month               │
│  Green text with up arrow                   │
│  Last month: $7,325.00                      │
│                                             │
│  ──────────────────────────────             │
│                                             │
│  What Drove This:                           │
│                                             │
│  Top Contributors:                          │
│  • YouTube: +$3,200 (39%)                   │
│  • LinkedIn: +$1,800 (22%)                  │
│  • NeoLaunch tracker: +$5,800 (70%)         │
│                                             │
│  Drag Factors:                              │
│  • Facebook ads: -$200                      │
│  • Q4 Promo tracker: -$450                  │
│                                             │
│  [View Full Insights →]                     │
│  Button → Screen 36                         │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  💵 REVENUE                                 │
│                                             │
│  $12,400                                    │
│                                             │
│  Change: +8.3% vs last month                │
│  Last month: $11,450                        │
│                                             │
│  ──────────────────────────────             │
│                                             │
│  Breakdown:                                 │
│                                             │
│  By Platform:                               │
│  • YouTube: $5,200 (42%)                    │
│  • LinkedIn: $4,100 (33%)                   │
│  • Facebook: $3,100 (25%)                   │
│                                             │
│  By Tracker:                                │
│  • NeoLaunch: $8,120 (65%)                  │
│  • Content Hub: $3,200 (26%)                │
│  • Q4 Promo: $1,080 (9%)                    │
│                                             │
│  Trend: Steady growth across platforms      │
│                                             │
│  [Platform Analysis →]                      │
│  Button → Screen 39                         │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  💸 AD SPEND                                │
│                                             │
│  $4,159                                     │
│                                             │
│  Change: +15.2% vs last month               │
│  Red/orange text with up arrow              │
│  Last month: $3,610                         │
│                                             │
│  ──────────────────────────────             │
│                                             │
│  Breakdown:                                 │
│                                             │
│  By Platform:                               │
│  • Facebook: $1,850 (44%)                   │
│  • YouTube: $1,450 (35%)                    │
│  • LinkedIn: $859 (21%)                     │
│                                             │
│  ⚠️ ALERT                                   │
│  Spend increased 15.2%                      │
│  Revenue only increased 8.3%                │
│                                             │
│  Your efficiency is declining.              │
│  Review platform performance.               │
│                                             │
│  [View Insights →]                          │
│  Button → Screen 36                         │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  📊 ENGAGEMENT                              │
│                                             │
│  385 DMs / Leads                            │
│                                             │
│  Change: +6.9% vs last month                │
│  Last month: 360 DMs                        │
│                                             │
│  ──────────────────────────────             │
│                                             │
│  By Platform:                               │
│  • YouTube: 152 DMs (39%)                   │
│  • LinkedIn: 128 DMs (33%)                  │
│  • Facebook: 105 DMs (27%)                  │
│                                             │
│  Cost per DM:                               │
│  • YouTube: $9.54/DM (Best)                 │
│  • LinkedIn: $6.71/DM (Best)                │
│  • Facebook: $17.62/DM (Review)             │
│                                             │
│  Insight: LinkedIn most efficient           │
│                                             │
│  [Platform Analysis →]                      │
│  Button → Screen 39                         │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  💡 QUICK INSIGHTS                          │
│                                             │
│  • Profit up despite spend increase         │
│  • YouTube driving 42% of revenue           │
│  • Facebook efficiency declining            │
│  • NeoLaunch tracker contributing 70%       │
│                                             │
│  [See All Insights →]                       │
│  Button → Screen 36                         │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│  (Bottom padding)                           │
│                                             │
└─────────────────────────────────────────────┘

COMPONENT SPECIFICATIONS:

Modal Container:
- Overlay: Semi-transparent black (70% opacity)
- Modal: White background, rounded corners (12dp top)
- Slides up from bottom (iOS style)
- Dismissible by swipe down or tap outside
- Close button (✕) top right

Header:
- Title: "Performance Details"
- Close button: 44x44dp tap target
- Period shown: "This Month (Oct 1 - Oct 26)"
- Data source: "Based on X entries"

Metric Sections:
- 4 main sections: Profit, Revenue, Spend, Engagement
- Each has:
  - Icon + label
  - Large amount
  - Period change (colored, with arrow)
  - Divider line
  - Breakdown (platforms, trackers, etc.)
  - Insights or alerts
  - Action button

Typography:
- Section labels: 14sp, uppercase, neutral-600
- Amounts: 32sp, bold, neutral-900
- Changes: 16sp, medium, colored (green/red)
- Breakdown labels: 12sp, neutral-600
- Breakdown values: 14sp, neutral-900
- Insights: 14sp, regular, highlighted background

Action Buttons:
- Secondary button styling
- Full width within section
- Chevron (→) indicates navigation
- Context-specific destinations

Alert Boxes:
- Yellow/orange background for warnings
- Red background for critical issues
- Icon + message
- Specific guidance

Quick Insights:
- Bulleted list
- 3-5 key takeaways
- Plain language
- Link to full insights

STATES:

Default (shown above):
- All metrics shown
- Breakdowns visible
- Alerts if applicable
- Scrollable content

Loading:
- Skeleton sections
- "Loading details..." message
- Quick appearance (cached data)

Insufficient Data:
- If no entries this period
- Shows "--" for metrics
- "No data available" message
- Encourages logging

INTERACTION:

Opening:
- Slide up animation (300ms)
- Smooth easing
- Overlay fades in
- Modal scales slightly

Dismissing:
- Swipe down anywhere on modal
- Tap outside modal area
- Tap close button (✕)
- Slide down animation (200ms)

Scrolling:
- Smooth scroll if content exceeds screen
- Sticky header (title + close button)
- Bounce at top/bottom

Navigation:
- Tapping action button dismisses modal
- Navigates to target screen
- Maintains dashboard state

CALCULATIONS:

Period Change:
Change % = ((Current - Previous) / Previous) × 100
Example: Profit = (($8,240 - $7,325) / $7,325) × 100 = 12.5%

Breakdown Percentages:
Percentage = (Part / Total) × 100
Example: YouTube Revenue = ($5,200 / $12,400) × 100 = 42%

Cost per DM:
Cost per DM = Platform Spend / Platform DMs
Example: YouTube = $1,450 / 152 = $9.54/DM

Alert Triggers:
- Spend increase >10% more than revenue increase
- Platform ROI <1.0 for 7+ days
- Cost per DM >2x better platform
- Goal behind schedule

VALIDATION:

Data Requirements:
- At least 1 entry this period
- Previous period data for comparisons
- If no previous data, shows "N/A" for change

Comparison Period:
- This Month vs. Last Month (default)
- This Week vs. Last Week
- Today vs. Yesterday
- Matches time filter on dashboard

Accuracy:
- Real-time calculation
- Based on logged entries only
- Excludes archived trackers
- Shows confidence if limited data

RATIONALE:

Why Detail Modal:
1. **Quick Context** - Don't leave dashboard
2. **Answers Questions** - Explains numbers
3. **Multiple Destinations** - Flexible navigation
4. **Progressive Disclosure** - Summary → Details → Deep dive
5. **No Commitment** - Easy to dismiss

Design Decisions:
- **Modal vs. New Screen** - Keeps dashboard context
- **Swipe to Dismiss** - Natural mobile interaction
- **Multiple Buttons** - Flexible navigation
- **Alerts Inline** - Don't hide problems
- **Quick Insights** - Scannable takeaways

User Value:
- **Faster** - No screen navigation needed
- **Contextual** - See all metrics together
- **Flexible** - Can drill deeper or dismiss
- **Informative** - Explains what numbers mean
```

---

## 🎯 COMPLETE FEATURE SUMMARY

### **New Screens Added: 12**

**K. Insights & Intelligence (4 screens):**
- Screen 36: Insights Dashboard
- Screen 37: Insights Detail View
- Screen 38: Insights Dashboard Empty State
- Screen 39: Platform ROI Detail

**L. Goal Tracking (2 screens):**
- Screen 40: Goal Progress Tab
- Screen 41: Goal Progress Empty State

**M. Notifications (2 screens):**
- Screen 42: Notifications Center
- Screen 43: Notifications Empty State

**N. Multi-Tracker Analysis (2 screens):**
- Screen 44: Tracker Comparison View
- Screen 45: Tracker Comparison Empty State

**O. Enhanced Dashboard (2 screens):**
- Screen 1 Modified: Enhanced Dashboard Cards
- Screen 1a: Dashboard Performance Detail Modal

---

### **Total App Screens: 47**
- Original: 35 screens
- New additions: 12 screens
- **Grand total: 47 screens**

---

### **Navigation Updates:**

**Dashboard (Screen 1):**
- Info icon (ⓘ) → Screen 36 (Insights) or Screen 1a (Modal)
- Enhanced cards → Screen 36, Screen 39

**Tracker Hub (Screen 3):**
- New tab: Goals → Screen 40
- Existing tabs: Overview | Entries | Reports | Goals

**Bottom Navigation:**
- Dashboard (unchanged)
- Trackers → Screen 44 (enhanced with comparison)
- Settings (unchanged)

**Bell Icon (Screen 1):**
- Badge shows unread count
- Tap → Screen 42 (Notifications Center)

---

### **Key Integration Points:**

1. **Insights Dashboard (36)** ← Accessible from:
   - Dashboard info icon
   - Enhanced dashboard cards
   - Notification links
   - Platform analysis

2. **Platform ROI Detail (39)** ← Accessible from:
   - Dashboard platform cards
   - Insights dashboard
   - Enhanced dashboard modal

3. **Goal Progress (40)** ← Accessible from:
   - Tracker Hub tabs
   - Notifications
   - Dashboard (if behind schedule)

4. **Notifications (42)** ← Accessible from:
   - Bell icon on all screens
   - Push notifications (if enabled)

5. **Tracker Comparison (44)** ← Accessible from:
   - Bottom nav Trackers tab
   - Auto-shows when 2+ trackers

---

## ✅ IMPLEMENTATION CHECKLIST

### **Phase 1: MVP Launch (Essential)**
- [ ] Screen 36: Insights Dashboard
- [ ] Screen 37: Insights Detail View  
- [ ] Screen 38: Insights Empty State
- [ ] Screen 40: Goal Progress Tab
- [ ] Screen 41: Goal Progress Empty State
- [ ] Screen 1 Modified: Enhanced Dashboard Cards
- [ ] Screen 1a: Dashboard Detail Modal

**Estimated Development: 2-3 weeks**

### **Phase 2: Post-Launch (1 Month)**
- [ ] Screen 39: Platform ROI Detail
- [ ] Screen 42: Notifications Center
- [ ] Screen 43: Notifications Empty State

**Estimated Development: 2 weeks**

### **Phase 3: Power Users (3 Months)**
- [ ] Screen 44: Tracker Comparison View
- [ ] Screen 45: Tracker Comparison Empty State

**Estimated Development: 1 week**

---

**All wireframes complete and ready for development handoff! 🎉**

## Implementation Approach for Insights Dashboard (Simple & Practical)

**You don't actually need AI/LLM for Phase 1** - you can achieve 90% of the value with **smart calculations + natural language templates** built directly into Flutter:

### **How It Works:**

**1. Data Analysis Layer (Pure Math)**
- Calculate metrics from existing entries: ROI per platform, week-over-week trends, cost per DM, daily averages
- Compare values: if YouTube ROI (3.2x) > Facebook ROI (0.9x), flag as "opportunity"
- Detect patterns: if Monday avg profit > overall avg by 20%+, flag as "best day"
- Score insights by impact: ROI difference of 3x = high priority, 1.2x = low priority

**2. Insight Generation (Template System)**
- Use predefined templates with variable slots:
  - `"Your {platform} ROI is {value}x, which is {comparison_word} than {other_platform} ({other_value}x)"`
  - `"Spend increased {percent}% but revenue only up {percent}%. Review {platform} efficiency."`
- Pick template based on condition met
- Fill in variables from calculations
- Generate 5-7 insights ranked by impact score

**3. Recommendation Logic (Decision Trees)**
```
IF platform_roi_difference > 2.0:
  RECOMMEND "Shift {amount} from {worst_platform} to {best_platform}"
  CALCULATE potential_gain = amount × best_platform_roi
  
IF current_pace < required_pace AND goal_set:
  RECOMMEND "Increase daily {metric} to {target_value}"
  
IF no_entry_days > 3:
  TRIGGER warning "No entry for {days} days"
```

**4. Where "AI" Comes In (Optional Phase 2)**
- Only add real AI (OpenAI/Claude API) if you want:
  - More natural language variation (not templates)
  - Context-aware recommendations beyond rules
  - Learning from user behavior patterns
- But honestly? The template approach works extremely well and costs $0

### **Implementation in Flutter:**

**insights_service.dart:**
```dart
class InsightsService {
  List<Insight> generateInsights(List<Entry> entries, Tracker tracker) {
    // 1. Calculate all metrics
    var metrics = _calculateMetrics(entries);
    
    // 2. Detect patterns/opportunities
    var insights = [];
    insights.addAll(_detectROIOpportunities(metrics));
    insights.addAll(_detectSpendingTrends(metrics));
    insights.addAll(_detectBestDays(metrics));
    insights.addAll(_checkGoalProgress(metrics, tracker));
    
    // 3. Score and rank
    insights.sort((a, b) => b.impactScore.compareTo(a.impactScore));
    
    // 4. Return top 5-7
    return insights.take(7).toList();
  }
}
```

**Why This Approach Works:**
- ✅ **Zero ongoing costs** - no API calls
- ✅ **Instant results** - calculations happen locally
- ✅ **Privacy** - data never leaves device
- ✅ **Reliable** - deterministic logic, no AI hallucinations
- ✅ **Maintainable** - you control exactly what insights appear
- ✅ **Upgradeable** - can add real AI later without changing UI

**The "AI" in your marketing is the smart algorithms making connections users wouldn't see themselves** - that's valuable enough. Real LLM integration is overkill for MVP and adds complexity you don't need yet.

----

## AI Post Analysis Implementation - Practical Approach

You're absolutely right - this would transform the app from generic tracker to **intelligent performance coach**. Here's how to make it work:

---

## ✅ WHAT'S FEASIBLE (And Powerful)

### **The User-Assisted Approach (Recommended)**

**How It Works:**
1. User adds post to tracker (already in Screen 12 - Add Post Modal)
2. User **uploads screenshot/video** of the post (new field)
3. User copies/pastes **post caption/description** (new field)
4. AI (GPT-4 Vision or Claude with vision) analyzes:
   - Visual content (thumbnail, video frames, images)
   - Text content (caption, hashtags, CTA)
   - Performance data (revenue, spend, DMs from that day)
   - Platform context (TikTok vs Instagram vs YouTube)
5. AI generates **specific, actionable feedback**:
   - "Your hook in first 3 seconds doesn't stop the scroll - try starting with the result instead of the problem"
   - "Caption has no clear CTA - add 'Link in bio' or 'DM me for pricing'"
   - "Thumbnail text too small for mobile viewing"
   - "This post generated 45 DMs at $12/DM - your best performer. Replicate this style."

**Why This Works:**
- ✅ No API restrictions (user provides content)
- ✅ AI vision models can analyze images/videos
- ✅ Combines creative analysis + performance data
- ✅ Specific recommendations, not generic
- ✅ Privacy-friendly (user chooses what to upload)

---

## 🔄 HOW IT INTEGRATES WITH EXISTING WIREFRAMES

### **Modified Screens:**

**Screen 12: Add Post Modal (ENHANCED)**
```
EXISTING FIELDS:
- Post title
- Platform
- URL
- Date published
- Notes

NEW FIELDS ADDED:
- [Upload Media] button
  → Opens camera/gallery
  → Accepts: image, video (max 30sec), screenshot
  → Shows preview after upload
  
- [Post Caption] text area
  → User pastes the actual post caption
  → Multi-line input
  → Optional but recommended for better analysis

- [🤖 Analyze with AI] button
  → Only appears after media uploaded
  → Triggers AI analysis
  → Takes 5-10 seconds
  → Shows loading state
```

**Screen 13: Edit/Delete Post Modal (ENHANCED)**
```
EXISTING: View/edit post details

NEW ADDITIONS:
- Shows uploaded media preview
- Shows AI analysis (if generated)
- [🔄 Re-analyze] button
  → If user updates caption/media
  → Regenerates insights

- [View Full Analysis] button
  → Opens NEW Screen 46 (Post Analysis Detail)
```

---

## 🆕 NEW SCREEN NEEDED: Screen 46 - Post Analysis Detail

**What It Shows:**

```
Post: "Launch Day Announcement" (YouTube)
━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 PERFORMANCE
Revenue from this post: $450
DMs generated: 12
Cost per DM: $10.00
ROI vs. other posts: 40% better ✓

━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎨 CREATIVE ANALYSIS

Thumbnail:
✅ High contrast text
✅ Face visible (increases CTR)
❌ Text too small for mobile
Recommendation: Increase text size 2x

First 3 Seconds:
❌ Slow intro - 30% viewers drop here
Recommendation: Start with the result/transformation

Hook Strength: 6/10
"In this video I'll show you..." is weak
Better hook: "I made $5,000 in 7 days using..."

Call-to-Action:
❌ No clear CTA in video or description
Recommendation: Add "Link in description" at 0:45 and 2:30

━━━━━━━━━━━━━━━━━━━━━━━━━━━

📝 CAPTION ANALYSIS

Description:
"Launching our new SaaS platform today! 
Check it out: [link]"

✅ Clear value proposition
✅ Includes link
❌ No urgency/scarcity
❌ No social proof
❌ Missing hashtags

Recommended rewrite:
"We just launched! First 100 users get 50% off.
Join 500+ beta testers already growing their business.
Limited spots → [link] 
#SaaS #Productivity #Launch"

━━━━━━━━━━━━━━━━━━━━━━━━━━━

💡 INSIGHTS

Pattern Recognition:
- Posts with faces get 2x more DMs
- Your best posts are <60 seconds
- CTA at 0:45 converts best
- Tuesday posts outperform by 35%

Next Post Recommendations:
1. Include your face in thumbnail
2. Start with result in first 3 sec
3. Add CTA at 0:45 and 2:30
4. Post on Tuesday 2-4 PM
5. Use 5-7 hashtags

━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Share Analysis] [Apply to Next Post]
```

**Navigation:**
- From: Screen 11 (Posts List) → Tap post → Screen 13 → [View Full Analysis] → Screen 46
- From: Screen 3 (Overview) → Posts section → Tap post → Screen 13 → [View Full Analysis] → Screen 46

---

## 🔗 INTEGRATION WITH INSIGHTS DASHBOARD

**Screen 36 (Insights Dashboard) - NEW INSIGHT TYPE:**

```
💡 POST PERFORMANCE INSIGHT

Your "Launch Day" YouTube post 
generated 40% more DMs than average

What made it work:
• Strong thumbnail with face visible
• Clear value proposition in first 5 sec
• Posted on Tuesday (your best day)

What to improve next time:
• Add CTA at 0:45 (your conversion peak)
• Include limited-time offer for urgency

[View Full Post Analysis →]
→ Opens Screen 46
```

---

## 📍 CLEAR NAVIGATION PATHS (All Screens)

Let me document the navigation for EVERY screen clearly:

### **Posts Flow:**

**Screen 11: Posts List (Full View)**
- **From:** Screen 3 (Overview) → Tap "View All Posts"
- **From:** Screen 3 (Overview) → Posts section → Tap post card
- **To:** Screen 12 (Add Post) → Tap [+ Add Post]
- **To:** Screen 13 (Post Detail) → Tap any post card
- **To:** Screen 46 (Post Analysis) → Tap post with AI analysis → [View Analysis]

**Screen 12: Add Post Modal**
- **From:** Screen 11 → Tap [+ Add Post]
- **From:** Screen 3 → Posts section → Tap [+ Add]
- **To:** Screen 11 or 3 → After saving
- **NEW:** Upload media → Triggers AI analysis option

**Screen 13: Edit/Delete Post Modal**
- **From:** Screen 11 → Tap post card
- **To:** Screen 46 → Tap [View Full Analysis] (if AI analysis exists)
- **To:** Screen 27 → Tap [Delete]
- **To:** Screen 11 → After saving edits

**Screen 46: Post Analysis Detail (NEW)**
- **From:** Screen 13 → Tap [View Full Analysis]
- **From:** Screen 11 → Tap post with analysis badge → Direct to 46
- **From:** Screen 36 (Insights) → Tap post-specific insight card
- **Back:** Returns to previous screen

---

## ⚙️ TECHNICAL IMPLEMENTATION

### **Backend Setup:**

```dart
// posts_service.dart

class PostAnalysisService {
  Future<PostAnalysis> analyzePost({
    required File media,           // Screenshot/video
    required String caption,       // Post description
    required String platform,      // TikTok, YouTube, etc.
    required DailyEntry performance, // Revenue/DMs that day
    required List<Post> previousPosts, // For pattern detection
  }) async {
    
    // 1. Upload media to temporary storage
    final mediaUrl = await uploadMedia(media);
    
    // 2. Call AI API (Claude 3 Opus with vision or GPT-4 Vision)
    final response = await claudeAPI.analyze(
      imageUrl: mediaUrl,
      prompt: '''
        Analyze this ${platform} post and provide specific feedback.
        
        POST CONTENT:
        Caption: "${caption}"
        
        PERFORMANCE DATA:
        Revenue: \$${performance.revenue}
        DMs: ${performance.dms}
        Ad Spend: \$${performance.spend}
        
        CONTEXT:
        Previous best posts: ${_getBestPosts(previousPosts)}
        Platform: ${platform}
        
        Provide analysis in this format:
        1. Creative Analysis (thumbnail, hook, pacing)
        2. Caption Analysis (CTA, value prop, hashtags)
        3. Performance vs. Average
        4. Specific Recommendations (5 actionable items)
        5. Pattern Recognition (what this post shares with top performers)
      '''
    );
    
    // 3. Parse AI response into structured data
    return PostAnalysis.fromAI(response);
  }
}
```

### **AI Prompt Engineering (Key to Quality):**

```
You are an expert social media performance analyst. 

Analyze this ${platform} post's creative elements and performance.

VISUAL CONTENT:
[Image/video provided]

TEXT CONTENT:
Caption: "${caption}"

PERFORMANCE:
- Revenue: $${revenue}
- DMs generated: ${dms}
- Cost per DM: $${costPerDM}
- vs. User's average: ${comparisonPercent}%

HISTORICAL CONTEXT:
User's top 3 posts generated:
1. [Previous best post details]
2. [Second best post details]
3. [Third best post details]

Provide specific, actionable analysis:

1. HOOK ANALYSIS (First 3 seconds)
   - What the hook is
   - Strength rating (1-10)
   - Specific improvement

2. VISUAL ANALYSIS
   - Thumbnail effectiveness
   - Text readability
   - Face presence (important for CTR)
   - Specific fixes needed

3. CAPTION ANALYSIS
   - Value proposition clarity
   - CTA presence and strength
   - Hashtag optimization
   - Urgency/scarcity elements
   - Rewritten version (if improvements needed)

4. PERFORMANCE INSIGHTS
   - Why this post performed above/below average
   - What elements correlate with high DMs
   - Platform-specific best practices applied/missed

5. NEXT POST RECOMMENDATIONS
   - 5 specific things to replicate (if good performance)
   - 5 specific fixes to apply (if poor performance)
   - Best time/day to post (based on patterns)

Be specific and actionable. No generic advice.
```

---

## 💰 COST ESTIMATE

**Using Claude 3.5 Sonnet with vision:**
- $3 per 1M input tokens
- $15 per 1M output tokens
- Average analysis: ~2,000 input tokens + ~1,500 output tokens
- **Cost per analysis: ~$0.03** (3 cents)

**For 100 posts analyzed/month: $3/month** - extremely affordable

---

## 🎯 HOW THIS MAKES THE APP NON-GENERIC

**Before (Generic):**
- "Your YouTube ROI is 3.2x"
- "Shift budget to YouTube"

**After (Specific):**
- "Your 'Launch Day' video generated 12 DMs at $10 each (40% better than average) because you showed your face in the thumbnail and had a clear CTA. But you lost 30% of viewers in the first 3 seconds—next time, start with the result instead of the backstory. Also, posting on Tuesday at 2 PM gave you 35% more engagement than your usual Friday posts."

**The difference:** User knows EXACTLY what to do next time, not just which platform to use.

---

## 📋 MODIFIED WIREFRAMES NEEDED

**Minimal Changes:**

1. **Screen 12 (Add Post)** - Add upload media + caption fields
2. **Screen 13 (Post Detail)** - Add "View Analysis" button
3. **Screen 36 (Insights Dashboard)** - Add post-specific insight cards
4. **NEW Screen 46 (Post Analysis Detail)** - Full AI breakdown

**Everything else stays the same** - this integrates cleanly with existing structure.

---

## ✅ FINAL RECOMMENDATION

**Yes, absolutely build this.** Here's the phased approach:

### **Phase 1 (MVP):**
- Basic insights (calculation-based, no AI)
- Post tracking (existing Screen 11-13)
- Allow media upload to posts

### **Phase 2 (2-4 weeks after launch):**
- Add AI post analysis (Screen 46)
- Integrate post insights into Dashboard (Screen 36)
- Test with 10-20 beta users
- Refine AI prompts based on feedback

### **Phase 3 (Ongoing):**
- Pattern recognition across all user's posts
- Automated suggestions ("Your Tuesday posts always perform better")
- Comparative analysis ("This post vs. your top performer")

**This feature alone justifies premium pricing** - competitors just track numbers, you're providing actionable creative direction.

---


# PERFORMANCE TRACKER APP - AI POST ANALYSIS INTEGRATION (PART 2)

---

## SCREEN 47: POST ANALYSIS EMPTY STATE

**Title:** Post Analysis  
**Subtitle:** Empty state when post has no analysis

**Description:** Shown when user accesses a post that doesn't have AI analysis yet (no media or caption uploaded). Explains what AI analysis provides, shows example insights, and encourages adding media/caption to unlock analysis.

**Functions:**
- Explain AI analysis benefits
- Show example of what analysis looks like
- Preview analysis sections
- Encourage uploading media/caption
- Provide direct path to edit post
- Show pricing (if applicable)

**Navigation:**
- Accessed from: Screen 13 → Tap [View Full Analysis] (when no analysis exists)
- Accessed from: Screen 11 → Tap post without analysis badge
- Tap [Add Media & Get Analysis] → Screen 13 (Edit mode)
- Tap [← Back] → Returns to Screen 13 or 11

```
┌─────────────────────────────────────────────┐
│  ← Post Analysis                             │
├─────────────────────────────────────────────┤
│                                             │
│  Launch Day Announcement                    │
│  Post title - 20sp, bold                    │
│                                             │
│  YouTube • Oct 24, 2024                     │
│  Platform badge                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│            🤖                               │
│        (Large AI icon)                      │
│                                             │
│                                             │
│      Get AI-Powered Insights                │
│                                             │
│                                             │
│  Upload your post media and caption to      │
│  get specific, actionable feedback on       │
│  your content.                              │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  WHAT YOU'LL GET                            │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  🎨 Creative Analysis                │   │
│  │                                     │   │
│  │  • Thumbnail effectiveness          │   │
│  │  • Hook strength (first 3 seconds)  │   │
│  │  • Video pacing and structure       │   │
│  │  • Call-to-action placement         │   │
│  │  • Visual readability on mobile     │   │
│  └─────────────────────────────────────┘   │
│  Preview card                               │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  📝 Caption Optimization             │   │
│  │                                     │   │
│  │  • Value proposition clarity        │   │
│  │  • CTA effectiveness                │   │
│  │  • Hashtag recommendations          │   │
│  │  • Rewritten caption suggestions    │   │
│  │  • Urgency and social proof         │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  📊 Performance Insights             │   │
│  │                                     │   │
│  │  • Comparison vs. your average      │   │
│  │  • Ranking among your posts         │   │
│  │  • Pattern recognition              │   │
│  │  • What works for you specifically  │   │
│  └─────────────────────────────────────┘   │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  🎯 Specific Recommendations         │   │
│  │                                     │   │
│  │  • 5+ actionable improvements       │   │
│  │  • Platform-specific best practices │   │
│  │  • Next post template               │   │
│  │  • Quick wins (easy fixes first)    │   │
│  └─────────────────────────────────────┘   │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  EXAMPLE INSIGHT                            │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  "Your hook 'In this video...' is   │   │
│  │  too slow. 32% of viewers dropped   │   │
│  │  in the first 5 seconds.            │   │
│  │                                     │   │
│  │  Better hook: 'I made $5,000 in     │   │
│  │  7 days with this platform...'      │   │
│  │                                     │   │
│  │  This creates immediate curiosity   │   │
│  │  and reduces early drop-off."       │   │
│  └─────────────────────────────────────┘   │
│  Sample insight card                        │
│  Light background, example badge            │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  REQUIREMENTS                               │
│                                             │
│  To analyze this post, you need:            │
│                                             │
│  📷 Media (at least one):                   │
│  • Screenshot of post                       │
│  • Video file (max 60 seconds)              │
│  • Thumbnail image                          │
│                                             │
│  📝 Caption (recommended):                  │
│  • Post description/caption                 │
│  • Hashtags used                            │
│                                             │
│  Better results with both media + caption.  │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  HOW IT WORKS                               │
│                                             │
│  1️⃣  Upload media & add caption            │
│     From the edit post screen              │
│                                             │
│  2️⃣  AI analyzes content                   │
│     Takes 5-10 seconds                      │
│                                             │
│  3️⃣  Get specific recommendations          │
│     Actionable next steps                   │
│                                             │
│  4️⃣  Apply to next post                    │
│     Improve over time                       │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  PRICING                                    │
│                                             │
│  ✓ First 10 analyses free                   │
│  ✓ $0.10 per analysis after                 │
│                                             │
│  Or upgrade to Premium:                     │
│  • Unlimited analyses                       │
│  • Priority processing                      │
│  • Advanced insights                        │
│  • $9.99/month                              │
│                                             │
│  Pricing section (if applicable)            │
│  Can be removed for free tier users         │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  [Add Media & Get Analysis]                 │
│  Primary button → Screen 13 (Edit mode)     │
│                                             │
│                                             │
│  This post already has performance data.    │
│  Add media to understand what drove         │
│  those results.                             │
│  Small helper text (if linked to entry)     │
│                                             │
│                                             │
│                                             │
└─────────────────────────────────────────────┘

COMPONENT SPECIFICATIONS:

AI Icon:
- Size: 80x80dp
- Robot or brain icon
- Centered, top third
- Subtle animation (optional): Gentle pulse

Headline:
- Typography: 24sp, bold, neutral-900
- Centered below icon
- Clear value proposition

Benefit Sections:
- 4 preview cards showing features
- Icon + title + bullet points
- Light background (neutral-50)
- Border radius: 8dp
- Padding: 16dp
- Spacing between cards: 12dp

Example Insight Card:
- Actual sample analysis
- Shows quality of feedback
- "Example" badge in corner
- Slightly different styling (lighter)
- Shows specific, not generic

Requirements Section:
- Icon + text format
- Clear what's needed
- Shows minimum requirements
- Encourages both media + caption

How It Works:
- Numbered steps (1-4)
- Simple, clear process
- Shows timeframe (5-10 seconds)
- Manages expectations

Pricing Section:
- Optional (only if app charges)
- Clear free tier (10 analyses)
- Paid option shown
- Transparent pricing
- Can be hidden for premium users

CTA Button:
- Primary button styling
- Clear action: "Add Media & Get Analysis"
- Full width minus margins
- Opens edit mode directly

Helper Text:
- Below button
- Contextual based on post state
- Small text: 12sp, neutral-600
- Encouraging tone

STATES:

No Media, No Caption:
- Default state (shown above)
- Full empty state
- Encourages both media + caption

Has Caption, No Media:
- Modified message: "Add media to complete analysis"
- Shows caption can be analyzed alone
- Better results with media

Has Media, No Caption:
- Modified message: "Add caption for better insights"
- Media alone provides visual analysis
- Caption adds context

Recently Added Media:
- "Media uploaded! Tap 'Analyze' in edit screen"
- Encouraging next step
- Close to getting analysis

RATIONALE:

Why Empty State is Important:
1. **Explains Value** - User understands what they'll get
2. **Shows Examples** - Concrete preview of insights
3. **Clear Requirements** - No confusion about what's needed
4. **Motivates Action** - Compelling benefits listed
5. **Transparent Pricing** - No surprises

Design Decisions:
- **Benefits First** - Show value before asking
- **Example Provided** - Specific, not abstract
- **Simple Process** - 4 steps, easy to understand
- **Clear Requirements** - Media OR caption (minimum)
- **Single CTA** - Clear path forward
- **Pricing Transparent** - Honest about costs

User Value:
- **Clarity** - Knows exactly what to expect
- **Confidence** - Sees example quality
- **Direction** - Clear next steps
- **Transparency** - Knows if/what it costs
- **Motivation** - Benefits compelling
```

---

## SCREEN 48: AI ANALYZING (Loading State)

**Title:** Analyzing Your Post  
**Subtitle:** AI analysis in progress

**Description:** Loading overlay shown while AI analyzes post content. Displays progress, estimated time, and reassures user that analysis is happening. Prevents user from navigating away until complete. Shows completion, then transitions to analysis results.

**Functions:**
- Show AI analysis in progress
- Display progress indicator (animated)
- Show estimated time remaining
- Prevent premature navigation
- Show what AI is analyzing
- Transition to results when complete
- Handle errors gracefully

**Navigation:**
- Accessed from: Screen 12 → After saving post with "Analyze" checked
- Accessed from: Screen 13 → After tapping [🔄 Re-analyze]
- Accessed from: Screen 13 → After editing + "Re-analyze" checked
- Auto-transitions to: Screen 46 (Analysis Results) when complete
- Can dismiss: Only if analysis fails (error state)

```
┌─────────────────────────────────────────────┐
│  Analyzing Your Post                         │
│  (Can't dismiss while in progress)           │
├─────────────────────────────────────────────┤
│                                             │
│                                             │
│                                             │
│                                             │
│            🤖                               │
│        (AI icon with pulse)                 │
│                                             │
│                                             │
│      AI Analysis in Progress                │
│      24sp, bold, centered                   │
│                                             │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │   ●●●●●●○○○○                        │   │
│  │   Progress bar (animated)            │   │
│  └─────────────────────────────────────┘   │
│  70% complete                               │
│                                             │
│                                             │
│  Estimated time: 3 seconds                  │
│  14sp, neutral-600                          │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  ANALYZING...                               │
│  12sp, uppercase, neutral-600               │
│                                             │
│  ✓ Media uploaded                           │
│  Checkmark, completed step                  │
│                                             │
│  ✓ Caption processed                        │
│  Checkmark, completed step                  │
│                                             │
│  ⏳ Analyzing creative elements              │
│  Hourglass, current step (animated)         │
│                                             │
│  ○ Generating recommendations               │
│  Circle, pending step                       │
│                                             │
│  ○ Comparing with your posts                │
│  Circle, pending step                       │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  💡 DID YOU KNOW?                           │
│                                             │
│  Posts with your face in the thumbnail      │
│  get 2x more engagement on average.         │
│                                             │
│  Random tip shown during analysis           │
│  Light blue background card                 │
│  Rotates through different tips             │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  This analysis will be saved to your post.  │
│  You can view it anytime from the posts     │
│  list.                                      │
│                                             │
│  Small reassurance text                     │
│                                             │
│                                             │
│                                             │
│                                             │
└─────────────────────────────────────────────┘

COMPLETION STATE (Shows for 1 second):

┌─────────────────────────────────────────────┐
│  Analysis Complete                           │
├─────────────────────────────────────────────┤
│                                             │
│                                             │
│                                             │
│            ✅                               │
│        (Large checkmark)                    │
│        Green color                          │
│                                             │
│                                             │
│      Analysis Complete!                     │
│      24sp, bold, centered                   │
│                                             │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │   ██████████████████████            │   │
│  │   Progress bar (100%)                │   │
│  └─────────────────────────────────────┘   │
│  100% complete                              │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  ✓ Media uploaded                           │
│  ✓ Caption processed                        │
│  ✓ Creative elements analyzed               │
│  ✓ Recommendations generated                │
│  ✓ Compared with your posts                 │
│                                             │
│  All checkmarks, all green                  │
│                                             │
│                                             │
│  Opening your analysis...                   │
│  Small text, centered                       │
│                                             │
│                                             │
│  (Auto-transitions to Screen 46 after 1s)   │
│                                             │
│                                             │
└─────────────────────────────────────────────┘

ERROR STATE (If analysis fails):

┌─────────────────────────────────────────────┐
│  Analysis Failed                        [✕] │
│                               Can dismiss   │
├─────────────────────────────────────────────┤
│                                             │
│                                             │
│            ⚠️                               │
│        (Warning icon)                       │
│        Orange/red color                     │
│                                             │
│                                             │
│      Analysis Failed                        │
│      24sp, bold, centered                   │
│                                             │
│                                             │
│  We couldn't complete the analysis.         │
│  This could be due to:                      │
│                                             │
│  • Network connection issue                 │
│  • Media file corrupted or too large        │
│  • Temporary server issue                   │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  WHAT TO DO                                 │
│                                             │
│  1. Check your internet connection          │
│  2. Make sure media file is under 50MB      │
│  3. Try analyzing again                     │
│                                             │
│  If the problem persists, contact support.  │
│                                             │
│                                             │
│  ─────────────────────────────────────────  │
│                                             │
│                                             │
│  [Try Again]                                │
│  Primary button                             │
│  Re-triggers analysis                       │
│                                             │
│  [Cancel]                                   │
│  Text button                                │
│  Dismisses modal, returns to post           │
│                                             │
│                                             │
└─────────────────────────────────────────────┘

COMPONENT SPECIFICATIONS:

Modal Overlay:
- Full screen overlay
- Semi-transparent background (80% opacity)
- Prevents interaction with content below
- Can't dismiss by tapping outside (during progress)
- Only dismissible in error state

AI Icon (Progress):
- Size: 80x80dp
- Animated pulse or rotation
- Color: Primary brand color
- Centered, top section

Progress Bar:
- Width: 280dp
- Height: 8dp
- Background: neutral-200
- Fill: Primary color (blue/green)
- Animated smooth transition
- Border radius: 4dp (rounded ends)

Progress Percentage:
- Below progress bar
- Typography: 16sp, medium
- Shows 0-100%
- Updates in real-time

Time Estimate:
- Below percentage
- "Estimated time: X seconds"
- Typography: 14sp, neutral-600
- Updates as analysis progresses

Step Indicators:
- 5 steps listed vertically
- Each has icon + text:
  - ✓ Completed (green checkmark)
  - ⏳ Current (animated hourglass)
  - ○ Pending (empty circle)
- Typography: 14sp, regular
- Current step slightly larger/bold

Did You Know Card:
- Light blue background (primary-50)
- Padding: 16dp
- Border radius: 8dp
- Icon + tip text
- Tips rotate every 3 seconds
- Keeps user engaged during wait

Reassurance Text:
- Bottom of modal
- Small text: 12sp, neutral-600
- Explains what happens next
- Reduces anxiety

Completion Checkmark:
- Large: 120x120dp
- Green color (#10B981)
- Scale-in animation (grows from small)
- Shows for 1 second before transition

Error Icon:
- Orange/red warning triangle
- Size: 80x80dp
- Shake animation (attention)

Error Message:
- Clear explanation of what happened
- Bulleted list of possible causes
- Numbered steps to resolve
- Support contact option

Action Buttons (Error):
- Try Again: Primary (blue)
- Cancel: Text button (neutral)
- Adequate spacing (16dp between)
- Full width minus margins

STATES:

Starting (0-10%):
- "Uploading media..."
- Step 1 active (Media uploaded)
- Time estimate: 8-10 seconds

Analyzing (10-60%):
- "Analyzing creative elements..."
- Step 3 active
- Time estimate: 5-8 seconds
- Did You Know tips cycling

Generating (60-90%):
- "Generating recommendations..."
- Step 4 active
- Time estimate: 2-3 seconds

Comparing (90-100%):
- "Comparing with your posts..."
- Step 5 active
- Time estimate: 1-2 seconds

Complete (100%):
- All steps checked
- Large checkmark
- "Opening your analysis..."
- Auto-transition after 1 second

Failed:
- Error icon shown
- Clear error message
- Retry and Cancel options
- Can be dismissed

TIMING:

Estimated Duration:
- Total: 5-10 seconds average
- Steps:
  1. Upload: 1-2 seconds (if not already uploaded)
  2. Process caption: 1 second
  3. Analyze creative: 3-5 seconds (longest step)
  4. Generate recommendations: 2-3 seconds
  5. Compare posts: 1 second

Progress Updates:
- Updates every 500ms
- Smooth animation (easing)
- Never goes backward
- Reaches 100% only when truly complete

Auto-Transition:
- Completion state shows 1 second
- Then auto-navigates to Screen 46
- Smooth transition (fade or slide)

TIPS ROTATION:

Sample Tips (Randomized):
- "Posts with your face in the thumbnail get 2x more engagement on average."
- "The first 3 seconds determine 70% of your retention rate."
- "Adding 5-7 hashtags increases discoverability by 30%."
- "Tuesday and Wednesday posts typically perform 35% better."
- "Videos under 3 minutes have the highest completion rate."
- "Posts with a clear CTA get 40% more click-throughs."
- "Your best performing posts average 2 CTAs per minute."
- "Mobile users make up 80% of social media viewers."
- "Thumbnails with text get 50% more clicks than plain images."
- "Questions in captions boost engagement by 25%."

Tips cycle every 3-4 seconds during analysis.

ERROR HANDLING:

Network Error:
- Message: "Network connection lost"
- Suggestion: "Check your internet connection"
- Action: "Try Again" re-attempts

File Error:
- Message: "Media file couldn't be processed"
- Suggestion: "File may be corrupted or too large (max 50MB)"
- Action: "Try Again" or go back to upload different file

Server Error:
- Message: "Temporary server issue"
- Suggestion: "Our servers are busy. Please try again in a moment."
- Action: "Try Again" (with exponential backoff)

Timeout Error:
- Message: "Analysis took too long"
- Suggestion: "This is unusual. Please try again."
- Action: "Try Again" with fresh request

API Error:
- Message: "Analysis service unavailable"
- Suggestion: "Contact support if this persists"
- Action: "Try Again" or "Contact Support"

VALIDATION:

Before Starting:
- Media file exists OR caption exists
- Media file is valid format (if provided)
- Media file under size limit (50MB)
- Network connection available
- User has analysis credits (if applicable)

During Analysis:
- Timeout after 30 seconds (should complete in 5-10s)
- Network monitoring (retry if drops)
- Error handling at each step
- Progress saves (can resume if interrupted)

After Completion:
- Verify analysis response is valid JSON
- Ensure all sections populated
- Check for required fields
- Save to database before transitioning

ACCESSIBILITY:

Screen Reader:
- Announces progress updates: "Analysis 70% complete"
- Reads current step: "Analyzing creative elements"
- Announces completion: "Analysis complete!"
- Reads error messages fully
- Tips announced as they appear

Visual:
- High contrast progress bar
- Large text (14sp minimum)
- Clear icons (not just color)
- Animation doesn't rely on color alone

Reduced Motion:
- Respects prefers-reduced-motion
- Static progress bar (no animation)
- Steps appear without transitions
- Checkmark appears instantly (no scale)

RATIONALE:

Why Loading State is Important:
1. **Manages Expectations** - 5-10 seconds is noticeable
2. **Prevents Anxiety** - User knows it's working
3. **Engagement** - Tips keep user interested
4. **Progress Visibility** - Not a black box
5. **Error Recovery** - Clear path if fails

Design Decisions:
- **Step Breakdown** - Shows what AI is doing
- **Time Estimate** - Manages expectations
- **Tips During Wait** - Keeps engagement high
- **Can't Dismiss** - Prevents incomplete analysis
- **Auto-Transition** - Smooth flow to results
- **Clear Errors** - Actionable recovery steps

User Value:
- **Transparency** - Knows what's happening
- **Confidence** - Sees progress
- **Learning** - Tips provide value during wait
- **Trust** - Professional, polished experience
- **Recovery** - Clear fix if error occurs
```

---

## 🎯 COMPLETE AI POST ANALYSIS INTEGRATION SUMMARY

### **Total New/Modified Screens: 5**

**Modified Screens: 2**
- Screen 12 Enhanced: Add Post Modal (AI-powered)
- Screen 13 Enhanced: Edit/Delete Post Modal (AI-powered)

**New Screens: 3**
- Screen 46: Post Analysis Detail (comprehensive AI feedback)
- Screen 47: Post Analysis Empty State (encourages usage)
- Screen 48: AI Analyzing (loading state)

---

### **Complete Navigation Map:**

```
POSTS FLOW WITH AI:

Screen 11 (Posts List)
│
├─→ [+ Add Post] → Screen 12 (Add Post)
│   │
│   ├─→ Upload media + caption
│   ├─→ [Save Post]
│   └─→ Screen 48 (AI Analyzing) → Screen 46 (Analysis)
│
├─→ Tap post without analysis → Screen 13 (Post Detail)
│   │
│   └─→ [Add Media & Analyze] → Screen 13 (Edit mode)
│       │
│       └─→ Upload + [Save] → Screen 48 → Screen 46
│
└─→ Tap post with analysis → Screen 13 (Post Detail)
    │
    ├─→ [View Full Analysis] → Screen 46
    ├─→ [🔄 Re-analyze] → Screen 48 → Screen 46
    └─→ [Edit] → Screen 13 (Edit mode)

Screen 46 (Analysis Detail)
│
├─→ [Edit Post] → Screen 13 (Edit mode)
├─→ [Apply to Next Post] → Creates template
└─→ [Share] → Native share sheet

Screen 36 (Insights Dashboard)
│
└─→ Post-specific insight card → Screen 46 (if analysis exists)
```

---

### **Technical Implementation Requirements:**

**1. Backend API Integration:**
```dart
// AI service configuration
class AIAnalysisService {
  final String apiEndpoint = 'https://api.anthropic.com/v1/messages';
  final String model = 'claude-3-5-sonnet-20241022';
  
  Future<PostAnalysis> analyzePost({
    required File? media,
    required String? caption,
    required String platform,
    required DailyEntry? performance,
    required List<Post> userPosts,
  }) async {
    // Implementation in Screen 46 notes
  }
}
```

**2. Database Schema Updates:**
```sql
-- posts table modifications
ALTER TABLE posts ADD COLUMN media_url TEXT;
ALTER TABLE posts ADD COLUMN media_type VARCHAR(10); -- 'image', 'video'
ALTER TABLE posts ADD COLUMN caption TEXT;
ALTER TABLE posts ADD COLUMN ai_analysis_json TEXT; -- Stores full analysis
ALTER TABLE posts ADD COLUMN analyzed_at TIMESTAMP;
ALTER TABLE posts ADD COLUMN analysis_version VARCHAR(20); -- Track AI model version

-- New table for analysis history
CREATE TABLE post_analyses (
  id UUID PRIMARY KEY,
  post_id UUID REFERENCES posts(id),
  analysis_json TEXT,
  model_version VARCHAR(50),
  analyzed_at TIMESTAMP,
  confidence_score FLOAT
);
```

**3. File Storage:**
```dart
// Media upload service
class MediaStorageService {
  Future<String> uploadMedia(File file, String postId) async {
    // Upload to cloud storage (Firebase Storage, AWS S3, etc.)
    // Return public URL
    // Compress images/videos before upload
    // Generate thumbnail for videos
  }
  
  Future<void> deleteMedia(String mediaUrl) async {
    // Delete from cloud storage
    // Called when post deleted or media replaced
  }
}
```

**4. AI Prompt Template:**
```dart
String buildAnalysisPrompt({
  required String platform,
  required String? caption,
  required double? revenue,
  required int? dms,
  required double? spend,
  required List<Post> topPosts,
}) {
  return '''
You are an expert ${platform} content strategist.

Analyze this post and provide specific, actionable feedback.

VISUAL CONTENT:
[Image/video provided in API call]

TEXT CONTENT:
Caption: "${caption ?? 'No caption provided'}"

PERFORMANCE DATA:
Revenue: \$${revenue?.toStringAsFixed(2) ?? 'N/A'}
DMs: ${dms ?? 'N/A'}
Ad Spend: \$${spend?.toStringAsFixed(2) ?? 'N/A'}
Cost per DM: \$${_calculateCostPerDM(spend, dms)}

CONTEXT (User's top 3 posts):
${_formatTopPosts(topPosts)}

Provide analysis in JSON format:
{
  "performance_summary": {
    "vs_average": "X% better/worse",
    "ranking": "#X of Y posts"
  },
  "creative_analysis": {
    "thumbnail": {
      "strengths": ["..."],
      "issues": ["..."],
      "fixes": ["..."]
    },
    "hook": {
      "current": "...",
      "rating": X/10,
      "issue": "...",
      "better_hook": "..."
    },
    "pacing": {...},
    "cta": {...}
  },
  "caption_analysis": {
    "strengths": ["..."],
    "issues": ["..."],
    "rewrite": "...",
    "improvements": ["..."]
  },
  "patterns": {
    "commonalities_with_top": ["..."],
    "differences_from_best": ["..."]
  },
  "recommendations": [
    {
      "title": "...",
      "explanation": "...",
      "example": "...",
      "impact": "..."
    }
  ],
  "quick_wins": [
    {
      "action": "...",
      "impact": "..."
    }
  ]
}

Be specific. No generic advice.
''';
}
```

**5. Cost Management:**
```dart
class AnalysisCreditService {
  static const int FREE_ANALYSES_PER_MONTH = 10;
  static const double COST_PER_ANALYSIS = 0.10;
  
  Future<bool> canAnalyze(String userId) async {
    int usedCredits = await getUsedCredits(userId);
    bool isPremium = await checkPremiumStatus(userId);
    
    if (isPremium) return true;
    if (usedCredits < FREE_ANALYSES_PER_MONTH) return true;
    
    return await hasCredits(userId);
  }
  
  Future<void> consumeCredit(String userId) async {
    await incrementUsedCredits(userId);
    // Log for billing
  }
}
```

---

### **UI/UX Flow Summary:**

**User Journey - First Analysis:**
1. User creates post (Screen 12)
2. Uploads screenshot of YouTube video
3. Pastes video description
4. Taps "Save Post"
5. Analysis starts automatically (Screen 48)
6. 7 seconds later → Screen 46 (Analysis)
7. Sees specific feedback: "Hook too slow, cut to 5 seconds, start with result"
8. Taps [Apply to Next Post] → Template saved
9. Creates next post using template
10. Performance improves → Learns what works

**User Journey - Post Review:**
1. User in Posts List (Screen 11)
2. Sees post with "✓ Analyzed" badge
3. Taps post → Screen 13 (Post Detail)
4. Sees AI summary: "31% better than average"
5. Taps [View Full Analysis] → Screen 46
6. Reads recommendations
7. Taps [Share] → Sends to team
8. Back to work, applies learnings

---

### **Key Differentiators:**

**What Makes This Special:**
1. **Content + Performance** - AI sees creative AND results
2. **Specific, Not Generic** - "Change first 5 seconds to X" not "improve hook"
3. **Pattern Recognition** - Learns from user's own successes
4. **Platform-Specific** - YouTube advice ≠ TikTok advice
5. **Copyable Rewrites** - Don't just suggest, provide ready-to-use text
6. **Correlation** - Shows which creative choices drove which results
7. **Learning System** - Gets smarter with more posts analyzed

**vs. Generic Trackers:**
- Competitors: "You spent $X, made $Y"
- **Grow Out Loud**: "Your hook lost 32% of viewers in 5 seconds. Here's exactly what to say instead: '[specific hook]'. This will reduce drop-off by ~15% based on your best posts."

---

### **Development Priority:**

**Phase 1 (MVP - Week 1-2):**
- ✅ Screen 12 Enhanced (media upload fields)
- ✅ Screen 13 Enhanced (view analysis summary)
- ✅ Media storage service
- ✅ Basic AI integration (mock responses for testing)

**Phase 2 (Core AI - Week 3-4):**
- ✅ Screen 46 (Full analysis detail)
- ✅ Screen 48 (Loading state)
- ✅ Real AI integration (Claude API)
- ✅ Prompt engineering and testing

**Phase 3 (Polish - Week 5-6):**
- ✅ Screen 47 (Empty state)
- ✅ Credit management system
- ✅ Error handling
- ✅ Performance optimization
- ✅ Analytics tracking

**Phase 4 (Advanced - Post-Launch):**
- Pattern recognition across multiple posts
- A/B testing recommendations
- Competitive benchmarking
- Auto-scheduling based on insights

---

**All AI Post Analysis wireframes complete! This transforms the app from tracker → intelligent coach. Ready for development handoff! 🚀**