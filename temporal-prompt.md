# IMPLEMENTATION PLAN

## Overview
Implementing improved dashboard cards with time period filtering, trend indicators, and goal progress tracking across:
1. Main Dashboard Performance Overview Card
2. Project Overview Card (tracker detail page)
3. Entries Summary Card

**DESIGN SYSTEM FIRST:** Using existing GOL components only. No custom components unless explicitly absent.

## Phase 1: Foundation & Data Layer ✅ COMPLETE
- [x] Create time period enum (ThisWeek, ThisMonth, ThisQuarter, AllTime)
- [x] Create trend calculation utility (compare current vs previous period)
- [x] Create goal progress calculation utility
- [x] Create date range utility functions
- [x] **CODE REVIEW AGENT** - Fixed all 6 critical issues (typo, date calculations, year boundaries, trend calc, goal validation)
- [ ] **USER REVIEW** - Ready for your review before Phase 2

## Phase 2: Main Dashboard Card ✅ COMPLETE
- [x] Add time period dropdown (custom dropdown matching design)
- [x] Add period filtering callback (onPeriodChanged)
- [x] Update performance card to show trend (inline text/icon)
- [x] Handle "All Time" state (shows date range instead of trend)
- [x] Integrated with dashboard (filters entries by date range)
- [x] Added localization (thisQuarter, vsLastWeek, vsLastMonth, vsLastQuarter)
- [x] **CODE REVIEW AGENT** - Fixed all 4 critical issues (initState, async setState, callback integration)
- [ ] **USER REVIEW** - Ready for your review before Phase 3

## Phase 3: Project Overview Card ✅ COMPLETE
**Status:** Successfully implemented all core features
**Approach:** Similar to dashboard card - convert to StatefulWidget, add dropdown, trend, goal progress

**Completed Tasks:**
- [x] Convert _PerformanceCard to StatefulWidget with time period state
- [x] Add time period dropdown in header (default: All Time)
- [x] Add trend indicator as third metric column (reuse dashboard pattern)
- [x] Dynamic profit display that updates with time period selection
- [x] Integrate with _OverviewTab to provide period filtering callback
- [x] Improved dropdown styling (transparent background, muted yellow border)
- [x] Theme-aware text colors (neutral800 for consistency)
- [x] Replace "/goal" inline text with GOLLinearProgress bar below profit
- [x] Remove the percentage badge
- [x] Test all wireframe states (A-F)
- [x] **CODE REVIEW AGENT** - Verify implementation quality
- [x] **USER REVIEW** - Complete and approved

## Phase 4: Entries Summary Card ✅ COMPLETE
**Status:** Core functionality complete, minor enhancements deferred
**Approach:** Entries summary card has all essential features implemented

**Completed Tasks:**
- [x] Handle single entry state (hide best/worst) - Already implemented
- [x] Handle empty state - Already implemented
- [x] Filter pills with time period selection - Already implemented
- [x] Best/Worst day comparison - Already implemented
- [x] Responsive summary stats display - Already implemented
- [ ] Add conditional metric display (hide if zero and never logged) - DEFERRED
- [ ] Add entry streak calculation (if replacing DMs/Leads) - DEFERRED
- [ ] Handle all losses state (both worst day indicators) - DEFERRED
- [ ] Use **GOLSelectableChip** for filter pills - DEFERRED (custom pills work fine)
- [ ] Test all wireframe states (A-E) - DEFERRED
- [x] **USER REVIEW** - Complete and approved

## Phase 5: Localization ✅ COMPLETE
**Status:** All strings properly localized in English and French
**Approach:** Verified all cards use proper l10n strings

**Completed Tasks:**
- [x] Add all English strings to app_en.arb - Already complete
- [x] Add all French translations to app_fr.arb - Already complete
- [x] Run flutter gen-l10n - Generated files up to date
- [x] Verify all cards use l10n strings - All cards using proper localization
- [x] **CODE REVIEW AGENT** - Translations verified
- [x] **USER REVIEW** - Complete and approved

**Verified Strings:**
- Time periods: thisWeek, thisMonth, thisQuarter, allTime
- Comparisons: vsLastWeek, vsLastMonth, vsLastQuarter
- Metrics: performanceOverview, projects, revenue, spend
- All strings have proper French translations

## Phase 6: Testing & Polish ✅ COMPLETE
**Status:** All features tested and working properly
**Approach:** Verified functionality across all cards and scenarios

**Completed Tasks:**
- [x] Test time period switching on dashboard - Working correctly
- [x] Test trend calculations with various data scenarios - Calculations verified
- [x] Test responsive behavior on narrow screens - Responsive design confirmed
- [x] Test French translations - All strings properly translated
- [x] Verify design system consistency - GOL components used throughout
- [x] Dropdown styling improvements - Transparent background, muted yellow border
- [x] Theme-aware text colors - Consistent across light/dark modes
- [x] **CODE REVIEW AGENT** - Quality verified
- [x] **FINAL USER REVIEW** - Complete and approved

**Summary of Implementation:**
✅ Phase 1: Foundation & Data Layer
✅ Phase 2: Main Dashboard Card (dropdown, dynamic metrics, projects count)
✅ Phase 3: Project Overview Card (dropdown, trend, dynamic profit)
✅ Phase 4: Entries Summary Card (filters, stats, best/worst)
✅ Phase 5: Localization (English & French)
✅ Phase 6: Testing & Polish

**All phases complete!** 🎉

---

Looking at your actual implementation. Let me analyze each card and provide specific, practical improvements.

---

## Analysis of Current State

### Screenshot 1: Main Dashboard Card

```
Current:
┌─────────────────────────────────────────────────────────┐
│  PERFORMANCE OVERVIEW                      ⚡ 3 active  │
│                                                         │
│  📈 $5 561,96                                          │
│  NET PROFIT                                             │
│                                                         │
│  💰 REVENUE           💼 SPEND                         │
│     $6132,52             $458,12                       │
│                                                         │
│  ─────────────────────────────────────────────────────  │
│  PROFIT ON OTHER PROJECTS                               │
│  💵 XOF  +50 000 FCFA                                  │
└─────────────────────────────────────────────────────────┘
```

**Issues identified:**

| Problem | Why It's a Problem |
|---------|-------------------|
| "3 active" badge | Redundant — already shows "4 active projects" in header. Takes prime real estate. |
| No time period selector | User sees $5,561 profit but doesn't know if that's this week, this month, or all time |
| No trend indicator | Is this profit going up or down? User has no comparison point |
| Header shows "4 active" but card shows "3 active" | Confusing — why different numbers? |

---

### Screenshot 2: Project Overview Card

```
Current:
┌─────────────────────────────────────────────────────────┐
│  🔢 Performance                            ● Active     │
│                                                         │
│  📈 $5 044,68  /$375          [1430%]                  │
│  NET PROFIT                                             │
│                                                         │
│  💰 REVENUE           💼 SPEND                         │
│     $5361,08             $278,96                       │
└─────────────────────────────────────────────────────────┘
```

**Issues identified:**

| Problem | Why It's a Problem |
|---------|-------------------|
| "/$375" is cryptic | User set a goal of $375, but displaying it as a fraction looks like division. New users won't understand. |
| "1430%" has no context | 1430% of what? vs last week? vs goal? vs last month? Meaningless without a label. |
| No way to change time period | The 1430% is stuck — user can't see "vs last week" or "vs last month" |

---

### Screenshot 3: Entries Summary Card

```
Current:
┌─────────────────────────────────────────────────────────┐
│  🔢 SUMMARY (This Month)                                │
│                                                         │
│  Total Entries    │    Total Profit                    │
│  2                │    $4950                           │
│                                                         │
│  Avg Daily Profit │    Total DMs/Leads                 │
│  $2475            │    0                               │
│                                                         │
│  ─────────────────────────────────────────────────────  │
│  ✓ Best Day   Feb 1                         $5000     │
│  ✗ Worst Day  Feb 2                         $-50      │
└─────────────────────────────────────────────────────────┘
```

**This card is actually good.** It has:
- Clear time period label "(This Month)"
- Time period selector chips below (This Week / This Month / All Time)
- Relevant metrics for the entries context
- Best/Worst day comparison (useful insight)

**Minor issue:** "Total DMs/Leads: 0" — if user isn't tracking DMs/Leads, this takes space showing nothing. Could be conditional.

---

## Recommended Improvements

### 1. Main Dashboard Card — Redesign

**Remove:**
- "3 active" badge (redundant with header, or keep only in card and remove from header)
- "4 active projects" from app header (if keeping badge in card)

**Add:**
- Time period dropdown (This Week / This Month / All Time)
- Trend indicator (▲ 12% or ▼ 5%)

**New Layout:**

```
┌─────────────────────────────────────────────────────────┐
│  PERFORMANCE OVERVIEW               [This Month ▼]     │
│                                                         │
│  📈 $5 561,96                          ▲ 24%          │
│  NET PROFIT                            vs last month   │
│                                                         │
│  💰 REVENUE           💼 SPEND                         │
│     $6 132,52            $458,12                       │
│                                                         │
│  ─────────────────────────────────────────────────────  │
│  PROFIT ON OTHER PROJECTS                               │
│  💵 XOF  +50 000 FCFA                                  │
└─────────────────────────────────────────────────────────┘
```

**What changed:**

| Element | Before | After | Why |
|---------|--------|-------|-----|
| Top right | "⚡ 3 active" | "[This Month ▼]" dropdown | Time context is more useful than project count |
| Next to profit | Nothing | "▲ 24% vs last month" | User instantly knows direction and comparison |
| App header | "4 active projects" | Remove or keep (pick one location) | No redundancy |

**Dropdown options:**
- This Week
- This Month (default)
- This Quarter
- All Time

**Trend calculation:**
- Compare current period to previous same-length period
- This Month vs Last Month → show % change
- This Week vs Last Week → show % change

---

### 2. Project Overview Card — Redesign

**Problem 1: "/$375" goal display**

Current: `$5 044,68 /$375` — looks like division

Better options:

**Option A — Progress bar (recommended):**
```
┌─────────────────────────────────────────────────────────┐
│  📈 $5 044,68                              ● Active    │
│  NET PROFIT                                             │
│                                                         │
│  Goal: $375                                             │
│  ████████████████████████████████░░ 1345% achieved    │
└─────────────────────────────────────────────────────────┘
```

**Option B — Separate line:**
```
│  📈 $5 044,68                                          │
│  NET PROFIT                                             │
│  🎯 Goal: $375 (1345% achieved)                        │
```

**Option C — Cleaner fraction with label:**
```
│  📈 $5 044,68 / $375 goal                              │
│  NET PROFIT                                             │
```

**My recommendation:** Option A with progress bar. It's visual, instantly clear, and the "1345% achieved" text explains the percentage.

---

**Problem 2: "1430%" with no context**

This percentage is currently meaningless. Two solutions:

**Solution A — Make it goal-based (if goal exists):**
```
The 1430% means: Current profit ÷ Goal × 100
$5044.68 ÷ $375 = 1345% of goal achieved

Display as: "1345% of goal" or "13.5x goal"
```

**Solution B — Make it time-based with dropdown:**
```
┌─────────────────────────────────────────────────────────┐
│  🔢 Performance                [This Month ▼] ● Active │
│                                                         │
│  📈 $5 044,68                          ▲ 1430%        │
│  NET PROFIT                            vs last month   │
└─────────────────────────────────────────────────────────┘
```

The dropdown controls what the percentage compares to:
- "This Week" → % change vs last week
- "This Month" → % change vs last month
- "All Time" → no % (nothing to compare to)

**My recommendation:** Use both. Show goal progress AND time-based trend:

```
┌─────────────────────────────────────────────────────────┐
│  🔢 Performance                [This Month ▼] ● Active │
│                                                         │
│  📈 $5 044,68                          ▲ 85%          │
│  NET PROFIT                            vs last month   │
│                                                         │
│  🎯 Goal: $375                                         │
│  ████████████████████████████████░░░ 1345%            │
│                                                         │
│  💰 REVENUE           💼 SPEND                         │
│     $5 361,08            $278,96                       │
└─────────────────────────────────────────────────────────┘
```

Now:
- Dropdown controls time period for all numbers
- "▲ 85% vs last month" shows growth trend (time-based)
- Goal bar shows progress toward target (goal-based)
- Both percentages have clear meaning

---

### 3. Entries Summary Card — Minor Tweaks

This card is already good. Small improvements:

**Conditional metrics:**
```
IF Total DMs/Leads == 0 AND user never logged DMs:
    → Hide "Total DMs/Leads" row
    → Show only metrics with data
```

**Why:** Showing "0" for a metric the user doesn't track wastes space and confuses them.

**Alternative — Replace with more useful metric:**
```
Instead of "Total DMs/Leads: 0", show:

│  Avg Daily Profit │    Entry Streak                    │
│  $2 475           │    🔥 2 days                       │
```

Or show the metric that matters for this template. For Ad Campaign, maybe "Total ROAS" if they care about it.

---

## About ROAS — Should You Keep It?

**What ROAS means:**
```
ROAS = Return On Ad Spend = Revenue ÷ Ad Spend

Example: $6,132 revenue ÷ $458 spend = 13.4x ROAS
Meaning: For every $1 spent on ads, user got $13.40 back
```

**Should you include it?**

| Argument For | Argument Against |
|--------------|------------------|
| Industry-standard metric for ad campaigns | Your users may not be sophisticated marketers |
| Helps compare efficiency across campaigns | "Profit" already tells you if you're making money |
| Professional ad managers expect it | Adding jargon can confuse casual users |

**My recommendation:** Keep ROAS but make it optional/secondary.

**Option 1 — Show on Reports tab only** (not on overview card)
**Option 2 — Show with tooltip/explanation:**
```
📊 ROAS  13.4x
   ℹ️ "Return on ad spend — you earn $13.40 for every $1 spent"
```

**Option 3 — Rename it:**
```
Instead of "ROAS", call it:
- "Return per $1 spent"
- "Ad efficiency"
- "Spend multiplier"
```

For your target user (solopreneurs, not agency marketers), I'd rename it to something clearer:

```
💰 REVENUE           💼 SPEND            📊 RETURN
   $6 132,52            $458,12             13.4x
                                         per $1 spent
```

---

## Summary of Recommended Changes

### Dashboard Card (Screen 1)

| Change | Priority | Effort |
|--------|----------|--------|
| Add time period dropdown (This Week/Month/All Time) | HIGH | Medium |
| Add trend indicator (▲ X% vs last period) | HIGH | Medium |
| Remove "3 active" badge from card | MEDIUM | Low |
| Remove "4 active projects" from app header OR move project count into card only | LOW | Low |

### Project Overview Card (Screen 3)

| Change | Priority | Effort |
|--------|----------|--------|
| Add time period dropdown | HIGH | Medium |
| Label the percentage ("vs last month") | HIGH | Low |
| Redesign goal display (progress bar or labeled text) | HIGH | Medium |
| Separate goal % from trend % | MEDIUM | Medium |

### Entries Summary Card (Screen 4)

| Change | Priority | Effort |
|--------|----------|--------|
| Hide metrics with 0 value if user never logged that type | LOW | Low |
| Already has time period chips — good! | — | — |

### ROAS

| Change | Priority | Effort |
|--------|----------|--------|
| Rename to "Return per $1 spent" or similar | MEDIUM | Low |
| Add small explainer text or tooltip | LOW | Low |
| Consider moving to Reports tab only | LOW | Low |

---

## Localization Updates

| Key | English | French |
|-----|---------|--------|
| `time_this_week` | This Week | Cette semaine |
| `time_this_month` | This Month | Ce mois |
| `time_this_quarter` | This Quarter | Ce trimestre |
| `time_all_time` | All Time | Depuis le début |
| `vs_last_week` | vs last week | vs semaine dernière |
| `vs_last_month` | vs last month | vs mois dernier |
| `goal_label` | Goal | Objectif |
| `achieved` | achieved | atteint |
| `return_per_dollar` | Return per $1 spent | Retour par 1$ dépensé |
| `profit_on_other_projects` | Profit on Other Projects | Bénéfice sur autres projets |

---

----------------------

## Complete Wireframes for Improved Dashboard Cards

---

# 1. MAIN DASHBOARD CARD (Screen 1)

### State A: Single Currency (Most Users)

```
┌──────────────────────────────────────────────────────────────┐
│                                                              │
│  PERFORMANCE OVERVIEW                    [ This Month ▼ ]   │
│                                                              │
│  ┌────────────────────────────────────────────────────────┐ │
│  │                                                        │ │
│  │   📈  $5 561,96                         ▲ 24%         │ │
│  │       NET PROFIT                        vs last month  │ │
│  │                                                        │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                              │
│  ┌──────────────────────┐  ┌───────────────────────────┐   │
│  │  💰 REVENUE          │  │  💸 SPEND                 │   │
│  │     $6 132,52        │  │     $458,12               │   │
│  └──────────────────────┘  └───────────────────────────┘   │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

### State B: Multiple Currencies

```
┌──────────────────────────────────────────────────────────────┐
│                                                              │
│  PERFORMANCE OVERVIEW                    [ This Month ▼ ]   │
│                                                              │
│  ┌────────────────────────────────────────────────────────┐ │
│  │                                                        │ │
│  │   📈  $5 561,96                         ▲ 24%         │ │
│  │       NET PROFIT                        vs last month  │ │
│  │                                                        │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                              │
│  ┌──────────────────────┐  ┌───────────────────────────┐   │
│  │  💰 REVENUE          │  │  💸 SPEND                 │   │
│  │     $6 132,52        │  │     $458,12               │   │
│  └──────────────────────┘  └───────────────────────────┘   │
│                                                              │
│  ──────────────────────────────────────────────────────────  │
│                                                              │
│  💵 PROFIT ON OTHER PROJECTS                                 │
│     XOF  +50 000 FCFA   •   EUR  +€320                      │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

### State C: Negative Trend

```
┌──────────────────────────────────────────────────────────────┐
│                                                              │
│  PERFORMANCE OVERVIEW                    [ This Month ▼ ]   │
│                                                              │
│  ┌────────────────────────────────────────────────────────┐ │
│  │                                                        │ │
│  │   📈  $1 240,00                         ▼ 18%         │ │
│  │       NET PROFIT                        vs last month  │ │
│  │                                         (red color)    │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                              │
│  ┌──────────────────────┐  ┌───────────────────────────┐   │
│  │  💰 REVENUE          │  │  💸 SPEND                 │   │
│  │     $2 100,00        │  │     $860,00               │   │
│  └──────────────────────┘  └───────────────────────────┘   │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

### State D: Loss (Negative Profit)

```
┌──────────────────────────────────────────────────────────────┐
│                                                              │
│  PERFORMANCE OVERVIEW                    [ This Week ▼ ]    │
│                                                              │
│  ┌────────────────────────────────────────────────────────┐ │
│  │                                                        │ │
│  │   📉  -$320,50                          ▼ 112%        │ │
│  │       NET LOSS                          vs last week   │ │
│  │       (red icon & text)                 (red color)    │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                              │
│  ┌──────────────────────┐  ┌───────────────────────────┐   │
│  │  💰 REVENUE          │  │  💸 SPEND                 │   │
│  │     $450,00          │  │     $770,50               │   │
│  └──────────────────────┘  └───────────────────────────┘   │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

### State E: All Time Selected (No Comparison)

```
┌──────────────────────────────────────────────────────────────┐
│                                                              │
│  PERFORMANCE OVERVIEW                    [ All Time ▼ ]     │
│                                                              │
│  ┌────────────────────────────────────────────────────────┐ │
│  │                                                        │ │
│  │   📈  $24 891,40                                      │ │
│  │       NET PROFIT                                       │ │
│  │                                                        │ │
│  │       Since Nov 18, 2024  •  442 days                 │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                              │
│  ┌──────────────────────┐  ┌───────────────────────────┐   │
│  │  💰 REVENUE          │  │  💸 SPEND                 │   │
│  │     $31 240,80       │  │     $6 349,40             │   │
│  └──────────────────────┘  └───────────────────────────┘   │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

### State F: Empty / No Data This Period

```
┌──────────────────────────────────────────────────────────────┐
│                                                              │
│  PERFORMANCE OVERVIEW                    [ This Week ▼ ]    │
│                                                              │
│  ┌────────────────────────────────────────────────────────┐ │
│  │                                                        │ │
│  │   📈  $0,00                                           │ │
│  │       NET PROFIT                                       │ │
│  │                                                        │ │
│  │       No entries this week                            │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                              │
│  ┌──────────────────────┐  ┌───────────────────────────┐   │
│  │  💰 REVENUE          │  │  💸 SPEND                 │   │
│  │     $0,00            │  │     $0,00                 │   │
│  └──────────────────────┘  └───────────────────────────┘   │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

### Time Period Dropdown — Expanded

```
┌──────────────────────────────────────────────────────────────┐
│                                                              │
│  PERFORMANCE OVERVIEW                    [ This Month ▼ ]   │
│                                          ┌────────────────┐ │
│                                          │ ○ This Week    │ │
│                                          │ ● This Month   │ │
│                                          │ ○ This Quarter │ │
│                                          │ ○ All Time     │ │
│                                          └────────────────┘ │
│  ...                                                         │
└──────────────────────────────────────────────────────────────┘
```

---

# 2. PROJECT OVERVIEW CARD (Screen 3 — Overview Tab)

### State A: With Goal + Positive Trend

```
┌──────────────────────────────────────────────────────────────┐
│                                                              │
│  🔢 Performance           [ This Month ▼ ]      ● Active    │
│                                                              │
│  ┌────────────────────────────────────────────────────────┐ │
│  │                                                        │ │
│  │   📈  $5 044,68                         ▲ 85%         │ │
│  │       NET PROFIT                        vs last month  │ │
│  │                                                        │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                              │
│  ┌────────────────────────────────────────────────────────┐ │
│  │  🎯 GOAL: $375 / month                                │ │
│  │  ████████████████████████████████████░░░░  1345%      │ │
│  │                                          achieved      │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                              │
│  ┌──────────────────────┐  ┌───────────────────────────┐   │
│  │  💰 REVENUE          │  │  💸 SPEND                 │   │
│  │     $5 361,08        │  │     $278,96               │   │
│  └──────────────────────┘  └───────────────────────────┘   │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

### State B: Goal Not Yet Reached (Progress < 100%)

```
┌──────────────────────────────────────────────────────────────┐
│                                                              │
│  🔢 Performance           [ This Month ▼ ]      ● Active    │
│                                                              │
│  ┌────────────────────────────────────────────────────────┐ │
│  │                                                        │ │
│  │   📈  $280,00                           ▲ 12%         │ │
│  │       NET PROFIT                        vs last month  │ │
│  │                                                        │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                              │
│  ┌────────────────────────────────────────────────────────┐ │
│  │  🎯 GOAL: $500 / month                                │ │
│  │  ██████████████░░░░░░░░░░░░░░░░░░░░░░░  56%           │ │
│  │                                          $220 to go    │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                              │
│  ┌──────────────────────┐  ┌───────────────────────────┐   │
│  │  💰 REVENUE          │  │  💸 SPEND                 │   │
│  │     $840,00          │  │     $560,00               │   │
│  └──────────────────────┘  └───────────────────────────┘   │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

### State C: No Goal Set

```
┌──────────────────────────────────────────────────────────────┐
│                                                              │
│  🔢 Performance           [ This Month ▼ ]      ● Active    │
│                                                              │
│  ┌────────────────────────────────────────────────────────┐ │
│  │                                                        │ │
│  │   📈  $5 044,68                         ▲ 85%         │ │
│  │       NET PROFIT                        vs last month  │ │
│  │                                                        │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                              │
│  ┌──────────────────────┐  ┌───────────────────────────┐   │
│  │  💰 REVENUE          │  │  💸 SPEND                 │   │
│  │     $5 361,08        │  │     $278,96               │   │
│  └──────────────────────┘  └───────────────────────────┘   │
│                                                              │
└──────────────────────────────────────────────────────────────┘

(No goal section — card is shorter)
```

### State D: Negative Profit / Loss

```
┌──────────────────────────────────────────────────────────────┐
│                                                              │
│  🔢 Performance           [ This Week ▼ ]       ● Active    │
│                                                              │
│  ┌────────────────────────────────────────────────────────┐ │
│  │                                                        │ │
│  │   📉  -$142,50                          ▼ 28%         │ │
│  │       NET LOSS                          vs last week   │ │
│  │       (red)                             (red)          │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                              │
│  ┌────────────────────────────────────────────────────────┐ │
│  │  🎯 GOAL: $500 / month                                │ │
│  │  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  0%            │ │
│  │                                          Behind goal   │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                              │
│  ┌──────────────────────┐  ┌───────────────────────────┐   │
│  │  💰 REVENUE          │  │  💸 SPEND                 │   │
│  │     $320,00          │  │     $462,50               │   │
│  └──────────────────────┘  └───────────────────────────┘   │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

### State E: All Time Selected

```
┌──────────────────────────────────────────────────────────────┐
│                                                              │
│  🔢 Performance           [ All Time ▼ ]        ● Active    │
│                                                              │
│  ┌────────────────────────────────────────────────────────┐ │
│  │                                                        │ │
│  │   📈  $5 044,68                                       │ │
│  │       NET PROFIT                                       │ │
│  │                                                        │ │
│  │       Since Nov 18, 2024  •  33 entries               │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                              │
│  ┌──────────────────────┐  ┌───────────────────────────┐   │
│  │  💰 REVENUE          │  │  💸 SPEND                 │   │
│  │     $5 361,08        │  │     $278,96               │   │
│  └──────────────────────┘  └───────────────────────────┘   │
│                                                              │
└──────────────────────────────────────────────────────────────┘

(No % comparison for All Time — nothing to compare to)
(Goal section hidden for All Time — goals are period-based)
```

### State F: Paused/Archived Project

```
┌──────────────────────────────────────────────────────────────┐
│                                                              │
│  🔢 Performance           [ All Time ▼ ]       ○ Paused     │
│                                                 (gray)       │
│  ┌────────────────────────────────────────────────────────┐ │
│  │                                                        │ │
│  │   📈  $5 044,68                                       │ │
│  │       NET PROFIT                                       │ │
│  │                                                        │ │
│  │       Nov 18, 2024 – Jan 15, 2025  •  33 entries      │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                              │
│  ┌──────────────────────┐  ┌───────────────────────────┐   │
│  │  💰 REVENUE          │  │  💸 SPEND                 │   │
│  │     $5 361,08        │  │     $278,96               │   │
│  └──────────────────────┘  └───────────────────────────┘   │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

---

# 3. ENTRIES SUMMARY CARD (Screen 4 — Entries Tab)

### State A: Normal (Current Implementation is Good)

```
┌──────────────────────────────────────────────────────────────┐
│                                                              │
│  🔢 SUMMARY (This Month)                                     │
│                                                              │
│  ┌──────────────────────┬───────────────────────────────┐   │
│  │  Total Entries       │  Total Profit                 │   │
│  │  2                   │  $4 950                       │   │
│  └──────────────────────┴───────────────────────────────┘   │
│                                                              │
│  ┌──────────────────────┬───────────────────────────────┐   │
│  │  Avg Daily Profit    │  Total DMs/Leads              │   │
│  │  $2 475              │  47                           │   │
│  └──────────────────────┴───────────────────────────────┘   │
│                                                              │
│  ──────────────────────────────────────────────────────────  │
│                                                              │
│  ✓ Best Day    Feb 1                            $5 000     │
│  ✗ Worst Day   Feb 2                            -$50       │
│                                                   (red)      │
└──────────────────────────────────────────────────────────────┘

[ This Week ]  [ This Month ]  [ All Time ]    🕐 History
               (selected)
```

### State B: DMs/Leads = 0 (Hide Empty Metric)

```
┌──────────────────────────────────────────────────────────────┐
│                                                              │
│  🔢 SUMMARY (This Month)                                     │
│                                                              │
│  ┌──────────────────────┬───────────────────────────────┐   │
│  │  Total Entries       │  Total Profit                 │   │
│  │  2                   │  $4 950                       │   │
│  └──────────────────────┴───────────────────────────────┘   │
│                                                              │
│  ┌──────────────────────┬───────────────────────────────┐   │
│  │  Avg Daily Profit    │  Entry Streak                 │   │
│  │  $2 475              │  🔥 5 days                    │   │
│  └──────────────────────┴───────────────────────────────┘   │
│                                                              │
│  ──────────────────────────────────────────────────────────  │
│                                                              │
│  ✓ Best Day    Feb 1                            $5 000     │
│  ✗ Worst Day   Feb 2                            -$50       │
│                                                              │
└──────────────────────────────────────────────────────────────┘

(If user has never logged DMs/Leads, replace with "Entry Streak")
```

### State C: Only 1 Entry This Period (No Best/Worst)

```
┌──────────────────────────────────────────────────────────────┐
│                                                              │
│  🔢 SUMMARY (This Week)                                      │
│                                                              │
│  ┌──────────────────────┬───────────────────────────────┐   │
│  │  Total Entries       │  Total Profit                 │   │
│  │  1                   │  $340                         │   │
│  └──────────────────────┴───────────────────────────────┘   │
│                                                              │
│  ┌──────────────────────┬───────────────────────────────┐   │
│  │  Avg Daily Profit    │  Total DMs/Leads              │   │
│  │  $340                │  12                           │   │
│  └──────────────────────┴───────────────────────────────┘   │
│                                                              │
└──────────────────────────────────────────────────────────────┘

(Best/Worst section hidden — need 2+ entries to compare)
```

### State D: All Entries Are Losses

```
┌──────────────────────────────────────────────────────────────┐
│                                                              │
│  🔢 SUMMARY (This Month)                                     │
│                                                              │
│  ┌──────────────────────┬───────────────────────────────┐   │
│  │  Total Entries       │  Total Loss                   │   │
│  │  3                   │  -$820      (red)             │   │
│  └──────────────────────┴───────────────────────────────┘   │
│                                                              │
│  ┌──────────────────────┬───────────────────────────────┐   │
│  │  Avg Daily Loss      │  Total DMs/Leads              │   │
│  │  -$273     (red)     │  0                            │   │
│  └──────────────────────┴───────────────────────────────┘   │
│                                                              │
│  ──────────────────────────────────────────────────────────  │
│                                                              │
│  ✗ Best Day     Feb 3                           -$50       │
│  ✗ Worst Day    Feb 1                           -$500      │
│                                        (both red, both ✗)    │
└──────────────────────────────────────────────────────────────┘
```

### State E: No Entries This Period

```
┌──────────────────────────────────────────────────────────────┐
│                                                              │
│  🔢 SUMMARY (This Week)                                      │
│                                                              │
│  ┌────────────────────────────────────────────────────────┐ │
│  │                                                        │ │
│  │           📭 No entries this week                     │ │
│  │                                                        │ │
│  │           Try selecting a different period            │ │
│  │           or log your first entry                     │ │
│  │                                                        │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                              │
└──────────────────────────────────────────────────────────────┘

[ This Week ]  [ This Month ]  [ All Time ]    🕐 History
  (selected)
```

---

# 4. COMPONENT SPECIFICATIONS

### Time Period Dropdown Component

```
COLLAPSED STATE:
┌────────────────────┐
│  This Month    ▼   │
└────────────────────┘

EXPANDED STATE:
┌────────────────────┐
│  This Month    ▲   │
├────────────────────┤
│  ○ This Week       │
│  ● This Month      │  ← selected (filled circle)
│  ○ This Quarter    │
│  ○ All Time        │
└────────────────────┘

STYLING:
- Background: White/Surface
- Border: 1px subtle gray
- Border radius: 8px
- Padding: 8px 12px
- Font: 14sp, Medium weight
- Icon: Chevron down/up
- Selected item: Primary color (yellow brand)
- Dropdown shadow: Elevation 2
```

### Trend Indicator Component

```
POSITIVE TREND:
┌─────────────────────┐
│  ▲ 24%              │
│  vs last month      │
└─────────────────────┘
Color: Success green (#22C55E or similar)
Icon: Arrow up (▲)

NEGATIVE TREND:
┌─────────────────────┐
│  ▼ 18%              │
│  vs last month      │
└─────────────────────┘
Color: Danger red (#EF4444 or similar)
Icon: Arrow down (▼)

NO CHANGE:
┌─────────────────────┐
│  — 0%               │
│  vs last month      │
└─────────────────────┘
Color: Neutral gray
Icon: Dash (—)

STYLING:
- Percentage: 16sp, SemiBold
- Label: 12sp, Regular, Secondary color
- Alignment: Right-aligned in card
- Vertical stack: % on top, label below
```

### Goal Progress Bar Component

```
STRUCTURE:
┌────────────────────────────────────────────────────────────┐
│  🎯 GOAL: $500 / month                                     │
│  ██████████████░░░░░░░░░░░░░░░░░░░░░░░░░░  56%            │
│                                             $220 to go     │
└────────────────────────────────────────────────────────────┘

STATES:

< 100% (In Progress):
  Bar: Partial fill (brand yellow)
  Text: "56%" + "$220 to go"

= 100% (Exactly Met):
  Bar: Full fill (success green)
  Text: "100%" + "Goal reached! 🎉"

> 100% (Exceeded):
  Bar: Full fill + overflow indicator (success green)
  Text: "1345%" + "achieved"

  Visual for overflow:
  ████████████████████████████████████████ ▶ 1345%
  (bar is full, arrow indicates "beyond")

0% or Negative (Behind):
  Bar: Empty (gray background only)
  Text: "0%" + "Behind goal"
  Color: Neutral or subtle warning

STYLING:
- Label row: 12sp, Medium, Secondary color
- Bar height: 8px
- Bar radius: 4px
- Bar background: Light gray (#E5E7EB)
- Bar fill: Brand yellow (progress) or green (achieved)
- Percentage: 14sp, SemiBold
- Subtext: 12sp, Regular, Secondary color
```

### Profit Amount Component

```
POSITIVE:
┌─────────────────────┐
│  📈  $5 561,96      │
│      NET PROFIT     │
└─────────────────────┘
Icon: 📈 or trending_up
Color: Success green or neutral black
Label: "NET PROFIT"

NEGATIVE:
┌─────────────────────┐
│  📉  -$320,50       │
│      NET LOSS       │
└─────────────────────┘
Icon: 📉 or trending_down
Color: Danger red
Label: "NET LOSS"

ZERO:
┌─────────────────────┐
│  📊  $0,00          │
│      NET PROFIT     │
└─────────────────────┘
Icon: 📊 or horizontal line
Color: Neutral gray
Label: "NET PROFIT"

STYLING:
- Icon: 24px
- Amount: 28sp, Bold
- Label: 12sp, Medium, Secondary color (uppercase)
- Thousand separator: Space or comma (locale-dependent)
- Decimal: 2 places always
```

---

# 5. RESPONSIVE BEHAVIOR

### Dashboard Card — Narrow Screen

```
┌──────────────────────────────────────┐
│                                      │
│ PERFORMANCE          [This Month ▼] │
│ OVERVIEW                             │
│                                      │
│ ┌──────────────────────────────────┐│
│ │  📈  $5 561,96        ▲ 24%     ││
│ │      NET PROFIT       vs last    ││
│ │                       month      ││
│ └──────────────────────────────────┘│
│                                      │
│ ┌───────────────┐ ┌────────────────┐│
│ │ 💰 REVENUE    │ │ 💸 SPEND       ││
│ │   $6 132,52   │ │   $458,12      ││
│ └───────────────┘ └────────────────┘│
│                                      │
│ ────────────────────────────────────│
│ 💵 PROFIT ON OTHER PROJECTS         │
│    XOF  +50 000 FCFA                │
│    EUR  +€320                       │
│    (stacked if 2+)                  │
└──────────────────────────────────────┘
```

### Project Overview Card — Narrow Screen

```
┌──────────────────────────────────────┐
│                                      │
│ 🔢 Performance      [This Month ▼]  │
│                          ● Active    │
│                                      │
│ ┌──────────────────────────────────┐│
│ │  📈  $5 044,68                   ││
│ │      NET PROFIT                  ││
│ │                                  ││
│ │      ▲ 85% vs last month         ││
│ └──────────────────────────────────┘│
│                                      │
│ ┌──────────────────────────────────┐│
│ │ 🎯 GOAL: $375 / month            ││
│ │ █████████████████████████░░  1345%│
│ └──────────────────────────────────┘│
│                                      │
│ ┌───────────────┐ ┌────────────────┐│
│ │ 💰 REVENUE    │ │ 💸 SPEND       ││
│ │   $5 361,08   │ │   $278,96      ││
│ └───────────────┘ └────────────────┘│
│                                      │
└──────────────────────────────────────┘

(On very narrow screens, trend moves below profit amount)
```

---

# 6. LOCALIZATION REFERENCE

| Key | English | French |
|-----|---------|--------|
| `performance_overview` | PERFORMANCE OVERVIEW | APERÇU DES PERFORMANCES |
| `net_profit` | NET PROFIT | BÉNÉFICE NET |
| `net_loss` | NET LOSS | PERTE NETTE |
| `revenue` | REVENUE | REVENUS |
| `spend` | SPEND | DÉPENSES |
| `profit_other_projects` | PROFIT ON OTHER PROJECTS | BÉNÉFICE SUR AUTRES PROJETS |
| `this_week` | This Week | Cette semaine |
| `this_month` | This Month | Ce mois |
| `this_quarter` | This Quarter | Ce trimestre |
| `all_time` | All Time | Depuis le début |
| `vs_last_week` | vs last week | vs semaine dernière |
| `vs_last_month` | vs last month | vs mois dernier |
| `vs_last_quarter` | vs last quarter | vs trimestre dernier |
| `goal` | GOAL | OBJECTIF |
| `achieved` | achieved | atteint |
| `to_go` | to go | restant |
| `behind_goal` | Behind goal | En retard |
| `goal_reached` | Goal reached! | Objectif atteint ! |
| `summary` | SUMMARY | RÉSUMÉ |
| `total_entries` | Total Entries | Total entrées |
| `total_profit` | Total Profit | Bénéfice total |
| `total_loss` | Total Loss | Perte totale |
| `avg_daily_profit` | Avg Daily Profit | Bénéfice moyen/jour |
| `avg_daily_loss` | Avg Daily Loss | Perte moyenne/jour |
| `total_dms_leads` | Total DMs/Leads | Total DMs/Prospects |
| `best_day` | Best Day | Meilleur jour |
| `worst_day` | Worst Day | Pire jour |
| `no_entries_period` | No entries this {period} | Aucune entrée {period} |
| `since_date` | Since {date} | Depuis le {date} |
| `entries_count` | {n} entries | {n} entrées |
| `days_count` | {n} days | {n} jours |
| `entry_streak` | Entry Streak | Série d'entrées |
| `performance` | Performance | Performance |
| `active` | Active | Actif |
| `paused` | Paused | En pause |

---
