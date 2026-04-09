# SCREEN 1: HOME DASHBOARD — DATA STATE WIREFRAMES (V2)

## Document Purpose
Complete wireframe specifications for the Home Dashboard (Screen 1) across all possible data states. These wireframes define exactly what the user sees based on how much data exists in the app, using the **finalized dashboard layout**.

**Builds on:** Existing Screen 1, Screen 1a (Detail Modal), Screen 21 (Empty State)
**Modifies:** Screen 21 (Empty State) — redesigned for better conversion
**Affects:** Financial summary cards, project list sections, mini-calendar, microcopy, color coding

**Supersedes:** `dashboard-data-states-wireframes.md` V1.1 (February 2026)

---

## WHAT CHANGED IN THIS VERSION

```
LAYOUT CHANGES (vs V1.1):

  1. FINANCIAL SUMMARY — 3 separate cards replace combined "PERFORMANCE OVERVIEW":
     - Net Profit card (full width, hero position)
     - Income card (half width, left)
     - Expenses card (half width, right)
     Each number breathes on its own. Eye reads top→bottom:
     profit first, then its two components.

  2. TIME PERIOD — Dropdown on Net Profit card replaces horizontal pills:
     Old: [Today] [This Week] [This Month ●]  (standalone row)
     New: ┌───────────┐  (embedded in Net Profit card)
          │ 30 days ▾ │
          └───────────┘
     Filter lives where the data lives.

  3. QUICK ACTIONS ROW — Removed entirely:
     Old: [+ Add Entry] [📊 Reports] [⋯ More]
     New: Gone. All logging flows exclusively through Tracker Hub.
     One consistent path, no dashboard shortcuts that create confusion.

  4. 💡 INSIGHTS ICON — Added to Net Profit card:
     Sits bottom-right corner. Subtle but discoverable.
     V1: Icon NOT shown (no dead-end navigation).
     V1.5: Icon appears. Tap → Screen 36 (Insights).

  5. MINI-CALENDAR — Added between financial cards and project sections:
     Shows which days the user has logged entries.
     Backward month navigation only (◀ to view past months).
     Collapsible — header tap toggles grid visibility.
     Read-only, passive, no tap-on-day interaction.

  6. RECENT PROJECT CARD — Simplified:
     No "Log Entry" button on card. Pure display.
     Tap card → Tracker Hub (Screen 3).

  7. FAB COLOR — Uses brand.primary:
     brand.primary FAB → Screen 2 (Create Project).

TERMINOLOGY CHANGES:
  "Performance Dashboard" → "Home"
  "Revenue" → "Income"
  "Spend" → "Expenses"
  "Trackers" → "Projects"
  "Top Performers" → "Best Performing"
  "Worst Projects" → "Needs Attention"
```

---

## FINALIZED DASHBOARD LAYOUT — SECTION ORDER

```
┌─────────────────────────────────────────────┐
│  RHYDLE                               🔔   │
├─────────────────────────────────────────────┤
│                                             │
│  SECTION 1: NET PROFIT CARD (full width)    │
│  SECTION 2: INCOME + EXPENSES (half+half)   │
│  SECTION 3: MINI-CALENDAR                   │
│  SECTION 4: RECENT PROJECT                  │
│  SECTION 5: BEST PERFORMING / YOUR PROJECTS │
│  SECTION 6: NEEDS ATTENTION                 │
│  SECTION 7: FAB (brand.primary)                │
│  SECTION 8: BOTTOM NAV                      │
│                                             │
└─────────────────────────────────────────────┘

Section visibility varies by data state (see rules below).
```

---

## DATA STATE DEFINITIONS

```
STATE 0: FRESH INSTALL
  Projects: 0
  Entries:  0
  → Redirect to Screen 21 (Empty State) — already handled

STATE 1: SETUP ONLY
  Projects: 1+
  Entries:  0 across all projects
  Setup costs exist but no income/expense entries logged
  → Dashboard shows projects but financial cards have no entry-based data

STATE 2: EARLY DATA (first period)
  Projects: 1+
  Entries:  1+ but all within current time filter period
  No previous period exists for comparison
  → Dashboard shows real numbers but NO trends (nothing to compare)

STATE 3: TRENDING DATA (2+ periods)
  Projects: 1+
  Entries:  Span across at least 2 time filter periods
  Previous period exists for comparison
  → Dashboard shows numbers WITH trend indicators

STATE 4: MATURE DATA (rich history)
  Projects: 1+
  Entries:  4+ weeks of consistent data
  Multiple comparison periods available
  → Full dashboard with trends, contextual insights, best/worst
```

---

## COLOR SYSTEM

This spec uses **semantic color tokens**, not specific hex values. Map these tokens to your implemented color scheme.

```
DESIGN TOKENS USED IN THIS DOCUMENT:

  text.primary        Main text for amounts and headings (darkest text color)
  text.secondary      Labels, subtitles, descriptions (medium gray text)
  text.disabled       Placeholder text, no-data states (lightest text color)
  
  accent.positive     Positive indicators: profit, improving trends, logged days
                      Used for: left accent bars, trend arrows, calendar dots
  accent.negative     Loss/caution indicators: loss amounts, worsening trends
                      Used for: left accent bars, trend arrows
  accent.destructive  TRUE errors only — sync failures, missed deadlines,
                      action-required warnings. Never used for financial loss.
  
  surface.subtle      Light card backgrounds, info boxes, pill chips
  surface.card        Standard card background
  surface.disabled    Very faint background for inactive/future elements
  
  brand.primary       Primary brand color — FAB, CTAs, active nav indicators

───────────────────────────────────────────────────────────────

AMOUNT DISPLAY RULES:

  Profit (positive):
    Amount text:     text.primary
    Accent:          accent.positive — soft left border or icon
    Trend arrow:     accent.positive

  Loss (from entries — real operational loss):
    Amount text:     text.primary — NOT accent.destructive
    Accent:          accent.negative — soft left border or icon
    Label:           "Net loss" in text.secondary
    Trend arrow:     accent.negative if worsening, accent.positive if improving

  Loss (setup cost only — no entries yet):
    Amount text:     text.secondary
    Accent:          None (neutral presentation)
    Label:           "Setup cost" — NOT "loss"

  Neutral / No data:
    Amount text:     text.disabled
    Placeholder:     "—" (em dash, not $0)

  Critical alerts only:
    accent.destructive reserved for:
    - Sync failures
    - Goal deadline missed
    - Action-required warnings
    NEVER used for financial loss amounts.

BRAND:
    RHYDLE wordmark: Should not use the same color as
    accent.negative to avoid visual conflict with loss indicators.

MINI-CALENDAR COLORS:
    ● Logged day:     accent.positive — subtle, warm fill — not harsh or bright
    ○ Missed day:     text.disabled — visible but not alarming
    ·  Future day:    surface.disabled — barely visible
    ◉ Today:         accent.positive outline, hollow if no entry,
                      filled if entry exists

    CRITICAL: Missed days use text.disabled, NOT accent.negative or
    accent.destructive. "No entry" ≠ "failure." Neutral tone only.
```

---

## STATE 0: FRESH INSTALL — EMPTY STATE (Replaces Screen 21)

**When this happens:** User just installed the app or has deleted all projects. Zero projects exist. This is the first screen they see and determines whether they continue or uninstall.

**Key principle:** Show the destination, not the absence. Guide toward action with confidence, not explanation.

**Navigation:**
- Tap [Start Tracking] → Screen 2 (Create Project)
- Bottom nav still accessible

```
┌─────────────────────────────────────────────────┐
│  RHYDLE                                    🔔   │
├─────────────────────────────────────────────────┤
│                                                 │
│                                                 │
│              ┌─────────────────────┐            │
│              │                     │            │
│              │   💵  ──── 186 000  │            │
│              │   📢  ────  84 000  │            │
│              │   💰  ──── +102 000 │            │
│              │        ▲ 24%        │            │
│              │                     │            │
│              └─────────────────────┘            │
│              Mini preview card (faded 60%)       │
│              Shows what dashboard WILL look      │
│              like once user has data             │
│                                                 │
│                                                 │
│         Start tracking your business            │
│                                                 │
│         See where your money goes and           │
│         what's actually working.                │
│                                                 │
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │                                         │    │
│  │  📊  Start Tracking                     │    │
│  │      Name it, pick platforms, go        │    │
│  │      Takes ~2 minutes                   │    │
│  │                                     →   │    │
│  └─────────────────────────────────────────┘    │
│  Primary action card                            │
│  Filled background, bold text                   │
│  Tap → Screen 2 (Create Project)                │
│                                                 │
│                                                 │
│  ─────────────────────────────────────────────  │
│                                                 │
│  WHAT YOU'LL TRACK                              │
│                                                 │
│  ┌───────────┐ ┌───────────┐ ┌───────────┐     │
│  │ 💵        │ │ 📢        │ │ 📊        │     │
│  │ Income    │ │ Expenses  │ │ Profit    │     │
│  │ per day   │ │ per       │ │ auto-     │     │
│  │           │ │ category  │ │ calculated│     │
│  └───────────┘ └───────────┘ └───────────┘     │
│  Scannable icons — not a paragraph              │
│                                                 │
│                                                 │
│ ┌─────────────────────────────────────────────┐ │
│ │ [🏠◉] Home    [📁] Projects   [⚙️] Settings │ │
│ └─────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────┘
```

### STATE 0 — COMPONENT SPECIFICATIONS

```
MINI PREVIEW CARD:
  Purpose: Show the user what their dashboard WILL look like
  Style: 60% opacity, slightly blurred edges, no tap interaction
  Content: 3 sample lines (Income, Expenses, Profit) with fake numbers
  Trend arrow: "▲ 24%" in accent.positive to show the positive outcome
  Size: ~120dp tall, centered, 200dp wide

  DO NOT use the user's currency here — use generic numbers
  that look realistic but are clearly illustrative.

  Alternative: Instead of a card, use a simple illustration
  of a mini chart trending upward. Either works — the point
  is to show the OUTCOME, not the ABSENCE.

HEADLINE:
  Text: "Start tracking your business"
  Style: 24sp, semibold, text.primary, centered
  Max: 6 words — must be scannable in 1 second

SUBTITLE:
  Text: "See where your money goes and what's actually working."
  Style: 16sp, regular, text.secondary, centered
  Max: 15 words — one line on most mobile screens

PRIMARY CTA CARD:
  Background: Filled (primary brand color or warm accent)
  Left icon: 📊 chart icon
  Title: "Start Tracking" — 16sp, semibold, text.primary
  Subtitle: "Name it, pick platforms, go" — 14sp, regular
  Time: "Takes ~2 minutes" — 12sp, text.secondary
  Chevron: → on right side
  Tap target: Entire card (min 56dp height)
  Goes to: Screen 2 (Create Project)

WHAT YOU'LL TRACK — THREE PILLARS:
  Layout: 3 equal-width cards in a horizontal row
  Each card: Icon (24dp) + Label (14sp bold) + Description (12sp text.secondary)

  Card 1: 💵 Income / per day
  Card 2: 📢 Expenses / per category
  Card 3: 📊 Profit / auto-calculated

  Background: surface.subtle rounded cards
  Purpose: Answers "what does this app actually track?"
  in 3 scannable blocks instead of a paragraph.

  "auto-calculated" on Profit is intentional —
  it tells the user the app does the math for them.

WHAT IS INTENTIONALLY ABSENT:
  ❌ "No Projects Yet" or any negative headline
  ❌ Paragraph explaining features (preview card replaces this)
  ❌ Bullet list of use cases (generic, unhelpful)
  ❌ FAB button (no projects to create from here — the CTA handles it)
  ❌ Mini-calendar (nothing to show, would clutter onboarding)
  ❌ Financial summary cards (no data exists)
```

### STATE 0 — EDGE CASES

```
RETURNING USER (deleted all projects):
  Same screen as fresh install.
  No special "welcome back" — treat them as new.
  Their previous data is gone (they confirmed deletion).

USER TAPS START TRACKING → ABANDONS MIDWAY:
  Returns to this empty state.
  No change — form data is discarded. They can try again.

USER CREATES FIRST PROJECT:
  Screen transitions to State 1 (Setup Only) or State 2
  (if they also logged an entry during creation).
  This empty state never appears again unless all projects deleted.
```

---

## STATE 1: SETUP ONLY (Projects exist, zero entries)

**When this happens:** User created 1+ projects with setup costs but hasn't logged any daily entries yet. This is the most common state right after onboarding.

**Key principle:** Setup costs are real money spent, but showing them as "loss" is misleading because the user hasn't started operating yet. The framing should be "investment" not "failure."

```
┌─────────────────────────────────────────────────┐
│  RHYDLE                                    🔔   │
├─────────────────────────────────────────────────┤
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │                                         │    │
│  │  — FCFA              ┌───────────┐      │    │
│  │  Net Profit          │ 30 days ▾ │      │    │
│  │  No entries yet      └───────────┘      │    │
│  │                                         │    │
│  │  ┌───────────────────────────────────┐  │    │
│  │  │  💡 Setup invested: 346 500 FCFA  │  │    │
│  │  │  across 4 projects               │  │    │
│  │  └───────────────────────────────────┘  │    │
│  │                                         │    │
│  └─────────────────────────────────────────┘    │
│                                                 │
│  ┌──────────────────┐ ┌───────────────────┐     │
│  │                  │ │                   │     │
│  │  Income          │ │  Expenses         │     │
│  │  —               │ │  —                │     │
│  │                  │ │                   │     │
│  └──────────────────┘ └───────────────────┘     │
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │  ▾ March 2026                       ◀   │    │
│  │                                         │    │
│  │  Mo   Tu   We   Th   Fr   Sa   Su      │    │
│  │                                         │    │
│  │  ○    ○    ○    ○    ○    ○    ○       │    │
│  │  ○    ○    ○    ○    ○    ○    ○       │    │
│  │  ○    ○    ◉    ·    ·    ·    ·       │    │
│  │  ·    ·    ·    ·    ·    ·    ·       │    │
│  │                                         │    │
│  │  0 days logged                          │    │
│  └─────────────────────────────────────────┘    │
│                                                 │
│  YOUR PROJECTS                                  │
│  Log your first entry to see performance        │
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │  ⏳   VAD Transit - Facebook        >   │    │
│  │       Setup: 30 000 FCFA                │    │
│  │       No entries yet · Created Feb 9    │    │
│  └─────────────────────────────────────────┘    │
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │  ⏳   DOUANES GUINÉES               >   │    │
│  │       Setup: 15 000 FCFA                │    │
│  │       No entries yet · Created Feb 5    │    │
│  └─────────────────────────────────────────┘    │
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │  ⏳   Wait-list For Rhydle app      >   │    │
│  │       Setup: 55 000 FCFA                │    │
│  │       No entries yet · Created Jan 28   │    │
│  └─────────────────────────────────────────┘    │
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │  ⏳   Project 4                     >   │    │
│  │       No setup cost                     │    │
│  │       No entries yet · Created Jan 20   │    │
│  └─────────────────────────────────────────┘    │
│                                                 │
│                         ┌─────────┐             │
│                         │    +    │             │
│                         │ Create  │             │
│                         │ Project │             │
│                         └─────────┘             │
│                         brand.primary FAB               │
│                                                 │
│ ┌─────────────────────────────────────────────┐ │
│ │ [🏠◉] Home    [📁] Projects   [⚙️] Settings │ │
│ └─────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────┘
```

### STATE 1 — KEY DESIGN DECISIONS

```
NET PROFIT CARD:
  - Main amount shows "—" with "No entries yet" subtitle
  - NOT $0, NOT a negative number
  - Setup cost shown in info box INSIDE the card
  - Framing: "Setup invested: 346 500 FCFA" — NOT "Net loss: -346 500"
  - Info box uses surface.subtle background, NOT accent.negative
  - Time period dropdown still visible and functional (ready for when data exists)
  - 💡 Insights icon NOT shown (V1 — icon hidden pre-V1.5)

INCOME + EXPENSES CARDS:
  - Both show "—" (em dash placeholder)
  - No trend arrows (nothing to compare)
  - Cards still render at half-width, maintaining layout consistency

WHY "SETUP INVESTED" NOT "NET LOSS":
  The user entered setup costs to track their initial investment.
  Until they log actual income and operational expenses, calling it
  a "loss" is technically correct but emotionally destructive.

  A store that just signed a lease hasn't "lost" money —
  they've invested in their business. The language matters.

  Once the user logs their first entry with income/expenses,
  the setup cost folds into the real profit calculation and
  the display switches to State 2.

MINI-CALENDAR:
  - Shows current month with all ○ (no entries logged anywhere)
  - ◉ marks today
  - Summary: "0 days logged"
  - The calendar IS the empty state visualization — no special empty state needed
  - ◀ arrow visible (backward navigation) but functionally:
    If user just started, previous months have no data either.
    Arrow is still present for consistency — tapping shows empty past months.
  - Calendar appears even in State 1. Seeing zero dots logged is itself
    a gentle nudge without being judgmental.

PROJECT CARDS:
  - ⏳ icon (hourglass) for not-started projects — NOT 📉 (chart down)
  - "Setup: 30 000 FCFA" — neutral label, not "loss"
  - "No entries yet" with creation date for context
  - No "Best Performing" or "Needs Attention" sections
  - Single list: "YOUR PROJECTS" — honest, simple
  - No dates in left column (no entry dates exist)
  - Tap any card → Screen 3 (Tracker Hub)

SECTIONS HIDDEN IN STATE 1:
  - NO "Recent Project" section (nothing recent to show)
  - NO "Best Performing" section (nothing has performed)
  - NO "Needs Attention" section (too early to judge)
```

---

## STATE 2: EARLY DATA (Entries exist, no previous period for comparison)

**When this happens:** User has been logging entries but only within the current time filter window. If they selected "30 days" and started 10 days ago, there's no "previous 30 days" to compare against.

**Key principle:** Show the real numbers accurately. Don't show trends or percentages — there's nothing to compare against. Replace trend indicators with tracking context.

```
┌─────────────────────────────────────────────────┐
│  RHYDLE                                    🔔   │
├─────────────────────────────────────────────────┤
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │                                         │    │
│  │  ▎ -198 500 FCFA     ┌───────────┐     │    │
│  │  ▎ Net loss          │ 30 days ▾ │     │    │
│  │  accent.               └───────────┘     │    │
│  │  negative                                │    │
│  │  bar                                    │    │
│  │                                         │    │
│  │  Tracking since Feb 1 · 7 entries       │    │
│  │                                         │    │
│  └─────────────────────────────────────────┘    │
│                                                 │
│  ┌──────────────────┐ ┌───────────────────┐     │
│  │                  │ │                   │     │
│  │  ▲  Income       │ │  ▼  Expenses      │     │
│  │  186 000         │ │  346 500          │     │
│  │                  │ │                   │     │
│  └──────────────────┘ └───────────────────┘     │
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │  ▾ March 2026                       ◀   │    │
│  │                                         │    │
│  │  Mo   Tu   We   Th   Fr   Sa   Su      │    │
│  │                                         │    │
│  │  ●    ○    ●    ○    ●    ○    ○       │    │
│  │  ●    ●    ○    ◉    ·    ·    ·       │    │
│  │  ·    ·    ·    ·    ·    ·    ·       │    │
│  │  ·    ·    ·    ·    ·    ·    ·       │    │
│  │                                         │    │
│  │  5 days logged                          │    │
│  └─────────────────────────────────────────┘    │
│                                                 │
│  RECENTLY UPDATED                               │
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │  🚀 VAD Transit - Facebook              │    │
│  │     SaaS Platform         Today: -30 000│    │
│  └─────────────────────────────────────────┘    │
│  Tap card → Tracker Hub (Screen 3)              │
│                                                 │
│  ─────────────────────────────────────────────  │
│                                                 │
│  YOUR PROJECTS                   [View All]     │
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │  28    Wait-list For Rhydle app     >   │    │
│  │  Jan   -55 000 · 3 entries              │    │
│  └─────────────────────────────────────────┘    │
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │  9     VAD Transit - Facebook       >   │    │
│  │  Feb   -30 000 · 2 entries              │    │
│  │        (includes 30 000 setup cost)     │    │
│  └─────────────────────────────────────────┘    │
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │  ⏳    DOUANES GUINÉES              >   │    │
│  │        Setup: 15 000 · No entries yet   │    │
│  └─────────────────────────────────────────┘    │
│                                                 │
│                         ┌─────────┐             │
│                         │    +    │             │
│                         │ Create  │             │
│                         │ Project │             │
│                         └─────────┘             │
│                         brand.primary FAB               │
│                                                 │
│ ┌─────────────────────────────────────────────┐ │
│ │ [🏠◉] Home    [📁] Projects   [⚙️] Settings │ │
│ └─────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────┘
```

### STATE 2 — KEY DESIGN DECISIONS

```
NET PROFIT CARD:
  - Shows REAL profit/loss number: -198 500 FCFA
  - Amount text uses text.primary, NOT accent.destructive
  - Thin accent.negative bar on left edge of the number (2-3dp wide)
  - "Net loss" label in text.secondary
  - NO trend arrow, NO percentage (nothing to compare against)
  - Instead: "Tracking since Feb 1 · 7 entries" — gives context
  - Time period dropdown active and functional
  - 💡 Insights icon NOT shown (V1)

  WHY text.primary NOT accent.destructive:
    The number -198 500 is factual information. The accent.negative bar
    tells you it's negative. You don't need the text itself to scream.

    DESTRUCTIVE TEXT:  User reads "DANGER, FAILURE, STOP"
    PRIMARY TEXT:      User reads "Here's where I am, let me understand why"

    The goal is UNDERSTANDING, not ALARM.

INCOME + EXPENSES CARDS:
  - Show actual numbers (186 000 and 346 500)
  - ▲ arrow on Income card (directional indicator only, no percentage)
  - ▼ arrow on Expenses card (directional indicator only)
  - NO trend percentages (nothing to compare)
  - Arrows serve as visual distinction — Income goes up, Expenses go down is good

MINI-CALENDAR:
  - Shows logged days as ● for current month
  - Building habit pattern visible even with few entries
  - ◀ arrow navigates to previous months (backward only)
  - Summary: "{n} days logged"

RECENTLY UPDATED — SIMPLIFIED CARD:
  - Shows most recently active project
  - Project name + type + today's figure
  - NO "Log Entry" button on card
  - Tap entire card → Screen 3 (Tracker Hub)
  - Only 1 card shown (not a list)

YOUR PROJECTS:
  - Replaces both "Best Performing" and "Needs Attention"
  - WHY: With only early data, ranking projects is misleading.
    All projects are in early stages. Sorting by "best" and "worst"
    implies judgment not yet supported by data.
  - Sorted by: last activity date (most recent first)
  - Projects WITH entries: date + amount + entry count
  - Projects WITHOUT entries: ⏳ + setup cost + "No entries yet"
  - NO project appears twice (eliminates duplicate problem)

SETUP COST TRANSPARENCY:
  For projects with entries AND setup costs:
  "(includes 30 000 setup cost)" shown in smaller secondary text.
  Explains WHY the number is negative even if entries show income.
```

---

## STATE 3: TRENDING DATA (Previous period exists for comparison)

**When this happens:** User has logged entries across at least 2 time filter periods. For "30 days" filter, they've been active for 30+ days. The app now has enough data to calculate meaningful trends.

**Key principle:** NOW trends appear. This is the reward for consistent logging. The dashboard becomes genuinely intelligent.

```
┌─────────────────────────────────────────────────┐
│  RHYDLE                                    🔔   │
├─────────────────────────────────────────────────┤
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │                                         │    │
│  │  ▎ -98 500 FCFA      ┌───────────┐     │    │
│  │  ▎ Net loss           │ 30 days ▾ │     │    │
│  │  accent.   ▲ 50% better└───────────┘     │    │
│  │  negative  vs last month                 │    │
│  │  bar      (accent.positive — improving)  │    │
│  │                                         │    │
│  │  Based on 18 entries across 4 projects  │    │
│  │                                    💡   │    │
│  └─────────────────────────────────────────┘    │
│                                                 │
│  ┌──────────────────┐ ┌───────────────────┐     │
│  │                  │ │                   │     │
│  │  ▲  Income       │ │  ▼  Expenses      │     │
│  │  286 000         │ │  384 500          │     │
│  │  ▲ 54%  accent.  │ │  ▲ 11%  accent.   │     │
│  │         positive │ │         negative   │     │
│  │                  │ │                   │     │
│  └──────────────────┘ └───────────────────┘     │
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │  ▾ March 2026                       ◀   │    │
│  │                                         │    │
│  │  Mo   Tu   We   Th   Fr   Sa   Su      │    │
│  │                                         │    │
│  │  ●    ●    ●    ○    ●    ○    ○       │    │
│  │  ●    ●    ○    ●    ●    ○    ○       │    │
│  │  ●    ○    ◉    ·    ·    ·    ·       │    │
│  │  ·    ·    ·    ·    ·    ·    ·       │    │
│  │                                         │    │
│  │  12 days logged                         │    │
│  └─────────────────────────────────────────┘    │
│                                                 │
│  Recent Project                                 │
│  ┌─────────────────────────────────────────┐    │
│  │  🚀 NeoLaunch                           │    │
│  │     SaaS Platform         Today: +$450 ↗│    │
│  └─────────────────────────────────────────┘    │
│  Tap card → Tracker Hub (Screen 3)              │
│                                                 │
│  ─────────────────────────────────────────────  │
│                                                 │
│  BEST PERFORMING                 [View All]     │
│  Highest profit this month                      │
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │  🚀 NeoLaunch                           │    │
│  │     SaaS Platform         +$3,240       │    │
│  └─────────────────────────────────────────┘    │
│  ┌─────────────────────────────────────────┐    │
│  │  🎙️ Podcast Pro                         │    │
│  │     Media                 +$1,850       │    │
│  └─────────────────────────────────────────┘    │
│                                                 │
│  ─────────────────────────────────────────────  │
│                                                 │
│  NEEDS ATTENTION                                │
│  Declining or no recent activity                │
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │  📦 DropStore X                         │    │
│  │     E-commerce            -$420         │    │
│  └─────────────────────────────────────────┘    │
│                                                 │
│                         ┌─────────┐             │
│                         │    +    │             │
│                         │ Create  │             │
│                         │ Project │             │
│                         └─────────┘             │
│                         brand.primary FAB               │
│                                                 │
│ ┌─────────────────────────────────────────────┐ │
│ │ [🏠◉] Home    [📁] Projects   [⚙️] Settings │ │
│ └─────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────┘
```

### STATE 3 — KEY DESIGN DECISIONS

```
NET PROFIT CARD — TRENDS NOW VISIBLE:
  Main number: -98 500 FCFA (text.primary, accent.negative bar)
  Trend: "▲ 50% better vs last month"

  CRITICAL: The trend uses accent.positive even though the number is negative.
  WHY: The loss SHRANK from -198 500 to -98 500. That's improvement.
  The trend color reflects DIRECTION, not POSITION.

  Context line: "Based on 18 entries across 4 projects"
  (replaces "Tracking since..." from State 2)

  💡 Insights icon: Shown in V1.5 only. Hidden in V1.
  Position: bottom-right corner of Net Profit card.
  Tap → Screen 36 (Insights).

INCOME + EXPENSES CARDS — NOW WITH TRENDS:
  Income:   286 000 · ▲ 54% (accent.positive — more income is good)
  Expenses: 384 500 · ▲ 11% (accent.negative — more expenses is concerning)

  Note: Expenses going UP gets an UP arrow (factually correct)
  but accent.negative color (contextually: more spend = caution).

TREND CALCULATION:
  change = ((current - previous) / |previous|) × 100

  For profit/loss:
    Previous: -198 500    Current: -98 500
    Change: ((-98500 - (-198500)) / |-198500|) × 100 = +50.3%
    Direction: IMPROVING (less negative)
    Arrow: ▲    Color: accent.positive
    Label: "▲ 50% better vs last month"

  For income:
    Previous: 186 000    Current: 286 000
    Change: +53.8%
    Arrow: ▲    Color: accent.positive

  For expenses:
    Previous: 346 500    Current: 384 500
    Change: +10.9%
    Arrow: ▲    Color: accent.negative

MINI-CALENDAR:
  - By State 3, user has been active 30+ days
  - Current month shows meaningful dot pattern
  - ◀ arrow navigates backward to previous months (which now have data)
  - ▶ arrow navigates forward BUT is disabled/hidden on current month
    (cannot navigate to future months)
  - Viewing past months shows historical logging patterns
  - Summary always reflects displayed month: "{n} days logged"
  - When viewing a past month: "{n} days logged in {Month}"

RECENT PROJECT CARD:
  - Shows most recently active project
  - Clean display: emoji + name + type + today's figure
  - NO "Log Entry" button — tap entire card → Screen 3 (Tracker Hub)
  - This is the ONLY entry point from dashboard to a specific project

SECTIONS NOW DIFFERENTIATED:
  "BEST PERFORMING" — earned label
    Projects ranked by improvement trend.
    Only projects WITH trend data (2+ periods) appear here.
    Subtitle: "Highest profit this month"
    Cards show simplified format: emoji + name + type + profit amount

  "NEEDS ATTENTION" — actionable framing
    Includes:
    - Projects with declining trends
    - Projects with no entries for 7+ days
    - Projects still in setup-only state for 30+ days
    Subtitle: "Declining or no recent activity"

  WHY "NEEDS ATTENTION" NOT "WORST PROJECTS":
    "Worst" is judgmental and discouraging.
    "Needs attention" is actionable — it says "do something here."
    Same information, different emotional impact.
```

---

## STATE 4: MATURE DATA (Rich history, full intelligence)

**When this happens:** User has 4+ weeks of consistent data. Multiple comparison periods. The app is at peak intelligence.

**This state is identical to State 3 in STRUCTURE** but with richer context lines and more confident insights. The wireframe layout doesn't change — only the content quality improves.

```
NET PROFIT CARD IN STATE 4:

  ┌─────────────────────────────────────────┐
  │                                         │
  │  ▎ +42 500 FCFA        ┌───────────┐   │
  │  ▎ Net profit           │ 30 days ▾ │   │
  │  accent.   ▲ 124%        └───────────┘   │
  │  positive  vs last month                 │
  │                                         │
  │  Best month so far · 24 entries         │
  │                                    💡   │
  └─────────────────────────────────────────┘

  ┌──────────────────┐ ┌───────────────────┐
  │                  │ │                   │
  │  ▲  Income       │ │  ▼  Expenses      │
  │  486 000         │ │  443 500          │
  │  ▲ 162% accent.  │ │  ▲ 28%  accent.   │
  │         positive │ │         negative   │
  │                  │ │                   │
  └──────────────────┘ └───────────────────┘

CONTEXTUAL INSIGHT LINES (State 4 only):

  When best month ever:
    "Best month so far · 24 entries"

  When 3+ months of growth:
    "3 months of consecutive growth"

  When first profitable month:
    "First profitable month 🎯"

  When all projects profitable:
    "All 4 projects in profit this month"

  When reverting after growth:
    "Down from last month's peak · Review expenses"
```

---

## MINI-CALENDAR — COMPLETE SPECIFICATION

### Purpose

A passive visual element on Screen 1 (Home Dashboard) that shows which days the user has logged entries. Creates gentle accountability without gamification, streaks, or pressure.

**Core Principle:** Make logging behavior visible without judging it.

### Placement

The mini-calendar sits between the financial summary cards (Net Profit + Income/Expenses) and the project sections (Recent Project / Best Performing / Your Projects). It appears in **all data states except State 0** (Fresh Install).

### Visual States Legend

```
●  = Day with at least one entry logged (filled dot, accent.positive)
○  = Day with no entry logged (empty circle, text.disabled)
·  = Future day (dimmed dot, surface.disabled)
◉  = Today (outlined ring — hollow if no entry, filled if entry exists)
```

### Month Navigation

```
NAVIGATION ARROWS:

  ◀  = Navigate to previous month (always visible from month 2 onward)
  ▶  = Navigate to next month (only visible when viewing a past month)

  CONSTRAINT: User CANNOT navigate past the current month.
  When viewing current month: ▶ is hidden or disabled.
  When viewing a past month: ▶ appears to return toward present.

  This is backward-only navigation from the user's perspective.
  The user can look at where they've been, not where they're going.

HEADER FORMAT:
  Current month:    "▾ March 2026                    ◀"
  Past month:       "▾ February 2026              ◀  ▶"
  Oldest month:     "▾ January 2026                  ▶"
  Collapsed:        "▸ March 2026 · 12 days logged   ◀"
  (◀ hidden if no earlier month with data exists)

MONTH BOUNDARY:
  ◀ is available for any month where the user's account existed.
  If user joined in February, they cannot navigate before February.
  Months with zero entries still show (all ○ for past days) —
  this is intentional. Seeing an empty month is honest information.
```

### Calendar Data States

```
STATE A: Fresh User (0-2 entries)

  ┌─────────────────────────────────────────┐
  │  ▾ March 2026                       ◀   │
  │                                         │
  │  Mo   Tu   We   Th   Fr   Sa   Su      │
  │                                         │
  │  ○    ○    ●    ○    ○    ○    ○       │
  │  ◉    ·    ·    ·    ·    ·    ·       │
  │  ·    ·    ·    ·    ·    ·    ·       │
  │  ·    ·    ·    ·    ·    ·    ·       │
  │                                         │
  │  1 day logged                            │
  └─────────────────────────────────────────┘

  That single dot is a seed — the user sees their first mark
  and naturally wants more. "1 day logged" is factual, not judgmental.


STATE B: Building Habit (5-15 entries)

  ┌─────────────────────────────────────────┐
  │  ▾ March 2026                       ◀   │
  │                                         │
  │  Mo   Tu   We   Th   Fr   Sa   Su      │
  │                                         │
  │  ●    ●    ●    ○    ●    ○    ○       │
  │  ●    ●    ○    ●    ●    ○    ○       │
  │  ●    ○    ◉    ·    ·    ·    ·       │
  │  ·    ·    ·    ·    ·    ·    ·       │
  │                                         │
  │  9 days logged                           │
  └─────────────────────────────────────────┘

  Pattern visible. Clusters (weekdays active, weekends off).
  Informational — no judgment about weekends being empty.


STATE C: Active User (15+ entries)

  ┌─────────────────────────────────────────┐
  │  ▾ March 2026                       ◀   │
  │                                         │
  │  Mo   Tu   We   Th   Fr   Sa   Su      │
  │                                         │
  │  ●    ●    ●    ●    ●    ○    ○       │
  │  ●    ●    ●    ●    ●    ○    ●       │
  │  ●    ●    ●    ●    ●    ○    ○       │
  │  ●    ●    ◉    ·    ·    ·    ·       │
  │                                         │
  │  17 days logged                          │
  └─────────────────────────────────────────┘

  Mostly filled — feels rewarding. Visual density communicates
  "I'm on top of this" without badge or streak counter.


STATE D: Viewing a Past Month

  ┌─────────────────────────────────────────┐
  │  ▾ January 2026                  ◀  ▶   │
  │                                         │
  │  Mo   Tu   We   Th   Fr   Sa   Su      │
  │                                         │
  │  ○    ○    ○    ●    ●    ○    ○       │
  │  ●    ○    ○    ●    ●    ○    ○       │
  │  ●    ●    ○    ○    ●    ○    ○       │
  │  ●    ●    ○    ●    ●    ○    ○       │
  │  ○    ○    ○                            │
  │                                         │
  │  12 days logged in January               │
  └─────────────────────────────────────────┘

  All days are in the past — no future dots (·).
  All days are either ● or ○.
  No ◉ (today marker only appears on current month).
  Summary changes to: "{n} days logged in {Month}"
  Both ◀ and ▶ visible (can go further back or return to present).
```

### Data Logic

```
DATA SOURCE:
  Query: SELECT DISTINCT DATE(entry_date) FROM daily_entries
         WHERE tracker_id IN (user's active trackers)
         AND entry_date >= first_day_of(displayed_month)
         AND entry_date <= last_day_of(displayed_month)

  - A day is "logged" if ANY project has an entry for that date
  - Calendar is CROSS-PROJECT (not per-project)
  - Logging any project counts as activity for that day

DISPLAY LOGIC:
  - Default: show current month on dashboard load
  - Start week on Monday (international standard)
  - Today highlighted with outline ring (current month only)
  - Summary text: "{count} days logged" (current month)
                   "{count} days logged in {Month}" (past month)
  - No percentage, no streak count

MONTH NAVIGATION LOGIC:
  - Track displayed_month state variable (default: current month)
  - ◀ tap: displayed_month = displayed_month - 1 month
  - ▶ tap: displayed_month = displayed_month + 1 month
  - Constraint: displayed_month <= current month (never future)
  - Constraint: displayed_month >= user's first month (account creation)
  - New query fires on month change (lightweight, single table scan)
  - Cache results per month per session (month data doesn't change mid-session
    except current month which updates on new entry)
```

### Edge Cases

```
| Scenario                          | Behavior                                       |
|-----------------------------------|------------------------------------------------|
| User has 0 entries ever           | Calendar shows all ○ for past days, · for      |
|                                   | future. Summary: "0 days logged"               |
| Month just started (1st-3rd)     | Shows 1-3 past days + today. Most days are     |
|                                   | future (·). Doesn't look empty.                |
| User logs multiple entries/day    | Still ONE dot (●). Count unique days, not      |
|                                   | entry count.                                   |
| User deletes only entry for day   | Dot reverts ● → ○. Real-time update.           |
| User has entries from past months | Navigable via ◀ arrow. Each month loads its    |
|                                   | own data independently.                        |
| User only has one project         | Works identically. Calendar doesn't care about |
|                                   | project count.                                 |
| Timezone edge case                | Use device local timezone for "today"          |
| User navigates to empty past month| All ○ for that month. "0 days logged in {Month}"|
|                                   | This is honest — no special treatment.          |
| User joined mid-month             | Days before account creation show as ○ (not ·) |
|                                   | They're past days where no entry exists.        |
| ◀ on earliest possible month     | ◀ arrow hidden or disabled.                    |
| ▶ on current month               | ▶ arrow hidden or disabled.                    |
```

### Interaction Behavior

```
COLLAPSE / EXPAND:
  The mini-calendar is collapsible. The header row (month name + arrows)
  acts as the toggle. Tapping the header collapses or expands the grid.

  EXPANDED (default):
  ┌─────────────────────────────────────────┐
  │  ▾ March 2026                      ◀   │
  │                                         │
  │  Mo   Tu   We   Th   Fr   Sa   Su      │
  │                                         │
  │  ●    ●    ●    ○    ●    ○    ○       │
  │  ●    ●    ○    ●    ●    ○    ○       │
  │  ●    ○    ◉    ·    ·    ·    ·       │
  │  ·    ·    ·    ·    ·    ·    ·       │
  │                                         │
  │  12 days logged                          │
  └─────────────────────────────────────────┘

  COLLAPSED:
  ┌─────────────────────────────────────────┐
  │  ▸ March 2026 · 12 days logged     ◀   │
  └─────────────────────────────────────────┘

  BEHAVIOR:
  - ▾ (expanded indicator) / ▸ (collapsed indicator) before month name
  - When collapsed: summary moves inline with header
    Format: "{Month} {Year} · {n} days logged"
  - Month navigation arrows (◀ / ▶) remain visible in collapsed state
    User can navigate months without expanding
  - Collapse/expand state persists within the session
  - Resets to EXPANDED on fresh dashboard load
  - Animation: smooth height transition (200ms ease-out)
  - The grid + summary row hide; only the single-line header remains

  WHY COLLAPSIBLE:
  For returning users who've internalized their logging habit,
  the calendar becomes less useful as a daily glance tool.
  Collapsing it frees vertical space and surfaces project cards
  higher on screen. But it stays accessible with one tap.

  DEFAULT STATE PER DATA STATE:
  State 1 (Setup Only):   Expanded — user is new, calendar is novel
  State 2 (Early Data):   Expanded — building the habit, dots matter
  State 3 (Trending):     Expanded — pattern is visible and rewarding
  State 4 (Mature):       Expanded — but user is most likely to collapse here
  All states default to expanded. The user chooses to collapse.

TAP ON DAY DOT:
  Does nothing. This is a passive, read-only component.
  No drill-down, no navigation. Tap targets on days would
  create expectations ("tap to see entries") that belong in
  a reports view, not a dashboard glance widget.

TAP ON MONTH NAME / CHEVRON (▾ / ▸):
  Toggles collapse/expand. Tap target is the entire header row
  EXCLUDING the ◀ / ▶ arrows (those navigate months).

TAP ON ARROWS (◀ / ▶):
  Navigates month. Works in both expanded and collapsed states.
  In collapsed state: summary text updates to reflect new month.
  In expanded state: crossfade dots (200ms), update header.
  No page slide animation — the calendar stays in place,
  only the content changes.

SCROLL BEHAVIOR:
  Calendar scrolls with the rest of the dashboard.
  Not sticky, not floating.

ACCESSIBILITY:
  Header: "March 2026, 12 days logged, expanded. Double-tap to collapse."
  Each dot: screen reader label "March 5, entry logged"
  or "March 6, no entry"
  Arrows: "Previous month" / "Next month"
  When arrow is disabled: "No previous months available"
  Collapse chevron: "Collapse calendar" / "Expand calendar"
```

### What This Component Does NOT Do

```
  ❌ Does NOT show streaks or streak counts
  ❌ Does NOT compare months to each other
  ❌ Does NOT show per-project breakdown
  ❌ Does NOT use accent.negative or accent.destructive for missed days
  ❌ Does NOT send notifications about empty days
  ❌ Does NOT display on project-specific screens (dashboard only)
  ❌ Does NOT animate or draw attention to gaps
  ❌ Does NOT navigate to future months
  ❌ Does NOT allow tap-on-day interaction
  ❌ Does NOT auto-collapse (user-initiated only)
```

### Implementation Notes

```
COMPONENT: MiniCalendarWidget — self-contained Flutter widget
DATA DEPENDENCY: Single query against daily_entries table per displayed month
PERFORMANCE: Lightweight — one query, no joins, cached per session per month
SIZE:
  Expanded: approximately 100-120px tall on standard mobile screen
  Collapsed: approximately 40-48px (single header row)
STATE:
  - displayed_month (default: current month). Resets to current on dashboard load.
  - is_collapsed (default: false). Resets to false on dashboard load.
  - Both stored in widget state, not persisted to database.
REUSE POTENTIAL: Could later appear on Tracker Hub (Screen 3) per-project, but V1 is dashboard-only
```

---

## STATE TRANSITIONS: WHEN EACH STATE ACTIVATES

```
DECISION TREE:

  User opens Dashboard
  │
  ├─ 0 projects? ──────────────────→ Screen 21 (Empty State / State 0)
  │
  ├─ Projects exist but 0 entries
  │  across ALL projects? ─────────→ STATE 1 (Setup Only)
  │
  ├─ Entries exist but ALL within
  │  current time filter period? ──→ STATE 2 (Early Data)
  │
  │  HOW TO CHECK:
  │  Time filter = "30 days"
  │  Current period = Feb 1 - Feb 28
  │  Previous period = Jan 2 - Jan 31
  │  If sum(entries in previous period) = 0 → STATE 2
  │  If sum(entries in previous period) > 0 → STATE 3
  │
  ├─ Entries span 2+ time filter
  │  periods? ─────────────────────→ STATE 3 (Trending)
  │
  └─ Entries span 4+ weeks with
     consistent logging? ──────────→ STATE 4 (Mature)

     HOW TO CHECK STATE 4:
     Count distinct weeks with entries >= 4
     AND total entries >= 20
     → STATE 4 (same layout as 3, richer content)

TIME FILTER IMPACT ON STATES:
  User selects "7 days" → Previous = last 7 days
    If user started 10 days ago → STATE 3 (has previous week)
    If user started 3 days ago → STATE 2 (no previous week)

  User selects "30 days" → Previous = last 30 days
    If user started 45 days ago → STATE 3
    If user started 15 days ago → STATE 2

  User selects "All time" → NO trend (nothing to compare)
    Always shows STATE 2 style (numbers without trends)
    Except: shows total duration context

NOTE: Time filter dropdown does NOT affect the mini-calendar.
  The calendar always shows the displayed month's data regardless
  of which time period is selected in the Net Profit dropdown.
  These are independent: the dropdown filters financial data,
  the calendar shows logging activity by calendar month.
```

---

## SECTION VISIBILITY RULES

```
┌───────────────────────┬────────┬────────┬────────┬────────┬────────┐
│ Section               │State 0 │State 1 │State 2 │State 3 │State 4 │
├───────────────────────┼────────┼────────┼────────┼────────┼────────┤
│ Preview Card + CTAs   │  ✅    │  ❌    │  ❌    │  ❌    │  ❌    │
│ "What You'll Track"   │  ✅    │  ❌    │  ❌    │  ❌    │  ❌    │
│ Net Profit Card       │  ❌    │  ✅    │  ✅    │  ✅    │  ✅    │
│ Income + Expenses     │  ❌    │  ✅    │  ✅    │  ✅    │  ✅    │
│ Mini-Calendar         │  ❌    │  ✅    │  ✅    │  ✅    │  ✅    │
│ Recent Project        │  ❌    │  ❌    │  ✅    │  ✅    │  ✅    │
│ Your Projects (flat)  │  ❌    │  ✅    │  ✅    │  ❌    │  ❌    │
│ Best Performing       │  ❌    │  ❌    │  ❌    │  ✅    │  ✅    │
│ Needs Attention       │  ❌    │  ❌    │  ❌    │  ✅*   │  ✅*   │
│ 💡 Insights Icon      │  ❌    │  ❌    │  ❌    │  V1.5  │  V1.5  │
│ brand.primary FAB             │  ❌    │  ✅    │  ✅    │  ✅    │  ✅    │
│ Bottom Nav            │  ✅    │  ✅    │  ✅    │  ✅    │  ✅    │
└───────────────────────┴────────┴────────┴────────┴────────┴────────┘

* "Needs Attention" only appears if there ARE projects needing attention.
  If all projects are performing well, this section is hidden.

TRANSITION RULES:
  State 0 → State 1:  Triggered by FIRST project created (with or without setup cost)
  State 1 → State 2:  Triggered by FIRST entry logged on ANY project
  State 2 → State 3:  Triggered when time filter comparison period has data
  State 3 → State 4:  Triggered when 4+ distinct weeks have entries

  These transitions are AUTOMATIC. No user action required beyond logging.
  The dashboard literally grows with the user.
```

---

## OVERVIEW CARD → DETAIL MODAL (ℹ BEHAVIOR)

The Net Profit card's ℹ icon (or tap area) opens Screen 1a (Detail Modal). Modal content adapts by state:

```
STATE 1 (Setup Only):
  Modal shows:
  - Total setup costs across all projects
  - Breakdown by project
  - "Start logging entries to see performance analysis"
  - No trends, no insights (no data)

STATE 2 (Early Data):
  Modal shows:
  - Net profit/loss breakdown
  - Income breakdown by project/platform
  - Expenses breakdown by project/platform
  - NO period-over-period changes (no prior data)
  - "Keep logging — trends appear after [X more days]"

STATE 3+ (Trending / Mature):
  Modal shows:
  - Full Screen 1a as currently designed
  - Period changes with percentages
  - "What Drove This" section
  - Platform breakdown
  - Alerts if applicable
  - Quick Insights
```

---

## PROJECT CARD SPECIFICATIONS (All States)

### Card Type A: Active Project WITH Entries AND Trend

```
┌─────────────────────────────────────────────┐
│  9      VAD Transit - Facebook          >   │
│  Feb    -10 000 · ▲ 67% vs last mo         │
│         8 entries                           │
└─────────────────────────────────────────────┘

  Left column:   Date of last entry (day + month abbreviation)
  Title:         Project name (bold, dark)
  Amount:        Profit/loss for current period
                 Dark text, no color on the amount itself
  Trend:         ▲/▼ + percentage + "vs last [period]"
                 accent.positive if improving, accent.negative if declining
  Entry count:   Total entries in current period
  Chevron:       → navigates to Screen 3 (Tracker Hub)
```

### Card Type B: Active Project WITH Entries, NO Trend

```
┌─────────────────────────────────────────────┐
│  9      VAD Transit - Facebook          >   │
│  Feb    -30 000 · 2 entries                 │
│         (includes 30 000 setup cost)        │
└─────────────────────────────────────────────┘

  Same as Type A but:
  - No trend indicator (no previous period data)
  - Shows "(includes X setup cost)" if setup cost > 0
    and setup cost is a significant portion of the loss
  - Entry count inline with amount
```

### Card Type C: Project WITHOUT Entries (Setup Only)

```
┌─────────────────────────────────────────────┐
│  ⏳     DOUANES GUINÉES                 >   │
│         Setup: 15 000 FCFA                  │
│         No entries yet · Created Feb 5      │
└─────────────────────────────────────────────┘

  Left column:   ⏳ (hourglass icon) — NOT a date, NOT "--"
  Title:         Project name
  Amount line:   "Setup: 15 000 FCFA" — NOT "📉 15 000 loss"
                 Neutral gray color
  Context:       "No entries yet · Created [date]"
  Chevron:       → navigates to Screen 3

  IF project has no setup cost:
  ┌─────────────────────────────────────────────┐
  │  ⏳     Project Name                    >   │
  │         No entries yet · Created Feb 5      │
  └─────────────────────────────────────────────┘
```

### Card Type D: Project Needing Attention

```
┌─────────────────────────────────────────────┐
│  ⚠️     DOUANES GUINÉES                >   │
│         Setup: 15 000 · No entries yet      │
│         Created 35 days ago                 │
└─────────────────────────────────────────────┘

  Used in "NEEDS ATTENTION" section (State 3+)
  ⚠️ icon replaces ⏳ when:
    - Project has no entries for 14+ days (if it had entries before)
    - Project is in setup-only state for 30+ days
    - Project trend is declining for 2+ consecutive periods

  The "35 days ago" phrasing creates gentle urgency:
  "You created this over a month ago and never started."
```

### Card Type E: Recent Project Card (Dashboard-Specific)

```
┌─────────────────────────────────────────────┐
│  🚀 NeoLaunch                               │
│     SaaS Platform              Today: +$450 ↗│
└─────────────────────────────────────────────┘

  Emoji:         Project emoji (user-selected or default)
  Title:         Project name (bold)
  Subtitle:      Project type / category
  Today's figure: Today's profit/loss + ↗/↘ arrow
  Tap target:    Entire card → Screen 3 (Tracker Hub)

  NO "Log Entry" button. NO secondary actions.
  Pure display. One tap destination.

  This card type is ONLY used in the "Recent Project" section.
  It shows the single most recently active project.
```

---

## MICROCOPY REFERENCE — ALL STATES

```
NET PROFIT CARD LABELS:

  State 1 main text:     "—"
  State 1 subtitle:      "No entries yet"
  State 1 info box:      "Setup invested: {amount} across {n} projects"

  State 2 subtitle:      "Net loss" or "Net profit"
  State 2 context:       "Tracking since {date} · {n} entries"

  State 3 subtitle:      "Net loss" or "Net profit"
  State 3 trend:         "▲ {n}% better vs last {period}" (if improving)
                         "▼ {n}% vs last {period}" (if declining)
  State 3 context:       "Based on {n} entries across {n} projects"

  State 4 context (varies):
    "Best month so far · {n} entries"
    "First profitable month 🎯"
    "{n} months of consecutive growth"
    "All {n} projects in profit this month"
    "Down from last month's peak · Review expenses"

SECTION TITLES:

  State 1: "YOUR PROJECTS"
           "Log your first entry to see performance"

  State 2: "RECENTLY UPDATED"
           "YOUR PROJECTS"

  State 3: "Recent Project"
           "BEST PERFORMING" / "Highest profit this {period}"
           "NEEDS ATTENTION" / "Declining or no recent activity"

TREND LABELS:
  Improving loss:     "▲ 50% better vs last month"
  Worsening loss:     "▼ 12% vs last month"
  New profit:         "▲ Turned profitable this month"
  Growing profit:     "▲ 24% vs last month"
  Declining profit:   "▼ 8% vs last month"
  No comparison:      (no trend shown)
  All time filter:    (no trend shown — no comparison period)

INCOME TREND:
  Up:    "▲ {n}%" (accent.positive)
  Down:  "▼ {n}%" (accent.negative)

EXPENSES TREND:
  Up:    "▲ {n}%" (accent.negative — more expenses = caution)
  Down:  "▼ {n}%" (accent.positive — less expenses = good)

MINI-CALENDAR SUMMARY:
  Current month:     "{n} days logged"
  Past month:        "{n} days logged in {Month}"
  Zero entries:      "0 days logged" / "0 days logged in {Month}"
```

---

## NAVIGATION MAP — DASHBOARD TAP TARGETS

```
SCREEN 1 TAP TARGETS:

  🔔 Notification bell          → Notifications (future)
  Net Profit card ℹ button      → Screen 1a (Detail Modal)
  Time period dropdown          → Opens period selector (7d / 30d / All)
  💡 Insights icon (V1.5)      → Screen 36 (Insights)
  Income card                   → No action (display only)
  Expenses card                 → No action (display only)
  Calendar header (month name)    → Collapse / expand calendar grid
  Calendar ◀ arrow              → Previous month view
  Calendar ▶ arrow              → Next month view (toward present only)
  Calendar day dots             → No action (passive, read-only)
  Recent Project card           → Screen 3 (Tracker Hub for that project)
  Best Performing project card  → Screen 3 (Tracker Hub for that project)
  Needs Attention project card  → Screen 3 (Tracker Hub for that project)
  Your Projects project card    → Screen 3 (Tracker Hub for that project)
  [View All] link               → Screen 35 (Projects List View)
  brand.primary FAB                     → Screen 2 (Create Project)
  Bottom nav: Home              → Current (active indicator)
  Bottom nav: Projects          → Screen 35 (Projects List View)
  Bottom nav: Settings          → Screen 34 (Settings Page)

KEY PRINCIPLE:
  Every project card taps to Screen 3 (Tracker Hub).
  From there, user can log entries, view reports, etc.
  There is ONE path to logging: Dashboard → Hub → Log.
  No dashboard shortcuts to Screen 7 (Log Entry).
```

---

## IMPLEMENTATION NOTES

```
PERFORMANCE:
  - State detection runs on dashboard load and time filter change
  - Cache the state — don't recalculate on every scroll
  - Trend calculations run against pre-aggregated data
  - Project sorting happens in-memory (small dataset)
  - Mini-calendar: one query per displayed month, cached per session

ANIMATIONS:
  - State transitions should NOT animate between states
  - Trend arrows/numbers should fade in (200ms) when they first appear
  - When user changes time filter: cross-fade numbers (not slide)
  - Calendar month change: crossfade dots (200ms), no page slide

DATABASE QUERIES:
  - State detection: COUNT entries grouped by period
  - Financial cards: SUM income, SUM expenses, CALCULATED profit
    for current + previous period
  - Project cards: SUM per project for current period + previous period
  - Project sorting: ORDER BY last_entry_date DESC (States 1-2),
    ORDER BY profit DESC (State 3+)
  - Calendar: SELECT DISTINCT DATE(entry_date) for displayed month

EDGE CASE: MIXED CURRENCIES
  If projects use different currencies:
  - Financial cards show primary currency (most projects or most entries)
  - Projects in other currencies shown with their own currency
  - No cross-currency aggregation in financial cards
  - Info box: "Showing FCFA projects only. 1 project in USD."

TIME FILTER vs CALENDAR INDEPENDENCE:
  The time period dropdown on the Net Profit card filters
  financial data (profit, income, expenses, trends).
  The mini-calendar is INDEPENDENT — it always shows
  calendar months of logging activity regardless of
  the selected time filter. These two components serve
  different purposes:
    - Dropdown → "How's my money doing in this period?"
    - Calendar → "How consistent is my logging habit?"
```

---

## DECISION LOG — DASHBOARD LAYOUT

```
| Decision                                   | Rationale                                           | Reversible? |
|--------------------------------------------|-----------------------------------------------------|-------------|
| 3 separate financial cards (not combined)  | Each number breathes; eye reads top→bottom naturally | Yes         |
| Dropdown on card (not pill selector)       | Filter lives where data lives; saves vertical space  | Yes         |
| Quick Actions removed entirely             | One path to logging (via Tracker Hub); less confusion | Yes         |
| 💡 Insights icon on profit card            | Direct path to insights; hidden pre-V1.5             | Yes         |
| Calendar between cards and projects        | Bridges financial summary and project detail          | Yes         |
| Calendar backward navigation only          | Users can review history; cannot navigate to future   | Yes         |
| ▶ hidden on current month                 | No forward past present; clean when not needed        | Yes         |
| Recent Project card has no Log button      | Logging exclusively through Tracker Hub               | Yes         |
| brand.primary FAB (not yellow)                 | Positive action, consistent with brand accent         | Yes         |
| Calendar is read-only (no tap-on-day)      | Keeps it simple; day drill-down belongs in reports    | Yes         |
| Calendar is collapsible                    | Returning users reclaim vertical space; defaults open | Yes         |
| Calendar independent of time filter        | Serves different purpose (habit vs. financial period) | Yes         |
| Mini-calendar shows in State 1 (0 entries) | Zero-dot calendar is itself the empty state visual    | Yes         |
| Calendar hidden in State 0 only            | No value in showing calendar before any project exists| Yes         |
| Missed days use text.disabled, not accent    | Neutral = "no entry"; Accent = "failure"             | Yes         |
```

---

**Document Version:** 2.0
**Last Updated:** March 2026
**Supersedes:** `dashboard-data-states-wireframes.md` V1.1 (February 2026)
**Applies to:** Screen 1 (Home Dashboard), Screen 21 (Empty State — redesigned)
**Related:** Screen 1a (Detail Modal), Screen 2 (Create Project), Screen 36 (Insights — V1.5)
**Status:** Ready for implementation
