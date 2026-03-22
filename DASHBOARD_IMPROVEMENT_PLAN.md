# Dashboard Improvement Plan
## Wireframe Spec → Code Implementation

> **THIS IS THE ONLY SOURCE OF TRUTH FOR THIS WORK.**
> Do NOT create any additional planning documents, spec files, or implementation notes.
> All decisions, changes, and validations are tracked here only.
>
> **No database changes.** All edits are pure UI/logic — fully revertable with `git checkout`.

---

## GAP ANALYSIS: What exists vs. what the spec wants

### Current code (what we have)
- **State 0 (empty):** SVG + "Welcome to RHYDLE" + two paragraphs + single CTA button
- **States 1–3 (has trackers):** One code path, no distinction by how much data exists
  - OverviewCard: always shows profit/loss with up/down arrow based on sign (not trend %)
  - Sections: always "Recent Project" / "Top Performers" / "Needs Attention" — regardless of data
  - TrackerCard: shows "—" for no-date projects, shows profit as negative even for setup-cost-only
  - No period-over-period trend calculation exists at all

### What the spec introduces
- **4 data states** with fundamentally different layouts per state
- **Period comparison logic** (current vs. previous period) to drive trend %
- **Emotional reframing:** "Setup invested" not "Net loss"; "Needs Attention" not "Worst Projects"; clock icon not —
- **Trend direction ≠ sign:** a shrinking loss is a GREEN trend

---

## FILES TO CHANGE

| File | What changes |
|------|-------------|
| `lib/features/dashboard/screens/dashboard_screen.dart` | State detection logic; section layout per state; period comparison |
| `lib/features/dashboard/widgets/performance_overview_card.dart` | State-aware display: info box (S1), context line (S2), trend % (S3) |
| `lib/features/dashboard/widgets/tracker_card.dart` | Setup-only mode; optional trend badge |
| `lib/features/shared/widgets/empty_state.dart` | Redesign `_DashboardEmptyState` completely |
| `lib/l10n/app_en.arb` | ~20 new l10n keys |
| *(new)* `lib/features/dashboard/models/dashboard_state.dart` | Enum + detection helper |

---

## PHASE 1 — Dashboard State Detection + Period Comparison

### Checklist
- [x] Create `lib/features/dashboard/models/dashboard_state.dart` with enum
- [x] Add `getPreviousDateRange()` to `TimePeriodUtils` (already existed as `getPreviousPeriodRange`)
- [x] Extend `onPeriodChanged` callback to also return previous period metrics
- [x] Wire state detection into `_DashboardContent.build()`
- [x] Verify state transitions work correctly in all 4 cases

### New file: `dashboard_state.dart`

```dart
enum DashboardDataState {
  setupOnly,    // Projects exist, 0 entries total
  earlyData,    // Entries exist, no previous period to compare
  trendingData, // Entries span 2+ periods → trend % visible
  matureData,   // 4+ distinct weeks with entries (same layout as trending, richer copy)
}
```

Detection logic (runs in `_DashboardContent.build()`):

```
totalEntries = sum of entryCount across all matching-currency trackers

IF totalEntries == 0:
  → setupOnly

ELSE IF no entries fall in previousPeriodRange:
  → earlyData

ELSE IF distinctWeeksWithEntries >= 4 AND totalEntries >= 20:
  → matureData

ELSE:
  → trendingData
```

`previousPeriodRange` is derived from selected time filter:
- "This week" → previous = prior 7 days
- "This month" → previous = prior 30 days
- "This quarter" → previous = prior 90 days
- "All time" → no previous (always earlyData behaviour)

### Period comparison — extend `onPeriodChanged` in `dashboard_screen.dart`

Currently returns `(profit, revenue, spend)` for current period only.
Extend to also calculate and return previous period totals:

```dart
return (
  profit: periodProfit.toDouble(),
  revenue: periodRevenue.toDouble(),
  spend: periodSpend.toDouble(),
  prevProfit: previousProfit.toDouble(),   // NEW
  prevRevenue: previousRevenue.toDouble(), // NEW
  prevSpend: previousSpend.toDouble(),     // NEW
);
```

---

## PHASE 2 — Empty State Redesign (State 0)

### Checklist
- [x] Replace `_DashboardEmptyState` in `empty_state.dart` with new layout
- [x] Mini preview card (faded 60% opacity) with hardcoded placeholder numbers
- [x] Headline + subtitle copy
- [x] Primary CTA card (full-width, icon + title + subtitle + time)
- [x] "WHAT YOU'LL TRACK" 3-pillar horizontal row
- [x] Remove: SVG, "Welcome to RHYDLE" title, paragraph text, standalone button
- [x] Verify tap on CTA card navigates to `Routes.createTracker`

### New layout (top → bottom)

**A. Mini preview card (faded 60% opacity)**
- `GOLCard(elevated)` wrapped in `Opacity(opacity: 0.6)` + `IgnorePointer()`
- Three rows of hardcoded placeholder data:
  - `Iconsax.wallet_add` · Revenue · `186 000`
  - `Iconsax.wallet_minus` · Spend · `84 000`
  - `Iconsax.chart` · Profit · `+102 000` (green text)
- Small green trend label: `▲ 24%`
- Width: ~220dp, centered, no tap interaction

**B. Headline + subtitle**
- `"Start tracking your business"` — `headlineMedium`, semibold, centered
- `"See where your money goes and what's actually working."` — `bodyMedium`, secondary, centered

**C. Primary CTA card (full-width, tappable)**
- `GOLCard(elevated)` with `surfaceRaised` or light accent background
- Left: `Iconsax.chart_2` icon (24dp, `interactivePrimary` color)
- Center column: `"Start Tracking"` bold title + `"Name it, pick platforms, go"` subtitle + `"Takes ~2 minutes"` small gray text
- Right: `Iconsax.arrow_right_3` chevron
- Entire card taps → `Routes.createTracker`

**D. Divider + "WHAT YOU'LL TRACK" section**
- `GOLDivider` + `"WHAT YOU'LL TRACK"` label (`labelSmall`, uppercase)
- `Row` with 3 equal `Expanded` mini-cards:
  - `Iconsax.wallet_add` / `"Revenue"` / `"per day"`
  - `Iconsax.shopping_bag` / `"Ad spend"` / `"per platform"`
  - `Iconsax.chart` / `"Profit"` / `"auto-calculated"`
- Each mini-card: icon (24dp) + bold label + small gray description, `surfaceRaised` background, rounded corners

---

## PHASE 3 — PerformanceOverviewCard State Awareness

### Checklist
- [x] Add new props: `dashboardState`, `totalSetupCost`, `projectsWithSetupCost`, `prevProfit/Revenue/Spend`, `trackingSinceDate`, `totalEntryCount`
- [x] State 1: show `"—"` for all amounts + neutral "Setup invested" info box
- [x] State 2: real numbers + "Tracking since" context line, NO trend arrows on Revenue/Spend
- [x] State 3: real numbers + trend % label (green if improving, even if still negative) + Revenue/Spend mini-trends
- [x] State 4: same as 3 + milestone context lines (best month, first profit, etc.)
- [x] Verify trend color logic: direction of change, not sign of number

### State 1 display
- Main amount: `"—"` in `textTertiary` color
- Subtitle: `"No entries yet"` in secondary gray
- Revenue / Spend cells: `"—"` instead of `"0"`
- Info box replaces Revenue/Spend/Projects row:
  ```
  [Iconsax.info_circle]  Setup invested: 346 500 FCFA across 4 projects
  ```
  `surfaceRaised` background + `borderDefault` border — NOT red, NOT coral

### State 2 display
- Main amount: real number, `colors.textPrimary` (dark text)
- Arrow: coral (loss) or green (profit) — same as current
- **NO trend % label** (nothing to compare against)
- Context line: `"Tracking since Feb 1 · 7 entries"` in `textSecondary`
- Revenue / Spend row: real numbers, no trend arrows beside them

### State 3/4 display
- Main amount: real number, dark text
- Trend % label: `"▲ 50% better vs last month"` or `"▼ 12% vs last month"`
  - GREEN if loss shrinking OR profit growing
  - CORAL if loss worsening OR profit declining
  - Color = direction of change, NOT sign of the number
- Revenue/Spend mini-trends: small `▲`/`▼` + % beside each sub-metric
  - Revenue up = green ▲, Revenue down = coral ▼
  - Spend up = coral ▲ (caution), Spend down = green ▼ (good)
- Context line: `"Based on 18 entries across 4 projects"`

### State 4 milestone context lines (replace context line when applicable)
- Best ever period → `"Best month so far · {N} entries"`
- First profitable period → `"First profitable month"`
- 3+ consecutive growth periods → `"{N} months of consecutive growth"`
- All projects profitable → `"All {N} projects in profit this month"`
- Reverting after growth → `"Down from last month's peak · Review spend"`

### Trend % calculation
```
change = ((current - previous) / |previous|) × 100

For profit/loss:
  Previous: -198 500    Current: -98 500
  Change: ((-98500 - (-198500)) / |-198500|) × 100 = +50.3%
  Direction: IMPROVING → green ▲ → "▲ 50% better vs last month"

For revenue:
  Previous: 186 000    Current: 286 000
  Change: +53.8% → IMPROVING → green ▲

For spend:
  Previous: 346 500    Current: 384 500
  Change: +10.9% → WORSENING (more spend) → coral ▲
```

---

## PHASE 4 — TrackerCard Updates

### Checklist
- [x] Add setup-only mode: when `liveEntryCount == 0` AND `lastEntryDate == null`
- [x] Setup-only mode: clock icon in circle instead of date; `"Setup: X FCFA"` line; `"No entries yet · Created Feb 5"` line
- [x] Pass `tracker.startDate` to the card for creation date display
- [x] Add optional `trendPercent: double?` + `trendImproving: bool?` props for State 3+
- [x] Add optional `isNeedsAttention: bool` prop — shows `Iconsax.warning_2` in coral instead of clock icon
- [x] Verify no regressions on existing card states

### Setup-only mode layout (entryCount == 0, no lastEntryDate)
- Left circle: `Iconsax.clock` icon in `textTertiary` (replaces date)
- Line 1: tracker name (unchanged)
- Line 2: `"Setup: 30 000 FCFA"` in `textSecondary` (or `"No setup cost"` if setupCost == 0)
- Line 3: `"No entries yet · Created Feb 5"` in `textTertiary`

### Trend badge (States 3+)
Appended to the profit/amount line:
```
-30 000  ▲ 67% vs last mo
```
- `▲` in `stateSuccess` (green) if `trendImproving == true`
- `▼` in `stateError` (coral) if `trendImproving == false`
- `"vs last mo"` in `textTertiary`

### "Needs Attention" icon variant
When `isNeedsAttention: true`: replace clock icon with `Iconsax.warning_2` in coral/`stateError` color.

---

## PHASE 5 — Dashboard Sections Logic

### Checklist
- [x] Detect `dashboardState` in `_DashboardContent` and pass to all child widgets
- [x] State 1: single "YOUR PROJECTS" flat list with subtitle, no Recent/Top/Worst
- [x] State 2: "RECENTLY UPDATED" (1 card) + "YOUR PROJECTS" (all remaining, sorted by activity)
- [x] State 3/4: "RECENTLY UPDATED" (1 card, no inline CTA) + "BEST PERFORMING" + "NEEDS ATTENTION" (conditional)
- [x] Implement deduplication: tracker shown in "Recently Updated" excluded from all other sections
- [x] "BEST PERFORMING": sorted by profit desc, only trackers with entries, not already shown
- [x] "NEEDS ATTENTION": hidden if no trackers qualify; criteria = no entries in 14+ days OR setup-only for 30+ days
- [x] "YOUR PROJECTS" in State 2: mixed mode — entries show date/profit, no-entries show setup-only mode
- [x] Rename section header "Recent Project" → "Recently Updated"
- [x] Rename section header "Top Performers" → "Best Performing"

### State 1 (setupOnly)
```
[Header: RHYDLE + bell]
[OverviewCard — State 1 mode]
[Divider]
Section: "YOUR PROJECTS"
Subtitle: "Log your first entry to see performance"
[TrackerCard × all] — all in setup-only mode
[FAB]
```

### State 2 (earlyData)
```
[Header]
[OverviewCard — State 2 mode]
[Divider]
Section: "RECENTLY UPDATED"
[TrackerCard × 1] — most recently active (plain card, no CTA inside)
[Divider]
Section: "YOUR PROJECTS" + [View All] if >3 remaining
[TrackerCard × all remaining] — sorted by last activity
  Mix of: active cards (date + profit + entries) and setup-only cards
[FAB]
```

### State 3 / State 4 (trendingData / matureData)
```
[Header]
[OverviewCard — State 3/4 mode with trend %]
[Divider]
Section: "RECENTLY UPDATED"
[TrackerCard × 1] — most recently active (plain card, no button inside)
[Divider]
Section: "BEST PERFORMING"
Subtitle: "Highest profit this {period}"
[TrackerCard × top 2-3] — sorted by improvement trend %, with trend badge
[Divider]
Section: "NEEDS ATTENTION" (only if trackers qualify)
Subtitle: "Declining or no recent activity"
[TrackerCard × qualifying] — with warning icon variant
[FAB]
```

**Deduplication rule:** Build a `Set<String> shownTrackerIds`. Add the recently-updated tracker's ID to it. Skip any tracker already in the set when building Best Performing and Needs Attention.

**"Recently Updated" card:** Just a plain `TrackerCard` — no button, no CTA, no extra row below it. Tap the card to go to the tracker hub as usual.

---

## PHASE 6 — l10n Keys

### Checklist
- [x] Verify ARB plural syntax by checking an existing plural key in `app_en.arb` first
- [x] Add all new keys to `app_en.arb`
- [x] Run `flutter gen-l10n` in `bride_app/`
- [x] Verify generated file compiles without errors

### New keys

```json
"startTrackingHeadline": "Start tracking your business",
"startTrackingSubtitle": "See where your money goes and what's actually working.",
"startTrackingCTATitle": "Start Tracking",
"startTrackingCTASubtitle": "Name it, pick platforms, go",
"startTrackingCTATime": "Takes ~2 minutes",
"whatYoullTrack": "WHAT YOU'LL TRACK",
"revenuePerDay": "Revenue per day",
"adSpendPerPlatform": "Ad spend per platform",
"profitAutoCalculated": "Profit auto-calculated",

"noEntriesYetOverview": "No entries yet",

"setupInvested": "Setup invested: {amount} across {count, plural, one{1 project} other{{count} projects}}",
"@setupInvested": {"placeholders": {"amount": {"type": "String"}, "count": {"type": "int"}}},

"trackingSince": "Tracking since {date} · {entries, plural, one{1 entry} other{{entries} entries}}",
"@trackingSince": {"placeholders": {"date": {"type": "String"}, "entries": {"type": "int"}}},

"basedOnEntries": "Based on {entries} entries across {projects, plural, one{1 project} other{{projects} projects}}",
"@basedOnEntries": {"placeholders": {"entries": {"type": "int"}, "projects": {"type": "int"}}},

"logYourFirstEntry": "Log your first entry to see performance",
"recentlyUpdated": "Recently Updated",
"yourProjects": "Your Projects",
"bestPerforming": "Best Performing",
"highestProfitThisPeriod": "Highest profit this period",
"needsAttentionSubtitle": "Declining or no recent activity",

"setupCostLabel": "Setup: {amount}",
"@setupCostLabel": {"placeholders": {"amount": {"type": "String"}}},

"noEntriesYetCreated": "No entries yet · Created {date}",
"@noEntriesYetCreated": {"placeholders": {"date": {"type": "String"}}},

"trendBetterVsLast": "{percent}% better vs last {period}",
"@trendBetterVsLast": {"placeholders": {"percent": {"type": "String"}, "period": {"type": "String"}}},

"trendVsLast": "{percent}% vs last {period}",
"@trendVsLast": {"placeholders": {"percent": {"type": "String"}, "period": {"type": "String"}}},

"bestMonthSoFar": "Best month so far · {entries} entries",
"@bestMonthSoFar": {"placeholders": {"entries": {"type": "int"}}},

"firstProfitableMonth": "First profitable month",

"consecutiveGrowth": "{months} months of consecutive growth",
"@consecutiveGrowth": {"placeholders": {"months": {"type": "int"}}},

"allProjectsInProfit": "All {projects} projects in profit this month",
"@allProjectsInProfit": {"placeholders": {"projects": {"type": "int"}}},

"downFromPeak": "Down from last month's peak · Review spend"
```

---

## IMPLEMENTATION ORDER

```
Phase 6 → Phase 1 → Phase 3 → Phase 4 → Phase 2 → Phase 5
```

Rationale:
1. **l10n first** — all other phases reference l10n keys; generate them once before touching widgets
2. **State detection** — foundation every other phase depends on
3. **OverviewCard** — self-contained widget, testable in isolation
4. **TrackerCard** — self-contained widget, testable in isolation
5. **Empty state** — self-contained, no dependencies
6. **Dashboard screen** — wires everything together last

---

## THINGS TO KEEP (no change needed)
- `_TrackerStats` helper class
- Currency filtering / multi-currency section
- Time period dropdown in OverviewCard (extend callback, don't replace)
- Pull-to-refresh
- FAB
- `_NotificationBellIcon`
- Error / network error states

---

## RISK FLAGS

1. **`onPeriodChanged` signature change** — named record extends from 3 to 6 fields. Update call site in `dashboard_screen.dart` at the same time.

2. **`TimePeriodUtils.getPreviousDateRange()`** — check if this method already exists before adding it.

3. **"Needs Attention" criteria** — skip "declining for 2+ consecutive periods" for now (too complex). Use simpler rule: no entries in 14+ days OR setup-only for 30+ days.

4. **Deduplication** — explicit `Set<String> shownTrackerIds` built as sections are assembled.

5. **l10n plural syntax** — check an existing plural key in `app_en.arb` before writing new ones. Match the exact format used.
