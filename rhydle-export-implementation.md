# RHYDLE V1: DATA EXPORT — COMPLETE IMPLEMENTATION SPEC

## Document Purpose
Developer-ready specification for the data export feature. Covers all screens, data models, file generation logic, edge cases, and Flutter implementation guidance. This document is self-contained — a developer should be able to build the full export feature from this spec alone.

**New screens:** Screen 32a (Export Options Bottom Sheet)  
**Modified screens:** Screen 32 (Export Success Modal — enhanced)  
**Touched screens:** Screen 19 (Quick Actions Menu), Screen 34 (Settings Page), Screen 5 (Reports Tab)  
**Does NOT modify:** Any entry, tracker, or dashboard screens

---

## TABLE OF CONTENTS

1. Feature Overview & Entry Points
2. Screen 32a: Export Options Bottom Sheet (NEW)
3. Screen 32: Export Success Modal (ENHANCED)
4. Export Data Model
5. XLSX File Structure (Multi-Tab Workbook)
6. CSV Fallback Structure
7. File Generation Logic
8. Edge Cases & Handling Rules
9. Flutter Implementation Guide
10. Testing Checklist

---

## 1. FEATURE OVERVIEW & ENTRY POINTS

### What Gets Exported

The export produces a single `.xlsx` file containing all the user's tracking data organized into tabs — one summary tab plus one tab per project. Optionally, a `.csv` zip bundle serves as a fallback format.

### Three Entry Points Into Export

```
ENTRY POINT 1: Settings Page (Screen 34) — GLOBAL EXPORT
  Location: New row in Settings under "DATA" section
  Label: "Export All Data"
  Subtitle: "Download your data as a spreadsheet"
  Icon: 📤
  Tap → Screen 32a (Export Options Bottom Sheet)
  Scope: ALL projects, ALL data
  
  This is the PRIMARY export entry point.

ENTRY POINT 2: Quick Actions Menu (Screen 19) — SINGLE PROJECT
  Location: Existing "Export Data" menu item
  Tap → Screen 32a (Export Options Bottom Sheet)
  Scope: CURRENT project only (pre-selected, not changeable)
  
  The bottom sheet opens with the project pre-selected 
  and the scope picker hidden.

ENTRY POINT 3: Reports Tab (Screen 5) — SINGLE PROJECT
  Location: Existing [📤 Export Report] button at bottom
  Tap → Screen 32a (Export Options Bottom Sheet)
  Scope: CURRENT project only + respects active time filter
  
  The bottom sheet opens with the project pre-selected 
  AND the time period pre-set to match the Reports tab filter.
```

### Navigation Flow

```
GLOBAL EXPORT:
  Screen 34 (Settings)
    → [Export All Data]
    → Screen 32a (Export Options — full controls)
    → [Export →]
    → Loading state (in-sheet)
    → Screen 32 (Export Success Modal)
    → [Download] or [Share]
    → Done

SINGLE PROJECT EXPORT:
  Screen 19 (Quick Actions) or Screen 5 (Reports)
    → [Export Data] / [Export Report]
    → Screen 32a (Export Options — project pre-selected)
    → [Export →]
    → Loading state (in-sheet)
    → Screen 32 (Export Success Modal)
    → [Download] or [Share]
    → Done
```

---

## 2. SCREEN 32a: EXPORT OPTIONS BOTTOM SHEET (NEW)

**Type:** Modal bottom sheet (slides up from bottom)  
**Dismiss:** Swipe down or tap outside  
**Height:** ~60% of screen (adaptive based on content)

### VARIANT A: Global Export (from Settings)

```
┌─────────────────────────────────────────────────┐
│                                                 │
│  ── drag handle ──                              │
│                                                 │
│  Export Data                              ✕     │
│                                                 │
│  ─────────────────────────────────────────────  │
│                                                 │
│  PERIOD                                         │
│                                                 │
│  ┌───────────┐┌───────────┐┌────────────┐      │
│  │ All Time ●││  30 days  ││  Custom    │      │
│  └───────────┘└───────────┘└────────────┘      │
│  Segmented control — single selection           │
│                                                 │
│  (Custom selected):                             │
│  ┌─────────────────┐  ┌─────────────────┐      │
│  │ From: 2026-01-01│  │ To: 2026-02-28  │      │
│  └─────────────────┘  └─────────────────┘      │
│  Date pickers — only visible when Custom        │
│                                                 │
│  ─────────────────────────────────────────────  │
│                                                 │
│  FORMAT                                         │
│                                                 │
│  ┌───────────────────┐ ┌───────────────────┐   │
│  │ 📊 Excel (.xlsx) ●│ │ 📄 CSV (.zip)     │   │
│  └───────────────────┘ └───────────────────┘   │
│  Segmented control — single selection           │
│                                                 │
│  ─────────────────────────────────────────────  │
│                                                 │
│  INCLUDE                                        │
│                                                 │
│  ☑ Daily entries                                │
│  ☑ Platform spend breakdown                     │
│  ☑ Posts                                        │
│  ☑ Setup costs                                  │
│  ☑ Summary tab                                  │
│  All checked by default — user can uncheck      │
│                                                 │
│  ─────────────────────────────────────────────  │
│                                                 │
│  PREVIEW                                        │
│  4 projects · 24 entries · Est. ~35 KB          │
│  Gray text — calculated from selections above   │
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │            Export   →                   │    │
│  └─────────────────────────────────────────┘    │
│  Primary button — full width                    │
│                                                 │
└─────────────────────────────────────────────────┘
```

### VARIANT B: Single Project Export (from Screen 19 / Screen 5)

```
┌─────────────────────────────────────────────────┐
│                                                 │
│  ── drag handle ──                              │
│                                                 │
│  Export: VAD Transit - Facebook           ✕     │
│  Title includes project name                    │
│                                                 │
│  ─────────────────────────────────────────────  │
│                                                 │
│  PERIOD                                         │
│                                                 │
│  ┌───────────┐┌───────────┐┌────────────┐      │
│  │ All Time  ││ 30 days ● ││  Custom    │      │
│  └───────────┘└───────────┘└────────────┘      │
│  Pre-selected to match Screen 5 filter          │
│  if opened from Reports tab                     │
│                                                 │
│  ─────────────────────────────────────────────  │
│                                                 │
│  FORMAT                                         │
│                                                 │
│  ┌───────────────────┐ ┌───────────────────┐   │
│  │ 📊 Excel (.xlsx) ●│ │ 📄 CSV (.csv)     │   │
│  └───────────────────┘ └───────────────────┘   │
│  Note: Single project CSV is a single file,     │
│  not a zip (no need for multiple files)         │
│                                                 │
│  ─────────────────────────────────────────────  │
│                                                 │
│  INCLUDE                                        │
│                                                 │
│  ☑ Daily entries                                │
│  ☑ Platform spend breakdown                     │
│  ☑ Posts                                        │
│  ☑ Setup costs                                  │
│                                                 │
│  No "Summary tab" checkbox — single project     │
│                                                 │
│  ─────────────────────────────────────────────  │
│                                                 │
│  PREVIEW                                        │
│  7 entries · 2 posts · Est. ~12 KB              │
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │            Export   →                   │    │
│  └─────────────────────────────────────────┘    │
│                                                 │
└─────────────────────────────────────────────────┘
```

### LOADING STATE (inside the bottom sheet)

```
After user taps [Export →], the button transforms:

BEFORE:
  ┌─────────────────────────────────────────┐
  │            Export   →                   │
  └─────────────────────────────────────────┘

DURING:
  ┌─────────────────────────────────────────┐
  │       ⏳ Generating export...           │
  └─────────────────────────────────────────┘
  Button disabled, spinner, gray background
  
  Typical duration: <2 seconds for most datasets
  If >5 seconds (large dataset): Show progress text
  "Processing 365 entries..." → "Building spreadsheet..."

AFTER SUCCESS:
  Bottom sheet dismisses → Screen 32 (Export Success) appears

AFTER FAILURE:
  ┌─────────────────────────────────────────┐
  │  ⚠️  Export failed. Try again?          │
  │                                         │
  │  [Try Again]           [Cancel]         │
  └─────────────────────────────────────────┘
  Show error inline, don't navigate away
```

### COMPONENT SPECIFICATIONS

```
BOTTOM SHEET:
  Border radius: 16dp top-left, top-right
  Background: White (#FFFFFF)
  Drag handle: 40dp wide, 4dp tall, centered, gray (#E5E5EA)
  Padding: 20dp horizontal, 16dp vertical
  Max height: 70% of screen
  Scrollable if content exceeds height

TITLE:
  "Export Data" (global) or "Export: {Project Name}" (single)
  Style: 18sp, semibold, dark (#1C1C1E)
  Close button: ✕ icon, 24dp, tap target 44dp

SECTION HEADERS ("PERIOD", "FORMAT", "INCLUDE"):
  Style: 12sp, uppercase, semibold, secondary gray (#8E8E93)
  Spacing: 24dp above, 12dp below

SEGMENTED CONTROLS (Period, Format):
  Height: 36dp
  Border: 1dp, light gray (#E5E5EA)
  Selected: Filled primary color, white text
  Unselected: Transparent, dark text
  Corner radius: 8dp
  Equal width segments

CHECKBOXES (Include):
  Size: 22dp checkbox, 16sp label
  Spacing: 12dp between items
  Checked: Primary color fill
  Unchecked: Gray border (#C7C7CC)

DATE PICKERS (Custom period):
  Style: Text input with calendar icon
  Format: YYYY-MM-DD (display-friendly locale format)
  Tap → Native date picker modal
  Only visible when "Custom" period is selected
  Animate in/out (200ms slide + fade)

PREVIEW LINE:
  Style: 14sp, regular, secondary gray (#8E8E93)
  Format: "{n} projects · {n} entries · Est. ~{size} KB"
  Updates dynamically when checkboxes/period change

EXPORT BUTTON:
  Height: 50dp
  Full width (minus padding)
  Background: Primary brand color
  Text: "Export →", 16sp, semibold, white
  Corner radius: 12dp
  Bottom padding: 34dp (safe area for home indicator)
```

---

## 3. SCREEN 32: EXPORT SUCCESS MODAL (ENHANCED)

Replaces the existing basic Screen 32 with richer information and clearer actions.

```
┌─────────────────────────────────────────────────┐
│                                                 │
│                                                 │
│                                                 │
│         ┌───────────────────────────────┐       │
│         │                               │       │
│         │            ✅                 │       │
│         │                               │       │
│         │    Export Complete!            │       │
│         │                               │       │
│         │    ┌───────────────────────┐  │       │
│         │    │ 📊 Rhydle_Export      │  │       │
│         │    │    _2026-02-10.xlsx   │  │       │
│         │    │    35.2 KB            │  │       │
│         │    └───────────────────────┘  │       │
│         │    File info card (light bg)  │       │
│         │                               │       │
│         │    Contains:                  │       │
│         │    4 projects · 24 entries    │       │
│         │    Period: All time           │       │
│         │                               │       │
│         │    ┌───────────────────────┐  │       │
│         │    │   📥  Download        │  │       │
│         │    └───────────────────────┘  │       │
│         │    Primary button             │       │
│         │                               │       │
│         │    ┌───────────────────────┐  │       │
│         │    │   📤  Share           │  │       │
│         │    └───────────────────────┘  │       │
│         │    Secondary button (outline) │       │
│         │                               │       │
│         │          [Done]               │       │
│         │    Text button, dismisses     │       │
│         │                               │       │
│         └───────────────────────────────┘       │
│                                                 │
│                                                 │
└─────────────────────────────────────────────────┘
```

### Actions

```
[Download]:
  Saves file to device's Downloads folder
  Shows system "file saved" notification
  On iOS: Opens share sheet (no Downloads folder concept)
  On Android: Saves to Downloads, shows snackbar "Saved to Downloads"

[Share]:
  Opens system share sheet
  User can share to WhatsApp, Email, Drive, etc.
  File attached as .xlsx or .csv/.zip
  
[Done]:
  Dismisses modal
  Returns to the screen that triggered the export
```

### File Naming Convention

```
GLOBAL EXPORT:
  Rhydle_Export_{YYYY-MM-DD}.xlsx
  Rhydle_Export_{YYYY-MM-DD}.zip       (if CSV)
  
  Examples:
  Rhydle_Export_2026-02-10.xlsx
  Rhydle_Export_2026-02-10.zip

SINGLE PROJECT EXPORT:
  Rhydle_{ProjectName}_{YYYY-MM-DD}.xlsx
  Rhydle_{ProjectName}_{YYYY-MM-DD}.csv
  
  Examples:
  Rhydle_VAD_Transit_Facebook_2026-02-10.xlsx
  Rhydle_DOUANES_GUINEES_2026-02-10.csv
  
  Project name sanitization:
  - Replace spaces with underscores
  - Remove special characters: [ ] : * ? / \ ' "
  - Truncate to 50 characters max
  - Trim trailing underscores
```

---

## 4. EXPORT DATA MODEL

### What Data Exists Per Entry (from Screen 7)

```dart
class DailyEntry {
  String id;
  String trackerId;
  DateTime date;
  double revenue;                    // Total revenue for the day
  List<PlatformSpend> platformSpends; // Per-platform ad spend
  double totalSpend;                 // Sum of all platform spends
  int leadsOrDms;                    // DMs/Leads count
  double profit;                     // revenue - totalSpend (calculated)
  String? notes;                     // Optional notes
  DateTime createdAt;
  DateTime updatedAt;
}

class PlatformSpend {
  String platformName;    // "Facebook", "Instagram", "YouTube", etc.
  String? campaignType;   // "General Ads", "Boost", "Ad", etc.
  double amount;
}
```

### What Data Exists Per Tracker (from Screen 2)

```dart
class Tracker {
  String id;
  String name;                       // "VAD Transit - Facebook"
  String? description;
  List<String> platforms;            // ["Facebook", "Instagram"]
  String currency;                   // "FCFA", "USD", "EUR"
  double setupCost;                  // One-time setup cost
  DateTime createdAt;
  DateTime updatedAt;
  bool isArchived;
}
```

### What Data Exists Per Post (from Screen 12)

```dart
class Post {
  String id;
  String trackerId;
  String title;           // "Launch Day Announcement"
  String platform;        // "Facebook"
  String? url;            // "https://fb.com/post/123"
  DateTime date;
  String? notes;
}
```

---

## 5. XLSX FILE STRUCTURE (MULTI-TAB WORKBOOK)

### Tab Order

```
Tab 1: "Summary"                           ← Always first
Tab 2: "{Project 1 Name}"                  ← Sorted by creation date
Tab 3: "{Project 2 Name}"
Tab 4: "{Project 3 Name}"
...
Tab N: "{Project N Name}"

TAB NAME RULES:
  - Excel tab names limited to 31 characters
  - If name > 28 chars: truncate at 28 + "..."
  - Remove invalid chars: [ ] : * ? / \
  - If duplicate names after truncation: append " (2)", " (3)"
  - Full name shown in project metadata INSIDE the tab
```

### TAB 1: SUMMARY

```
┌─────┬──────────────────┬─────────────┬───────────┬──────────┬─────────┬────────────┐
│ ROW │ A                │ B           │ C         │ D        │ E       │ F          │
├─────┼──────────────────┼─────────────┼───────────┼──────────┼─────────┼────────────┤
│  1  │ RHYDLE — PERFORMANCE SUMMARY                                                │
│  2  │ Exported: {date}                                                             │
│  3  │ Period: {period}                                                             │
│  4  │ (empty row)                                                                  │
├─────┼──────────────────┼─────────────┼───────────┼──────────┼─────────┼────────────┤
│  5  │ PROJECT OVERVIEW                                                             │
├─────┼──────────────────┼─────────────┼───────────┼──────────┼─────────┼────────────┤
│  6  │ Project          │ Currency    │ Revenue   │ Spend    │ Profit  │ Entries    │
├─────┼──────────────────┼─────────────┼───────────┼──────────┼─────────┼────────────┤
│  7  │ VAD Transit      │ FCFA        │ 186 000   │ 346 500  │-160 500 │ 7          │
│  8  │ DOUANES GUINÉES  │ FCFA        │ 0         │ 0        │ 0       │ 0          │
│  9  │ Wait-list Rhydle │ FCFA        │ 120 000   │ 175 000  │ -55 000 │ 12         │
│ 10  │ Side Project     │ USD         │ 450       │ 300      │ 150     │ 5          │
├─────┼──────────────────┼─────────────┼───────────┼──────────┼─────────┼────────────┤
│ 11  │ (empty row)                                                                  │
├─────┼──────────────────┼─────────────┼───────────┼──────────┼─────────┼────────────┤
│ 12  │ TOTALS BY CURRENCY                                                           │
├─────┼──────────────────┼─────────────┼───────────┼──────────┼─────────┼────────────┤
│ 13  │ Currency         │             │ Revenue   │ Spend    │ Profit  │ Entries    │
├─────┼──────────────────┼─────────────┼───────────┼──────────┼─────────┼────────────┤
│ 14  │ FCFA             │             │ 306 000   │ 521 500  │-215 500 │ 19         │
│ 15  │ USD              │             │ 450       │ 300      │ 150     │ 5          │
├─────┼──────────────────┼─────────────┼───────────┼──────────┼─────────┼────────────┤
│ 16  │ (empty row)                                                                  │
├─────┼──────────────────┼─────────────┼───────────┼──────────┼─────────┼────────────┤
│ 17  │ SETUP COSTS                                                                  │
├─────┼──────────────────┼─────────────┼───────────┼──────────┼─────────┼────────────┤
│ 18  │ Project          │ Currency    │ Setup Cost                                  │
├─────┼──────────────────┼─────────────┼───────────┼──────────┼─────────┼────────────┤
│ 19  │ VAD Transit      │ FCFA        │ 30 000                                      │
│ 20  │ DOUANES GUINÉES  │ FCFA        │ 15 000                                      │
│ 21  │ Wait-list Rhydle │ FCFA        │ 55 000                                      │
│ 22  │ Side Project     │ USD         │ 0                                           │
├─────┼──────────────────┼─────────────┼───────────┼──────────┼─────────┼────────────┤
│ 23  │ Total (FCFA)     │             │ 100 000                                     │
│ 24  │ Total (USD)      │             │ 0                                           │
└─────┴──────────────────┴─────────────┴───────────┴──────────┴─────────┴────────────┘

FORMATTING:
  Row 1: Title — 16pt, bold, primary brand color
  Row 2-3: Metadata — 10pt, gray
  Row 5, 12, 17: Section headers — 12pt, bold, dark background, white text
  Row 6, 13, 18: Column headers — 11pt, bold, light gray background
  Data rows: 11pt, regular
  Profit column: Conditional formatting
    Positive → Dark text (no color — matches app behavior)
    Negative → Dark text (matches app behavior — NOT red)
  Totals: Bold
  Column widths: A=25, B=12, C=15, D=15, E=15, F=10
```

### TABS 2-N: INDIVIDUAL PROJECT TABS

```
┌─────┬──────────────┬──────────┬──────────┬──────────┬──────────┬──────────┐
│ ROW │ A            │ B        │ C        │ D        │ E        │ F        │
├─────┼──────────────┼──────────┼──────────┼──────────┼──────────┼──────────┤
│  1  │ {PROJECT NAME — full, untruncated}                                  │
├─────┼──────────────┼──────────┼──────────┼──────────┼──────────┼──────────┤
│  2  │ Created      │ {date}                                               │
│  3  │ Platforms    │ {Facebook, Instagram}                                 │
│  4  │ Currency     │ {FCFA}                                                │
│  5  │ Setup Cost   │ {30 000}                                              │
│  6  │ (empty row)                                                         │
├─────┼──────────────┼──────────┼──────────┼──────────┼──────────┼──────────┤
│  7  │ DAILY ENTRIES                                                       │
├─────┼──────────────┼──────────┼──────────┼──────────┼──────────┼──────────┤
│  8  │ Date         │ Revenue  │ Spend    │ Leads    │ Profit   │ Notes    │
├─────┼──────────────┼──────────┼──────────┼──────────┼──────────┼──────────┤
│  9  │ 2026-02-01   │ 25 000   │ 45 000   │ 3        │ -20 000  │          │
│ 10  │ 2026-02-02   │ 28 000   │ 45 000   │ 4        │ -17 000  │          │
│ 11  │ 2026-02-03   │ 22 000   │ 50 000   │ 2        │ -28 000  │          │
│ 12  │ 2026-02-05   │ 30 000   │ 45 000   │ 5        │ -15 000  │ Good day │
│ 13  │ 2026-02-07   │ 35 000   │ 50 000   │ 6        │ -15 000  │          │
│ 14  │ 2026-02-08   │ 20 000   │ 45 000   │ 3        │ -25 000  │          │
│ 15  │ 2026-02-09   │ 26 000   │ 66 500   │ 4        │ -40 500  │          │
├─────┼──────────────┼──────────┼──────────┼──────────┼──────────┼──────────┤
│ 16  │ TOTALS       │=SUM(B9:  │=SUM(C9:  │=SUM(D9:  │=SUM(E9:  │          │
│     │              │ B15)     │ C15)     │ D15)     │ E15)     │          │
├─────┼──────────────┼──────────┼──────────┼──────────┼──────────┼──────────┤
│ 17  │ (empty row)                                                         │
├─────┼──────────────┼──────────┼──────────┼──────────┼──────────┼──────────┤
│ 18  │ PLATFORM SPEND BREAKDOWN (if "Platform spend breakdown" checked)    │
├─────┼──────────────┼──────────┼──────────┼──────────┼──────────┼──────────┤
│ 19  │ Date         │ Facebook │ Instagram│                                │
├─────┼──────────────┼──────────┼──────────┼──────────┼──────────┼──────────┤
│ 20  │ 2026-02-01   │ 30 000   │ 15 000   │                                │
│ 21  │ 2026-02-02   │ 30 000   │ 15 000   │                                │
│ ... │ ...          │ ...      │ ...      │                                │
├─────┼──────────────┼──────────┼──────────┼──────────┼──────────┼──────────┤
│ 27  │ TOTALS       │=SUM()   │=SUM()    │                                │
├─────┼──────────────┼──────────┼──────────┼──────────┼──────────┼──────────┤
│ 28  │ (empty row)                                                         │
├─────┼──────────────┼──────────┼──────────┼──────────┼──────────┼──────────┤
│ 29  │ POSTS (if "Posts" checked and posts exist)                          │
├─────┼──────────────┼──────────┼──────────┼──────────┼──────────┼──────────┤
│ 30  │ Date         │ Title    │ Platform │ URL      │ Notes    │          │
├─────┼──────────────┼──────────┼──────────┼──────────┼──────────┼──────────┤
│ 31  │ 2026-02-01   │ Launch   │ Facebook │ fb.com/  │          │          │
│ 32  │ 2026-02-05   │ Promo    │ Instagram│ ig.com/  │          │          │
└─────┴──────────────┴──────────┴──────────┴──────────┴──────────┴──────────┘

CRITICAL FORMULAS (use Excel formulas, not hardcoded values):

  PROFIT COLUMN:
    Cell E9: =B9-C9     (Revenue minus Spend)
    Each row calculates its own profit
    
  TOTALS ROW:
    Cell B16: =SUM(B9:B15)   (Total Revenue)
    Cell C16: =SUM(C9:C15)   (Total Spend)
    Cell D16: =SUM(D9:D15)   (Total Leads)
    Cell E16: =B16-C16       (Total Profit from totals, not SUM of profit)
    
  WHY =B16-C16 NOT =SUM(E9:E15)?
    Both produce the same result, but B16-C16 is cleaner
    and shows the user the actual relationship.
    Either works. Pick one and be consistent.

SORTING:
  Entries sorted by date ASCENDING (oldest first)
  This matches how spreadsheet users expect time-series data
  
MISSING DATES:
  If user skipped Feb 4 and Feb 6, those rows simply don't exist
  The gap is visible and intentional — shows days not tracked
  DO NOT insert empty rows for missing dates
```

---

## 6. CSV FALLBACK STRUCTURE

### Global Export (Multiple Projects) → ZIP File

```
Rhydle_Export_2026-02-10.zip
├── Summary.csv
├── VAD_Transit_Facebook.csv
├── DOUANES_GUINEES.csv
├── Wait_list_Rhydle.csv
└── Side_Project.csv
```

### CSV Column Format (Per Project File)

```csv
# Project: VAD Transit - Facebook
# Created: 2026-02-01
# Platforms: Facebook, Instagram
# Currency: FCFA
# Setup Cost: 30000
# Exported: 2026-02-10
# Period: All Time

date,revenue,spend,leads,profit,notes
2026-02-01,25000,45000,3,-20000,
2026-02-02,28000,45000,4,-17000,
2026-02-03,22000,50000,2,-28000,
2026-02-05,30000,45000,5,-15000,Good day
2026-02-07,35000,50000,6,-15000,
2026-02-08,20000,45000,3,-25000,
2026-02-09,26000,66500,4,-40500,
```

### CSV Rules

```
HEADER LINES:
  Lines starting with # are metadata comments
  Most CSV parsers skip these (Google Sheets, Excel)
  First non-comment line is the column header

NUMBER FORMAT:
  Plain integers: 25000 (not 25,000 or 25.000)
  No currency symbols in data cells
  Currency specified in metadata header only

DATE FORMAT:
  ISO 8601: YYYY-MM-DD
  Always 10 characters
  No locale-specific formatting

TEXT FIELDS (notes):
  Wrapped in quotes if they contain commas
  Example: "Good day, lots of sales"
  Empty if no notes (trailing comma)

ENCODING:
  UTF-8 with BOM (for Excel compatibility)
  BOM = \xEF\xBB\xBF at start of file
  Without BOM, Excel may misread special characters (é, è, ñ)
```

### Summary.csv Format

```csv
# RHYDLE — PERFORMANCE SUMMARY
# Exported: 2026-02-10
# Period: All Time

project,currency,revenue,spend,profit,entries,setup_cost
VAD Transit - Facebook,FCFA,186000,346500,-160500,7,30000
DOUANES GUINÉES,FCFA,0,0,0,0,15000
Wait-list For Rhydle,FCFA,120000,175000,-55000,12,55000
Side Project,USD,450,300,150,5,0
```

---

## 7. FILE GENERATION LOGIC

### Step-by-Step Generation Process

```
STEP 1: GATHER DATA
  Input: selectedProjects[], period, includeOptions{}
  
  For each project in selectedProjects:
    1. Fetch tracker metadata (name, currency, platforms, setup cost)
    2. Fetch entries filtered by period
    3. Fetch platform spends for each entry
    4. Fetch posts if includeOptions.posts == true
    5. Calculate totals

STEP 2: VALIDATE DATA
  - If 0 projects selected → Show error "No projects to export"
  - If 0 entries in period → Allow export (metadata + setup costs still useful)
  - If project has no entries → Include tab with metadata + "No entries" note

STEP 3: BUILD SUMMARY DATA
  For each unique currency:
    Sum revenue, spend, profit, entries across projects in that currency
  
  DO NOT sum across currencies
  
  Group projects by currency in summary:
    FCFA projects together
    USD projects together

STEP 4: GENERATE FILE
  IF format == XLSX:
    1. Create workbook
    2. Add "Summary" sheet
    3. For each project: add named sheet
    4. Apply formatting (bold headers, column widths, formulas)
    5. Save to temp file
    
  IF format == CSV:
    IF multiple projects:
      1. Generate Summary.csv
      2. Generate {Project}.csv for each project
      3. Bundle into .zip
    IF single project:
      1. Generate single .csv file (no zip needed)

STEP 5: PREPARE FOR SHARING
  1. Get file size
  2. Generate filename
  3. Store in app temp directory
  4. Pass file path to Screen 32 (success modal)
```

### Pseudocode for XLSX Generation

```dart
Future<File> generateExport({
  required List<Tracker> trackers,
  required DateRange period,
  required ExportOptions options,
}) async {
  final workbook = Workbook();
  
  // ── STEP 1: Build Summary Sheet ──
  if (options.includeSummary) {
    final summarySheet = workbook.worksheets[0]; // Default sheet
    summarySheet.name = 'Summary';
    
    // Title row
    _writeCell(summarySheet, 0, 0, 'RHYDLE — PERFORMANCE SUMMARY', bold: true, size: 16);
    _writeCell(summarySheet, 1, 0, 'Exported: ${_formatDate(DateTime.now())}');
    _writeCell(summarySheet, 2, 0, 'Period: ${_formatPeriod(period)}');
    
    // Project Overview section
    int row = 4;
    _writeSectionHeader(summarySheet, row, 'PROJECT OVERVIEW');
    row++;
    _writeColumnHeaders(summarySheet, row, 
      ['Project', 'Currency', 'Revenue', 'Spend', 'Profit', 'Entries']);
    row++;
    
    for (final tracker in trackers) {
      final entries = await _getEntries(tracker.id, period);
      final totals = _calculateTotals(entries);
      
      _writeCell(summarySheet, row, 0, tracker.name);
      _writeCell(summarySheet, row, 1, tracker.currency);
      _writeNumber(summarySheet, row, 2, totals.revenue);
      _writeNumber(summarySheet, row, 3, totals.spend);
      _writeNumber(summarySheet, row, 4, totals.profit);
      _writeNumber(summarySheet, row, 5, entries.length);
      row++;
    }
    
    // Totals by currency section
    row += 2;
    _writeTotalsByCurrency(summarySheet, row, trackers, period);
    
    // Setup costs section
    if (options.includeSetupCosts) {
      row += trackers.length + 4;
      _writeSetupCosts(summarySheet, row, trackers);
    }
    
    // Auto-fit column widths
    _autoFitColumns(summarySheet);
  }
  
  // ── STEP 2: Build Per-Project Sheets ──
  for (final tracker in trackers) {
    final sheet = workbook.worksheets.add();
    sheet.name = _sanitizeTabName(tracker.name);
    
    // Project metadata
    int row = 0;
    _writeCell(sheet, row++, 0, tracker.name, bold: true, size: 14);
    _writeCell(sheet, row++, 0, 'Created');
    _writeCell(sheet, row - 1, 1, _formatDate(tracker.createdAt));
    _writeCell(sheet, row++, 0, 'Platforms');
    _writeCell(sheet, row - 1, 1, tracker.platforms.join(', '));
    _writeCell(sheet, row++, 0, 'Currency');
    _writeCell(sheet, row - 1, 1, tracker.currency);
    
    if (options.includeSetupCosts) {
      _writeCell(sheet, row++, 0, 'Setup Cost');
      _writeNumber(sheet, row - 1, 1, tracker.setupCost);
    }
    row++; // Empty row
    
    // Daily entries
    final entries = await _getEntries(tracker.id, period);
    
    if (entries.isEmpty) {
      _writeCell(sheet, row++, 0, 'No entries in selected period');
    } else {
      _writeSectionHeader(sheet, row++, 'DAILY ENTRIES');
      _writeColumnHeaders(sheet, row++, 
        ['Date', 'Revenue', 'Spend', 'Leads', 'Profit', 'Notes']);
      
      final dataStartRow = row;
      for (final entry in entries) {
        _writeDate(sheet, row, 0, entry.date);
        _writeNumber(sheet, row, 1, entry.revenue);
        _writeNumber(sheet, row, 2, entry.totalSpend);
        _writeNumber(sheet, row, 3, entry.leadsOrDms.toDouble());
        // FORMULA: Profit = Revenue - Spend
        _writeFormula(sheet, row, 4, '=B${row + 1}-C${row + 1}');
        _writeCell(sheet, row, 5, entry.notes ?? '');
        row++;
      }
      
      // Totals row
      _writeCell(sheet, row, 0, 'TOTALS', bold: true);
      _writeFormula(sheet, row, 1, '=SUM(B${dataStartRow + 1}:B${row})');
      _writeFormula(sheet, row, 2, '=SUM(C${dataStartRow + 1}:C${row})');
      _writeFormula(sheet, row, 3, '=SUM(D${dataStartRow + 1}:D${row})');
      _writeFormula(sheet, row, 4, '=B${row + 1}-C${row + 1}');
      row += 2;
    }
    
    // Platform spend breakdown
    if (options.includePlatformBreakdown && entries.isNotEmpty) {
      _writePlatformBreakdown(sheet, row, entries);
      row += entries.length + 4;
    }
    
    // Posts
    if (options.includePosts) {
      final posts = await _getPosts(tracker.id, period);
      if (posts.isNotEmpty) {
        _writePosts(sheet, row, posts);
      }
    }
    
    _autoFitColumns(sheet);
  }
  
  // ── STEP 3: Save to file ──
  final bytes = workbook.saveAsStream();
  final filename = _generateFilename(trackers, period);
  final tempDir = await getTemporaryDirectory();
  final file = File('${tempDir.path}/$filename');
  await file.writeAsBytes(bytes);
  
  workbook.dispose();
  return file;
}
```

---

## 8. EDGE CASES & HANDLING RULES

### Data Edge Cases

```
CASE 1: MIXED CURRENCIES
  Problem: User has FCFA and USD projects
  Rule: NEVER sum across currencies
  Summary tab: Group by currency, show subtotals per currency
  Per-project tabs: Each tab shows its own currency
  
CASE 2: PROJECT WITH ZERO ENTRIES
  Problem: DOUANES GUINÉES has no entries (setup cost only)
  Rule: Still create the project tab
  Content: Show metadata + setup cost + "No entries in selected period"
  Summary tab: Show project with Revenue=0, Spend=0, Entries=0

CASE 3: PROJECT WITH ZERO SETUP COST
  Problem: Project created without any setup cost
  Rule: Show "0" for setup cost (not blank, not hidden)
  Consistency matters more than aesthetics

CASE 4: PERIOD FILTER RETURNS NO DATA
  Problem: "Last 30 days" selected but no entries in last 30 days
  Rule: Still generate the file
  Summary: All zeros
  Project tabs: Metadata + "No entries in selected period"
  Success modal: Show "0 entries" in the contains summary

CASE 5: VERY LONG NOTES
  Problem: User wrote a paragraph in the notes field
  XLSX rule: Set notes column width to 200px, enable text wrapping
  CSV rule: Wrap in double quotes, escape internal quotes

CASE 6: SPECIAL CHARACTERS IN DATA
  Problem: User notes contain commas, quotes, newlines, emojis
  XLSX: Handled natively by the library
  CSV: 
    Commas → wrap field in quotes: "Good day, lots of sales"
    Quotes → escape with double quotes: "He said ""hello"""
    Newlines → wrap in quotes (preserved in CSV spec)
    Emojis → UTF-8 encoding handles this

CASE 7: ENTRY WITH ZERO REVENUE AND ZERO SPEND
  Problem: User logged a day with 0 revenue and 0 spend
  Rule: Include the row. The user explicitly logged it.
  Profit = 0. Leads may have a value.

CASE 8: PLATFORM SPEND BREAKDOWN INCONSISTENCY
  Problem: Entry total spend = 45,000 but platform breakdown = 
  30,000 (Facebook) + 10,000 (Instagram) = 40,000
  This shouldn't happen in the app, but if it does:
  Rule: Export what's stored. Don't recalculate.
  The platform breakdown table shows what was logged per platform.
  The main entries table shows the total spend.
  If they differ, that's a data quality issue — export should
  reflect reality, not mask it.

CASE 9: ARCHIVED PROJECTS
  Problem: User has 2 active + 1 archived project
  Rule: Global export includes ONLY active projects by default
  Archived projects are excluded
  If we add an "Include archived" checkbox later, that's V2
  
CASE 10: SINGLE PROJECT WITH NO PLATFORMS
  Problem: User created a project without selecting any platforms
  Rule: Platform spend breakdown section is empty/hidden
  The "Platforms" metadata row shows "None"
```

### Tab Name Edge Cases

```
CASE A: NAME TOO LONG
  Input: "VAD Transit Marketing Campaign - Facebook Ads 2026"
  Rule: Truncate to 28 chars + "..."
  Output: "VAD Transit Marketing Cam..."
  Full name in cell A1 inside the tab

CASE B: INVALID CHARACTERS
  Input: "Q3 [Beta] Launch: Phase 1"
  Rule: Remove [ ] :
  Output: "Q3 Beta Launch Phase 1"

CASE C: DUPLICATE NAMES AFTER TRUNCATION
  Input: "Marketing Campaign Facebook Ads" AND "Marketing Campaign Instagram Ads"
  Both truncate to: "Marketing Campaign Faceb..."
  Rule: Append " (2)" to the duplicate
  Output: "Marketing Campaign Faceb..." AND "Marketing Campaign Face (2)"

CASE D: NAME IS ONLY SPECIAL CHARACTERS
  Input: "***" (unlikely but possible)
  Rule: Replace with "Project {index}"
  Output: "Project 1"

CASE E: EMPTY NAME (shouldn't happen, but defend against it)
  Input: "" or null
  Rule: Use "Untitled Project {index}"
```

### File System Edge Cases

```
CASE X: STORAGE PERMISSION DENIED
  Android: Request WRITE_EXTERNAL_STORAGE permission
  iOS: Use app documents directory (no permission needed for sharing)
  If denied: Show error "Storage permission required to save file"
  Offer [Open Settings] to grant permission

CASE Y: DISK SPACE INSUFFICIENT
  Rule: Check available space before generating
  Minimum: file estimate × 2 (buffer for temp files)
  If insufficient: "Not enough storage. Free up space and try again."
  Typical export size: 10-100 KB (very small)

CASE Z: FILE ALREADY EXISTS
  Rule: Overwrite without asking
  The filename includes the date, so collisions only happen 
  if user exports twice on the same day
  Both exports will have the same data anyway
```

---

## 9. FLUTTER IMPLEMENTATION GUIDE

### Recommended Package

```yaml
# pubspec.yaml
dependencies:
  syncfusion_flutter_xlsio: ^24.1.41  # XLSX generation
  path_provider: ^2.1.1               # File system paths
  share_plus: ^7.2.1                  # System share sheet
  archive: ^3.4.9                     # ZIP for CSV bundle
  intl: ^0.18.1                       # Date formatting
```

**Why syncfusion_flutter_xlsio:**
- Free community license (for revenue < $1M)
- Native Dart — no platform channels
- Supports formulas, formatting, multiple sheets
- Well documented
- Actively maintained

**Alternative:** `excel` package (simpler but no formula support)

### File Structure

```
lib/
├── features/
│   └── export/
│       ├── models/
│       │   └── export_options.dart        # ExportOptions model
│       ├── services/
│       │   ├── xlsx_generator.dart        # XLSX file generation
│       │   ├── csv_generator.dart         # CSV file generation
│       │   └── export_service.dart        # Orchestrator
│       ├── widgets/
│       │   ├── export_options_sheet.dart   # Screen 32a bottom sheet
│       │   └── export_success_modal.dart   # Screen 32 modal
│       └── export_controller.dart         # State management
```

### Key Model

```dart
class ExportOptions {
  final ExportScope scope;           // allProjects, singleProject
  final String? trackerId;           // If singleProject
  final ExportPeriod period;         // allTime, last30Days, custom
  final DateTime? customStart;
  final DateTime? customEnd;
  final ExportFormat format;         // xlsx, csv
  final bool includeEntries;         // Default: true
  final bool includePlatformBreakdown; // Default: true
  final bool includePosts;           // Default: true
  final bool includeSetupCosts;      // Default: true
  final bool includeSummary;         // Default: true (global only)
}

enum ExportScope { allProjects, singleProject }
enum ExportPeriod { allTime, last30Days, custom }
enum ExportFormat { xlsx, csv }
```

### Export Service Interface

```dart
abstract class ExportService {
  /// Generate export file and return the file path
  Future<ExportResult> generateExport(ExportOptions options);
  
  /// Get preview info (project count, entry count, estimated size)
  Future<ExportPreview> getExportPreview(ExportOptions options);
  
  /// Share file via system share sheet
  Future<void> shareFile(String filePath);
  
  /// Save file to device downloads
  Future<void> downloadFile(String filePath);
}

class ExportResult {
  final String filePath;
  final String fileName;
  final int fileSizeBytes;
  final int projectCount;
  final int entryCount;
  final String period;
  final bool success;
  final String? errorMessage;
}

class ExportPreview {
  final int projectCount;
  final int entryCount;
  final int postCount;
  final int estimatedSizeKB;
}
```

---

## 10. TESTING CHECKLIST

### Functional Tests

```
GENERATION TESTS:
  □ Export with 1 project, 1 entry → File generated correctly
  □ Export with 5 projects, 50+ entries → All tabs present
  □ Export with 0 entries (setup costs only) → File generated, no crash
  □ Export with "All Time" period → All data included
  □ Export with "30 days" → Only recent data included
  □ Export with "Custom" period → Date range respected
  □ Export as XLSX → Opens in Excel, Google Sheets, Numbers
  □ Export as CSV → Opens in any text editor, imports into Excel
  □ CSV ZIP → Contains correct number of files
  □ Single project CSV → Single file (not zip)

FORMULA TESTS:
  □ Profit column formulas calculate correctly
  □ Totals row SUM formulas work
  □ Changing a revenue cell updates profit and totals
  □ Summary tab totals match individual project totals

FORMATTING TESTS:
  □ Headers are bold
  □ Column widths are readable (no truncation of common values)
  □ Dates display as dates (not numbers) in Excel
  □ Numbers display as numbers (not text) in Excel
  □ Section headers have background color
  □ Tab names are correct and valid

EDGE CASE TESTS:
  □ Mixed currencies → Grouped correctly in summary
  □ Project with no entries → Tab created with metadata
  □ Project name > 31 chars → Tab name truncated correctly
  □ Project name with special chars → Cleaned correctly
  □ Duplicate tab names → Disambiguated with (2), (3)
  □ Entry with empty notes → No crash, empty cell
  □ Entry with long notes → Text wraps in XLSX
  □ Entry notes with commas → CSV escapes correctly
  □ Entry with 0 revenue and 0 spend → Row included
  □ Emoji in notes → Renders correctly (UTF-8)

ENTRY POINT TESTS:
  □ Settings → Export All → Shows full options sheet
  □ Quick Actions → Export → Shows project-specific sheet
  □ Reports Tab → Export → Inherits time filter
  □ Cancel export → Returns to previous screen cleanly
  □ Export during generation → Button disabled, no double-submit

FILE HANDLING TESTS:
  □ File saves to temp directory
  □ Download moves to Downloads folder (Android)
  □ Share opens system share sheet with file attached
  □ Share to WhatsApp → File sent successfully
  □ Share to Gmail → File attached successfully
  □ Share to Google Drive → File uploaded
  □ Done dismisses modal and returns to correct screen
  □ Export same day twice → File overwritten, no error

PERFORMANCE TESTS:
  □ 10 projects × 365 entries → Export completes in <3 seconds
  □ Loading indicator appears during generation
  □ UI remains responsive during generation (async)
  □ File size is reasonable (<500 KB for typical datasets)
```

### Smoke Test Sequence (Minimum Viable Testing)

```
1. Create 2 projects with different currencies
2. Log 3 entries in project A, 1 in project B
3. Add 1 post to project A
4. Go to Settings → Export All Data
5. Leave all defaults (All Time, XLSX, all checked)
6. Tap Export
7. Verify success modal shows correct counts
8. Tap Share → Send to self via email
9. Open the .xlsx on a computer
10. Verify:
    - Summary tab has both projects
    - Currencies grouped correctly
    - Project A tab has 3 entries with formulas
    - Project B tab has 1 entry
    - Posts section appears in project A
    - All numbers are correct
```

---

## MODIFICATIONS TO EXISTING SCREENS

### Screen 34 (Settings Page) — ADD EXPORT ROW

Add to the Settings page under a new "DATA" section, placed between "NOTIFICATIONS" and "ABOUT" sections:

```
│  ─────────────────────────────────────────────  │
│  DATA                                           │
│  ─────────────────────────────────────────────  │
│                                                 │
│  ┌─────────────────────────────────────────┐    │
│  │  📤  Export All Data                 >  │    │
│  │      Download your data as a            │    │
│  │      spreadsheet                        │    │
│  └─────────────────────────────────────────┘    │
│  Tap → Screen 32a (Export Options Bottom Sheet)  │
│                                                 │
```

### Screen 19 (Quick Actions Menu) — UPDATE EXPORT ACTION

Change existing "Export Data" to route through Screen 32a instead of directly generating:

```
BEFORE:
  Tap [Export Data] → Generates CSV/PDF

AFTER:
  Tap [Export Data] → Screen 32a (Export Options, project pre-selected)
```

### Screen 5 (Reports Tab) — UPDATE EXPORT BUTTON

Change existing [📤 Export Report] to route through Screen 32a:

```
BEFORE:
  Tap [Export Report] → Screen 32 (Export Success)

AFTER:
  Tap [Export Report] → Screen 32a (Export Options, project pre-selected,
                         period inherited from Reports tab filter)
```

---

## IMPLEMENTATION PRIORITY (BUILD ORDER)

```
PHASE 1: Core Generation (3-4 days)
  □ ExportOptions model
  □ ExportService interface
  □ XLSX generator (Summary tab + Project tabs)
  □ Formulas working (Profit, Totals)
  □ File naming and temp storage
  
PHASE 2: UI Screens (2-3 days)
  □ Screen 32a Export Options Bottom Sheet
  □ Period selector (All Time, 30 Days, Custom)
  □ Format selector (XLSX, CSV)
  □ Include checkboxes
  □ Preview line (dynamic counts)
  □ Loading state
  
PHASE 3: Screen 32 Enhancement (1 day)
  □ Enhanced success modal with file info
  □ Download action
  □ Share action (system share sheet)
  □ Done action
  
PHASE 4: Entry Point Wiring (1 day)
  □ Settings page: Add DATA section with Export row
  □ Quick Actions Menu: Route to Screen 32a
  □ Reports Tab: Route to Screen 32a with pre-selections
  
PHASE 5: Edge Cases & Polish (2-3 days)
  □ Mixed currency handling
  □ Tab name sanitization
  □ Empty project handling
  □ Platform spend breakdown table
  □ Posts section in project tabs
  □ CSV fallback generation
  □ CSV ZIP bundling for multi-project

PHASE 6: Testing (1-2 days)
  □ Run full testing checklist
  □ Test on Android + iOS
  □ Test opening in Excel, Google Sheets, Numbers
  □ Test sharing to WhatsApp, Gmail, Drive
  
TOTAL ESTIMATED EFFORT: 10-14 days
```

---

**Document Version:** 1.0  
**Last Updated:** March 2026  
**Applies to:** Screen 32 (Enhanced), Screen 32a (New)  
**Modifies:** Screen 19, Screen 34, Screen 5  
**Status:** Ready for implementation  
**Classification:** Core / Must-Have for V1
