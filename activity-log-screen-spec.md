# ACTIVITY LOG — CROSS-PROJECT ENTRY FEED

## Screen: Activity Log
## Document Purpose

Complete specification for a unified, cross-project entry feed that lists every daily entry the user has made, across all projects, in reverse chronological order. This gives the user a single place to answer: "What did I log, when, and where?"

**New screen added to V1 inventory.**
**Access point:** Icon in the Home Dashboard app bar (Screen 1).
**Navigation target on card tap:** Screen 8 (Entry Detail View) inside the parent project.

---

## PROBLEM STATEMENT

```
CURRENT STATE:
  Entries live inside individual projects.
  Screen 4 (Daily Entries Tab) shows entries for ONE project.
  Screen 10 (Entry History) shows history for ONE project.

  A user with 5 projects has to open each one individually
  to answer: "What was the last thing I logged?"

  There is no cross-project view of entry activity.

THE GAP:
  "I have 5 projects. I logged something yesterday but I can't
  remember which project it was for. I have to tap into each
  project's Tracker Hub → Entries Tab and check."

  This is 5 × 3 taps minimum (Home → Project Card → Entries Tab)
  to find one entry. That's unacceptable for a daily-use app.

WHAT THIS SOLVES:
  One screen. Every entry. Every project. Reverse chronological.
  One tap from the dashboard. Tap any entry → land directly
  inside that project's entry detail page.
```

---

## VALIDATION

```
PROBLEM:         Real, frequent, painful for any multi-project user.
FREQUENCY:       Daily. This is a "where was I?" question every session.
USER TYPE:       Any user with 2+ active projects (expected majority).
INDUSTRY PATTERN: Standard. GitHub activity feed, banking unified
                 transactions, Wave/QuickBooks global transaction list.
COMPLEXITY:      Low. Single table query with project join.
PRODUCT STAGE:   V1. Gap becomes painful at project #2.
CLASSIFICATION:  Core / Must-have for multi-project users.
```

---

## ACCESS POINT — DASHBOARD APP BAR ICON

The Activity Log is accessed via an icon in the Home Dashboard (Screen 1) app bar. This gives one-tap access from the most visited screen in the app.

```
CURRENT APP BAR:
┌─────────────────────────────────────────────┐
│  RHYDLE                               🔔   │
├─────────────────────────────────────────────┤

UPDATED APP BAR:
┌─────────────────────────────────────────────┐
│  RHYDLE                          🕘   🔔   │
├─────────────────────────────────────────────┤
                                   ↑
                           Activity Log icon

ICON SPECIFICATION:
  Symbol:     Clock/history icon (e.g., Icons.history or Icons.schedule)
              NOT a list icon — clock communicates "recent activity"
  Position:   Left of the notification bell (🔔)
  Size:       24dp, matching 🔔 size
  Color:      text.secondary (default), text.primary (on tap)
  Tooltip:    "Activity" — shown on first use, then on long-press
  Tap:        Opens Activity Log screen (push navigation)
  Badge:      None. This is not a notification — no count needed.

FIRST-USE TOOLTIP:
  On the first time the user sees this icon (after creating their
  first project), show a small tooltip bubble:

  ┌──────────────────┐
  │  Your activity   │
  │  log             │
  └────────┬─────────┘
           ↓
          🕘

  Dismisses on tap or after 3 seconds.
  Shown once per install. Stored in local preferences.

WHEN ICON APPEARS:
  State 0 (Fresh Install):  Hidden — no entries exist, icon would lead to empty page
  State 1+ (Any projects):  Visible — even with 0 entries, the empty state is useful
```

---

## ACTIVITY LOG — FULL SCREEN WIREFRAME

### Active State (Entries Exist)

```
┌─────────────────────────────────────────────────┐
│  ← Activity                                     │
├─────────────────────────────────────────────────┤
│                                                 │
│  TODAY                                          │
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │  🚀 NeoLaunch                        >  │    │
│  │  2:34 PM                                │    │
│  │                                         │    │
│  │  Income     45 000   Expenses  12 000   │    │
│  │  Net profit             +33 000         │    │
│  └─────────────────────────────────────────┘    │
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │  📦 DropStore X                      >  │    │
│  │  11:20 AM                               │    │
│  │                                         │    │
│  │  Income      8 000   Expenses  15 000   │    │
│  │  Net loss               -7 000          │    │
│  └─────────────────────────────────────────┘    │
│                                                 │
│  YESTERDAY                                      │
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │  🎙️ Podcast Pro                      >  │    │
│  │  4:15 PM                                │    │
│  │                                         │    │
│  │  Income     22 000   Expenses   5 000   │    │
│  │  Net profit             +17 000         │    │
│  └─────────────────────────────────────────┘    │
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │  🚀 NeoLaunch                        >  │    │
│  │  9:05 AM                                │    │
│  │                                         │    │
│  │  Income     38 000   Expenses  10 000   │    │
│  │  Net profit             +28 000         │    │
│  └─────────────────────────────────────────┘    │
│                                                 │
│  MARCH 7                                        │
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │  📦 DropStore X                      >  │    │
│  │  3:40 PM                                │    │
│  │                                         │    │
│  │  Income     12 000   Expenses  18 000   │    │
│  │  Net loss               -6 000          │    │
│  └─────────────────────────────────────────┘    │
│                                                 │
│  (scroll to load more...)                       │
│                                                 │
└─────────────────────────────────────────────────┘
```

### Empty State (No Entries Yet)

```
┌─────────────────────────────────────────────────┐
│  ← Activity                                     │
├─────────────────────────────────────────────────┤
│                                                 │
│                                                 │
│                                                 │
│                    🕘                            │
│                                                 │
│           No entries yet                        │
│                                                 │
│     Your entries across all projects            │
│     will appear here as you log them.           │
│                                                 │
│                                                 │
│                                                 │
└─────────────────────────────────────────────────┘
```

---

## ENTRY CARD — DETAILED SPECIFICATION

```
CARD LAYOUT:

  ┌─────────────────────────────────────────┐
  │  {emoji} {Project Name}             >   │  ← Row 1: Identity
  │  {time}                                 │  ← Row 2: Timestamp
  │                                         │
  │  Income   {amount}   Expenses {amount}  │  ← Row 3: Components
  │  {Net label}            {net amount}    │  ← Row 4: Result
  └─────────────────────────────────────────┘

ROW 1 — PROJECT IDENTITY:
  Left:    Project emoji + project name
           Style: text.primary, semibold, 16sp
  Right:   > chevron (navigates to entry detail)
           Style: text.secondary

ROW 2 — TIMESTAMP:
  Text:    Time of entry (e.g., "2:34 PM")
           Uses the entry's created_at timestamp, NOT the entry_date
           WHY: entry_date is the business date the entry covers.
           created_at is when the user actually logged it.
           For an activity feed, "when did I do this?" matters.
  Style:   text.secondary, 14sp

ROW 3 — INCOME + EXPENSES (side by side):
  Left:    "Income" label (text.secondary, 12sp)
           Amount below (text.primary, 14sp)
  Right:   "Expenses" label (text.secondary, 12sp)
           Amount below (text.primary, 14sp)
  Format:  User's currency, no decimal if whole number
           e.g., "45 000" not "45,000.00"
           Follow the same number formatting as the rest of the app.

ROW 4 — NET PROFIT/LOSS:
  Left:    "Net profit" or "Net loss" label (text.secondary, 12sp)
  Right:   Amount (text.primary, 15sp, semibold)
           Positive: accent.positive left-border indicator (2dp)
           Negative: accent.negative left-border indicator (2dp)
           The amount text itself is always text.primary.
           The accent bar provides the positive/negative signal.

TAP TARGET:
  Entire card is tappable.
  Tap → Screen 8 (Entry Detail View) inside parent project.
  Minimum touch target: 56dp height.

CARD BACKGROUND:
  surface.card with standard corner radius.
  Separated by 8dp vertical gap between cards.
```

---

## DATE GROUP HEADERS

```
GROUPING LOGIC:
  Entries are grouped by their entry_date (the business date),
  NOT by created_at. This means if a user logs Monday's entry
  on Tuesday morning, it appears under Monday's group.

  WHY entry_date not created_at for grouping:
  The user thinks in business dates. "What did I log for Monday?"
  The timestamp on the card (Row 2) shows when they actually
  logged it, giving both pieces of information.

HEADER LABELS:
  Today's date:           "TODAY"
  Yesterday:              "YESTERDAY"
  Same week (Mon-Sun):    Day name — "MONDAY", "TUESDAY", etc.
  Same year, older:       "MARCH 7", "FEBRUARY 28", etc.
  Previous year:          "DECEMBER 15, 2025"

HEADER STYLE:
  text.secondary, 12sp, uppercase, semibold
  8dp top padding, 4dp bottom padding
  No background — just the label floating above the first card in its group

SORT ORDER WITHIN GROUP:
  When multiple entries share the same entry_date,
  sort by created_at DESC within the group.
  Most recently logged appears first.
```

---

## NAVIGATION FLOW

```
ENTRY POINT:
  Screen 1 (Home Dashboard)
  └─ Tap 🕘 icon in app bar
     └─→ Activity Log screen (push navigation)

FROM ACTIVITY LOG:
  Tap entry card
  └─→ Screen 8 (Entry Detail View) inside parent project
      ├─ [Edit] → Screen 9 (Edit Entry)
      ├─ [Delete] → Screen 26 (Delete Entry Confirmation)
      ├─ [Duplicate] → Screen 7 (Log Daily Entry, pre-filled)
      └─ [← Back] → Activity Log screen (NOT Screen 4)
                     ↑ THIS IS CRITICAL

BACK NAVIGATION — THE KEY RULE:
  When the user arrives at Screen 8 FROM the Activity Log,
  the back button must return them to the Activity Log,
  not to the project's Entries Tab (Screen 4).

  Implementation: Pass a navigation source parameter.
  If source = "activity_log" → back goes to Activity Log.
  If source = "entries_tab"  → back goes to Screen 4 (default).

  This preserves context. The user opened the activity feed
  to browse across projects. Dumping them inside a project's
  entries tab after viewing one entry breaks their mental model.

DEEP LINK CONTEXT:
  When navigating to Screen 8 from Activity Log, the app must
  load the entry in its full project context. This means:
  - Project header/branding visible on Screen 8
  - Edit/Delete work normally (they already know the project_id)
  - The entry's platform breakdown, notes, etc. all display correctly
  - The only difference is where [← Back] goes.

NAVIGATION AFTER ACTIONS:
  User edits entry from Activity Log → Screen 8 (updated) → Back → Activity Log (refreshed)
  User deletes entry from Activity Log → Confirmation → Activity Log (entry removed)
  User duplicates entry → Screen 7 (new entry form) → Save → Screen 8 → Back → Activity Log
```

---

## DATA LOGIC

```
PRIMARY QUERY:
  SELECT
    e.id,
    e.entry_date,
    e.created_at,
    e.total_revenue AS income,
    e.total_spend AS expenses,
    (e.total_revenue - e.total_spend) AS net,
    p.name AS project_name,
    p.emoji AS project_emoji,
    p.id AS project_id,
    p.currency AS currency
  FROM daily_entries e
  JOIN projects p ON e.tracker_id = p.id
  WHERE p.user_id = {current_user}
    AND p.is_archived = false
  ORDER BY e.entry_date DESC, e.created_at DESC

  Note: Only active (non-archived) projects.
  Archived project entries do NOT appear in the activity feed.
  WHY: Archived projects are "done." Mixing their entries
  into the active feed creates noise and confusion.

PAGINATION:
  Load 20 entries initially.
  Scroll to bottom → load next 20 (infinite scroll).
  Show subtle loading indicator at bottom while fetching.
  Stop when no more entries exist.

PERFORMANCE:
  - Index on: (user_id, entry_date DESC, created_at DESC)
  - Query is lightweight — single join, no aggregation
  - Paginated — never loads full history at once
  - Cache invalidation: refresh on return from Screen 8/9
    (entry may have been edited or deleted)

MIXED CURRENCIES:
  If projects use different currencies, each card shows
  its own project's currency. No conversion, no aggregation.
  The card displays exactly what the user entered.

  Example: NeoLaunch card shows "$45,000" while
  DropStore card shows "150 000 FCFA" — both in the same list.
  This is correct. The activity feed is a log, not a summary.
```

---

## EDGE CASES

```
| Scenario                              | Behavior                                          |
|---------------------------------------|---------------------------------------------------|
| User has 0 entries across all projects | Show empty state (clock icon + guidance text)     |
| User has 1 entry                      | Show single card under its date header. No "load  |
|                                       | more" indicator.                                  |
| Multiple entries same project same day | Each entry gets its own card. Sorted by            |
|                                       | created_at DESC within the date group.            |
| User deletes an entry from Screen 8   | On return to Activity Log, entry disappears.      |
|                                       | Refresh the list.                                 |
| User edits an entry from Screen 8     | On return to Activity Log, card updates with      |
|                                       | new amounts. Refresh the list.                    |
| Project gets archived                 | That project's entries disappear from the feed    |
|                                       | on next load. No retroactive removal mid-session. |
| Project gets unarchived               | That project's entries reappear on next load.     |
| Entry has 0 income and 0 expenses     | Card shows "Income 0  Expenses 0  Net 0"          |
|                                       | This is valid — user may log a zero-activity day. |
| Entry has only expenses (0 income)    | "Income 0  Expenses 15 000  Net loss -15 000"     |
| User scrolls past all entries         | "You've reached the beginning" message at bottom. |
|                                       | No further loading.                               |
| Entry created_at and entry_date       | Card appears under entry_date group header.       |
| are different days                    | Timestamp (Row 2) shows created_at time.          |
|                                       | Example: entry_date = Monday, created_at =        |
|                                       | Tuesday 8:15 AM. Card under "MONDAY" header,      |
|                                       | time shows "8:15 AM (logged Tue)".                |
| Timezone edge case                    | Use device local timezone for all display.        |
```

---

## WHAT THIS SCREEN DOES NOT DO

```
  ❌ Does NOT show non-entry activity (project creation, edits, deletions)
  ❌ Does NOT aggregate or summarize (no totals, no averages)
  ❌ Does NOT filter by project (this is a global feed — filtering is Screen 4's job)
  ❌ Does NOT allow inline editing (tap → Screen 8 for full detail)
  ❌ Does NOT show archived project entries
  ❌ Does NOT show a FAB or "Log Entry" button (logging is via Tracker Hub)
  ❌ Does NOT display charts or visualizations
  ❌ Does NOT have search (V1 — evaluate if users need it post-launch)
  ❌ Does NOT have date range filtering (V1 — the scroll-to-load pattern is sufficient)
```

---

## DEFERRED TO LATER VERSIONS

```
SEARCH (V1.1+ if user demand):
  Text search across entry notes, project names.
  Only build if users report difficulty finding specific entries.

PROJECT FILTER CHIPS (V1.1+ if user demand):
  Horizontal chip row below the header to filter by project.
  Example: [All] [🚀 NeoLaunch] [📦 DropStore] [🎙️ Podcast]
  Only build if users with 5+ projects report the global feed is noisy.

DATE RANGE PICKER (V1.1+ if user demand):
  "Show entries from March 1-7 only."
  The infinite scroll pattern handles this implicitly for V1.
  Only build if users report wanting to jump to specific date ranges.

RATIONALE FOR DEFERRING:
  All three features solve problems that may not exist yet.
  The V1 activity feed is a simple chronological list.
  Users with 3-5 projects and a few weeks of data will not
  need search or filtering — scrolling works fine.
  If we see usage patterns indicating these are needed,
  we add them. Not before.
```

---

## APP BAR ICON VISIBILITY RULES

```
┌─────────────────────┬─────────────────────────┐
│ Dashboard State     │ 🕘 Icon Visibility      │
├─────────────────────┼─────────────────────────┤
│ State 0 (No projects│ Hidden                  │
│ State 1 (Setup only)│ Visible                 │
│ State 2 (Early data)│ Visible                 │
│ State 3 (Trending)  │ Visible                 │
│ State 4 (Mature)    │ Visible                 │
└─────────────────────┴─────────────────────────┘

The icon appears once ANY project exists (State 1+).
Even with 0 entries, tapping it shows the empty state,
which tells the user: "Your entries will appear here."
This is intentional — it primes the user's mental model
so they know this screen exists when they start logging.
```

---

## UPDATED DASHBOARD APP BAR (Screen 1)

The Home Dashboard app bar now has two icons:

```
┌─────────────────────────────────────────────────┐
│  RHYDLE                          🕘   🔔       │
├─────────────────────────────────────────────────┤

  RHYDLE:    Brand wordmark, left-aligned
  🕘:       Activity Log — tap → Activity Log screen
  🔔:       Notifications — tap → Notifications (future)

  Icon spacing: 16dp between icons, 16dp right padding

UPDATED TAP TARGETS FOR SCREEN 1:
  (add to existing navigation map)

  🕘 Activity icon             → Activity Log screen
```

---

## IMPLEMENTATION NOTES

```
COMPONENT: ActivityLogScreen — full-screen page
WIDGET:    ActivityEntryCard — reusable card widget

DATA DEPENDENCY:
  - Single query: daily_entries JOIN projects
  - Paginated: 20 per load
  - Index: (user_id, entry_date DESC, created_at DESC)

STATE MANAGEMENT:
  - Scroll position preserved if user navigates to Screen 8 and back
  - List refreshes on return from Screen 8/9 (entry may have changed)
  - Pull-to-refresh supported (standard Flutter RefreshIndicator)

NAVIGATION:
  - Push from Screen 1 (Activity icon tap)
  - Push to Screen 8 with source = "activity_log" + entry_id + project_id
  - Back from Screen 8 pops to Activity Log (not project Entries Tab)

PERFORMANCE:
  - Lazy loading with pagination — never loads full history
  - Entry cards are lightweight — no nested queries per card
  - All data comes from the single paginated query

ACCESSIBILITY:
  - Each card: "{Project name}, {entry date}, Income {amount},
    Expenses {amount}, Net {profit or loss} {amount}. Double-tap to view details."
  - Date headers: "Today" / "Yesterday" / date announced as section header
  - Empty state: descriptive text read as-is

SIZE ESTIMATE:
  - ~1 new screen
  - ~1 new card widget (reusable)
  - ~1 query + pagination logic
  - Navigation parameter addition to Screen 8 back-button logic
  - Tooltip logic for first-use (small, local preference flag)
  - LOW implementation effort relative to value delivered
```

---

## CROSS-DATE ENTRY DISPLAY RULE

```
When created_at and entry_date fall on different days, this creates
a subtle UX question: "I see this entry under Monday, but the
timestamp says 8:15 AM — was that today?"

SOLUTION:
  If created_at date ≠ entry_date:
    Show timestamp as: "{time} (logged {Day})"
    Example: "8:15 AM (logged Tue)"

  If created_at date = entry_date:
    Show timestamp as: "{time}" only
    Example: "2:34 PM"

  This removes ambiguity without cluttering every card.
  Most entries will show just the time (the common case).
  The "(logged Tue)" suffix only appears when needed.
```

---

## DECISION LOG

```
| Decision                                    | Rationale                                                  | Reversible? |
|---------------------------------------------|------------------------------------------------------------|-------------|
| Access via app bar icon, not bottom nav      | One-tap from home; doesn't justify a permanent nav tab     | Yes         |
| Clock/history icon (not list icon)           | Communicates "recent activity" instantly                    | Yes         |
| Entries only, no other activity types        | Keeps it focused; audit log is a different feature          | Yes — can expand scope later |
| Tap → Screen 8 inside parent project         | Full edit/delete power without building duplicate UI        | Yes         |
| Back from Screen 8 → Activity Log            | Preserves browsing context; user was in the feed, not the project | Yes    |
| Grouped by entry_date, sorted by created_at  | Business date for grouping, actual timestamp for ordering  | Yes         |
| Archived project entries excluded            | Archived = done; mixing them creates noise                 | Yes         |
| No search/filter in V1                       | Scroll is sufficient for early data volumes; defer until demand | Yes     |
| Infinite scroll, 20 per page                 | Standard mobile pattern; lightweight, no complex pagination UI | Yes     |
| Icon hidden in State 0                       | No entries possible; icon would lead to dead end           | Yes         |
| Icon visible from State 1 (0 entries)        | Primes mental model; empty state explains what will appear | Yes         |
| Tooltip on first use only                    | Teaches without nagging; dismisses after one view          | Yes         |
| Mixed currencies shown per-card              | Activity feed is a log, not a summary; no conversion needed | Yes        |
```

---

**Document Version:** 1.0
**Date:** March 2026
**Applies to:** New screen (Activity Log) + modification to Screen 1 (app bar icon)
**Related screens:** Screen 1 (Home Dashboard), Screen 8 (Entry Detail View), Screen 4 (Daily Entries Tab)
**Status:** Ready for implementation
