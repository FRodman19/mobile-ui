# Rhydle V1.1 — Expense Broadening

**Purpose:** Open the app to all business types, not just ad runners.
**Status:** Ready for development
**Risk level:** Low — no new navigation flows, no new patterns, backwards compatible

---

## What Problem We Are Solving

Version 1 was built for ad runners. Every expense field says "Ad Spend," every expense row requires a platform, and the data model can only store platform-linked expenses. A freelancer paying an editor or a seller buying inventory has no way to log it.

We are not adding a feature. We are removing a wall that blocks most users from using what is already built.

**What we are doing:** Broadening the expense input so any type of business cost flows through the existing tracking system.

**What we are NOT doing:** Rebuilding screens, adding templates, creating tracker types, changing navigation, or adding platform integrations.

---

## The Core Concept — How Channels and Expense Types Work Together

In V1, "platform" means one thing: where you spend ad money. In V1.1, we separate this into two concepts that combine into one unified expense system.

```
PROJECT CREATION — two groups, presented separately for clarity:

  ┌─────────────────────────────────────────────────┐
  │                                                 │
  │  AD CHANNELS (optional)                         │
  │  Where do you run paid ads?                     │
  │  [YouTube] [Facebook] [Instagram]               │
  │  [TikTok] [Google]                              │
  │                                                 │
  │  OTHER COSTS (optional)                         │
  │  What else do you regularly spend on?            │
  │  [Tools] [Team] [Products] [Shipping]           │
  │                                                 │
  └─────────────────────────────────────────────────┘

  These two groups exist ONLY on the creation/edit screen
  to help the user understand what they are configuring.

  Behind the scenes, both groups feed into the SAME system:

  ┌──────────────────────────────────────────────────┐
  │                                                  │
  │  Ad Channels    ──→  pre-filled expense rows     │
  │  (type: ADS)         with platform brand icons   │
  │                                                  │
  │  Other Costs    ──→  pre-filled expense rows     │
  │  (type: TOOLS,       with monochrome icons       │
  │   TEAM, etc.)                                    │
  │                                                  │
  │  Both save to the SAME table: entry_expenses     │
  │  Both contribute to the SAME total: total_spend  │
  │  Both affect the SAME calculation: profit        │
  │                                                  │
  └──────────────────────────────────────────────────┘
```

**Why we present them separately on the creation screen:** The user intuitively understands "I run ads on Facebook" as different from "I pay for tools." Grouping them separately makes the setup feel natural. The user sees what applies to them and skips what doesn't. A freelancer ignores the Ad Channels section entirely and just picks Tools + Team. An ad runner picks their platforms and ignores Other Costs. A hybrid user picks from both. The result is a Log Entry form that is pre-configured exactly for their business.

**Why this encourages multiple projects:** A user selling jewelry on Etsy AND running a YouTube channel has two different expense profiles. Rather than cramming both into one project (and cluttering the form), they create two projects — each with its own channels and cost types. This is the natural behavior we want: each project is a clean, focused tracker. This also feeds our analytics — we learn what combinations of channels and expense types real users configure, which informs future features.

---

## The Relationship Between Platforms and Expense Types

This is the source of most confusion, so here it is stated once, clearly.

```
EXPENSE TYPE is the category of spending.
CHANNEL/PLATFORM is a detail that only exists for one category: Ads.

  expense_type: ADS
    └── has a channel/platform (Facebook, YouTube, Instagram...)
        This is what V1 already tracks.

  expense_type: TOOLS
    └── no channel. Just an amount.
        "I spent $30 on software today."

  expense_type: TEAM
    └── no channel. Just an amount.
        "I paid my editor $150 today."

  expense_type: PRODUCTS
    └── no channel. Just an amount.
        "I bought $45 in materials today."

  expense_type: SHIPPING
    └── no channel. Just an amount.
        "I spent $22 on postage today."

  expense_type: OTHER
    └── no channel, but has a free-text LABEL.
        "I spent $18 on Etsy fees today."

Every expense row in the database has a type.
Only ADS rows have a platform/channel.
Only OTHER rows have a custom label.
Everything else is just type + amount.
```

---

## What Changes — Screen by Screen

### Screen 2 — Project Creation

The full creation form, showing what changes and what stays.

**Current form fields (from the live app):**
```
  Project Name *
  Start Date
  Currency
  Platforms *             (required, ad platforms only)
  Revenue Target          (optional)
  Engagement Target       (optional)
  Setup Cost
  Monthly Growth Cost
  Goals                   (optional chips)
  Notes                   (optional)
  Reminder Notifications
  [Create Project]
```

**New form fields:**
```
  Project Name *                              ← NO CHANGE
  Start Date                                  ← NO CHANGE
  Currency                                    ← NO CHANGE

  Where do you advertise? (Optional)          ← was "Platforms *"
  [Facebook] [YouTube] [Instagram]
  [TikTok] [Google]

  What do you regularly spend on? (Optional)  ← NEW group
  [Tools] [Team] [Products] [Shipping]

  Income Goal (Optional)                      ← was "Revenue Target"
  ┌─────────────────────────────────┐
  │ e.g., 500000               USD │
  └─────────────────────────────────┘
  Set an income target to track on your Goals page

  Leads Goal (Optional)                       ← was "Engagement Target"
  ┌─────────────────────────────────┐
  │ e.g., 100 DMs/Leads            │         ← DISABLED/GREYED OUT
  └─────────────────────────────────┘           if no ad platform selected
  Tracks leads from your advertising
  platforms. Select a platform above to enable.

  (once user selects an ad platform, field becomes active
   and note changes to:)
  Track DMs and leads from your advertising

  Setup Cost                                  ← NO CHANGE
  Monthly Growth Cost                         ← NO CHANGE
  Goals (Optional)                            ← NO CHANGE (chips)
  Notes (Optional)                            ← NO CHANGE
  Reminder Notifications                      ← NO CHANGE
  [Create Project]
```

| Change | Detail |
|---|---|
| "Platforms" split into two groups | "Where do you advertise?" and "What do you regularly spend on?" — question-based headers so the user answers naturally |
| Both groups now optional | User can skip both. A freelancer can create a project with nothing selected |
| Platform list updated | Removed: LinkedIn, Twitter, Blog, Reddit. Added: Google. These are ad-specific platforms |
| Other Costs group added | Tools, Team, Products, Shipping. Non-ad expense types |
| Validation removed | No more "at least 1 platform required" |
| "Revenue Target" → "Income Goal" | Word "Goal" added so user connects this field to what appears on the Goals tab |
| "Engagement Target" → "Leads Goal" | Renamed, always visible but disabled until ad platform is selected. Note explains the relationship |

**What gets stored on the tracker:**
```
tracker {
  name: "My Project"
  start_date: "2026-03-03"
  currency: "USD"
  channels: ["facebook", "tiktok"]        // from "Where do you advertise?"
  expense_types: ["tools", "team"]         // from "What do you regularly spend on?" — NEW FIELD
  income_target: 500000                    // from "Income Goal" (was revenue_target)
  engagement_target: 100                   // from "Leads Goal" (was engagement_target)
}
```

The edit project screen mirrors these same changes.

---

### Screen 7 — Log Entry (The Critical Screen)

**Principle:** The form is pre-filled from the project configuration, exactly like today. The user types numbers into existing rows. The only addition is a [+ Add expense] button for one-off items.

**Current state (from the live app):**
```
┌─────────────────────────────────┐
│ ⊗  Log Entry              Save  │
│                                 │
│ Date                            │
│ ┌─────────────────────────────┐ │
│ │  <    TODAY               > │ │
│ │  Tuesday, Mar 3, 2026      │ │
│ └─────────────────────────────┘ │
│                                 │
│ Total Revenue                   │
│ ┌─────────────────────────────┐ │
│ │ [$] 0                  USD │ │
│ └─────────────────────────────┘ │
│ How much did you earn today?    │
│                                 │
│ ─────────────────────────────── │
│                                 │
│ AD SPEND              Today: $0 │
│                                 │
│ facebook                        │
│ ┌─────────────────────────────┐ │
│ │ [f] 0                  USD │ │
│ └─────────────────────────────┘ │
│                                 │
│ tiktok                          │
│ ┌─────────────────────────────┐ │
│ │ [♪] 0                  USD │ │
│ └─────────────────────────────┘ │
│                                 │
│ x                               │
│ ┌─────────────────────────────┐ │
│ │ [X] 0                  USD │ │
│ └─────────────────────────────┘ │
│                                 │
│ Enter how much you spent on     │
│ each platform today             │
│                                 │
│ ─────────────────────────────── │
│                                 │
│ DMS / LEADS (Optional)          │
│ ┌─────────────────────────────┐ │
│ │     [−]    0    [+]        │ │
│ └─────────────────────────────┘ │
│                                 │
│ ─────────────────────────────── │
│                                 │
│ Notes (Optional)                │
│ ┌─────────────────────────────┐ │
│ │ Any notes about today...    │ │
│ └─────────────────────────────┘ │
│                                 │
│ ┌─────────────────────────────┐ │
│ │ SUMMARY                     │ │
│ │ Revenue             $0      │ │
│ │ Spend              -$0      │ │
│ │ ─────────────────────────── │ │
│ │ Profit/Loss        +$0      │ │
│ └─────────────────────────────┘ │
│                                 │
│ [         Save Entry          ] │
└─────────────────────────────────┘
```

**New state — for an ad runner who selected Facebook + TikTok:**
```
┌─────────────────────────────────┐
│ ⊗  Log Entry              Save  │
│                                 │
│ Date                            │
│ ┌─────────────────────────────┐ │
│ │  <    TODAY               > │ │
│ │  Tuesday, Mar 3, 2026      │ │
│ └─────────────────────────────┘ │
│                                 │
│ Income                          │
│ ┌─────────────────────────────┐ │
│ │ [$] 0                  USD │ │
│ └─────────────────────────────┘ │
│ How much did you earn today?    │
│                                 │
│ ─────────────────────────────── │
│                                 │
│ EXPENSES              Today: $0 │
│                                 │
│ facebook                        │
│ ┌─────────────────────────────┐ │
│ │ [f] 0                  USD │ │  ← pre-filled from channels
│ └─────────────────────────────┘ │
│                                 │
│ tiktok                          │
│ ┌─────────────────────────────┐ │
│ │ [♪] 0                  USD │ │  ← pre-filled from channels
│ └─────────────────────────────┘ │
│                                 │
│ Enter how much you spent today  │
│                                 │
│ [+ Add expense]                 │  ← NEW (for one-offs)
│                                 │
│ ─────────────────────────────── │
│                                 │
│ DMS / LEADS (Optional)          │
│ ┌─────────────────────────────┐ │
│ │     [−]    0    [+]        │ │
│ └─────────────────────────────┘ │
│                                 │
│ ─────────────────────────────── │
│                                 │
│ Notes (Optional)                │
│ ┌─────────────────────────────┐ │
│ │ Any notes about today...    │ │
│ └─────────────────────────────┘ │
│                                 │
│ ┌─────────────────────────────┐ │
│ │ SUMMARY                     │ │
│ │ Income              $0      │ │
│ │ Expenses           -$0      │ │
│ │ ─────────────────────────── │ │
│ │ Profit/Loss        +$0      │ │
│ └─────────────────────────────┘ │
│                                 │
│ [         Save Entry          ] │
└─────────────────────────────────┘

CHANGES FROM CURRENT:
  "Total Revenue"  → "Income"
  "AD SPEND"       → "EXPENSES"
  "Revenue"        → "Income"  (in summary)
  "Spend"          → "Expenses" (in summary)
  Platform rows    → unchanged (still pre-filled from project)
  [+ Add expense]  → NEW button below expense rows
  Microcopy        → "Enter how much you spent today"
                     (removed "on each platform")
```

**For a freelancer who selected Tools + Team (no ad channels):**
```
┌─────────────────────────────────┐
│ ⊗  Log Entry              Save  │
│                                 │
│ Date                            │
│ ┌─────────────────────────────┐ │
│ │  <    TODAY               > │ │
│ │  Tuesday, Mar 3, 2026      │ │
│ └─────────────────────────────┘ │
│                                 │
│ Income                          │
│ ┌─────────────────────────────┐ │
│ │ [$] 0                  USD │ │
│ └─────────────────────────────┘ │
│ How much did you earn today?    │
│                                 │
│ ─────────────────────────────── │
│                                 │
│ EXPENSES              Today: $0 │
│                                 │
│ tools                           │
│ ┌─────────────────────────────┐ │
│ │ [🔧] 0                 USD │ │  ← pre-filled from expense_types
│ └─────────────────────────────┘ │
│                                 │
│ team                            │
│ ┌─────────────────────────────┐ │
│ │ [👥] 0                 USD │ │  ← pre-filled from expense_types
│ └─────────────────────────────┘ │
│                                 │
│ Enter how much you spent today  │
│                                 │
│ [+ Add expense]                 │
│                                 │
│ ─────────────────────────────── │
│                                 │
│ Notes (Optional)                │
│ ┌─────────────────────────────┐ │
│ │ Any notes about today...    │ │
│ └─────────────────────────────┘ │
│                                 │
│ ┌─────────────────────────────┐ │
│ │ SUMMARY                     │ │
│ │ Income              $0      │ │
│ │ Expenses           -$0      │ │
│ │ ─────────────────────────── │ │
│ │ Profit/Loss        +$0      │ │
│ └─────────────────────────────┘ │
│                                 │
│ [         Save Entry          ] │
└─────────────────────────────────┘

NOTE: DMS / LEADS section not shown.
Freelancer has no ad channels — leads tracking
is irrelevant. Only show DMS/LEADS if the project
has ad channels configured.
```

**For a hybrid user who selected Facebook + YouTube + Team + Tools:**
```
┌─────────────────────────────────┐
│ ⊗  Log Entry              Save  │
│                                 │
│ (date picker same as above)     │
│                                 │
│ Income                          │
│ ┌─────────────────────────────┐ │
│ │ [$] 0                  USD │ │
│ └─────────────────────────────┘ │
│                                 │
│ ─────────────────────────────── │
│                                 │
│ EXPENSES              Today: $0 │
│                                 │
│ facebook                        │
│ ┌─────────────────────────────┐ │
│ │ [f] 0                  USD │ │  ← from channels
│ └─────────────────────────────┘ │
│                                 │
│ youtube                         │
│ ┌─────────────────────────────┐ │
│ │ [▶] 0                 USD │ │  ← from channels
│ └─────────────────────────────┘ │
│                                 │
│ team                            │
│ ┌─────────────────────────────┐ │
│ │ [👥] 0                 USD │ │  ← from expense_types
│ └─────────────────────────────┘ │
│                                 │
│ tools                           │
│ ┌─────────────────────────────┐ │
│ │ [🔧] 0                 USD │ │  ← from expense_types
│ └─────────────────────────────┘ │
│                                 │
│ Enter how much you spent today  │
│                                 │
│ [+ Add expense]                 │
│                                 │
│ ─────────────────────────────── │
│                                 │
│ DMS / LEADS (Optional)          │
│ (shown because project has      │
│  ad channels)                   │
│                                 │
│ ─────────────────────────────── │
│                                 │
│ (notes + summary + save same)   │
└─────────────────────────────────┘
```

**For a user who selected nothing at creation:**
```
┌─────────────────────────────────┐
│                                 │
│ Income                          │
│ ┌─────────────────────────────┐ │
│ │ [$] 0                  USD │ │
│ └─────────────────────────────┘ │
│                                 │
│ ─────────────────────────────── │
│                                 │
│ EXPENSES              Today: $0 │
│                                 │
│ No expense categories set up.   │
│ Tap below to add expenses, or   │
│ set them up in project settings │
│ so they appear here every day.  │
│                                 │
│ [+ Add expense]                 │
│                                 │
│ ─────────────────────────────── │
│                                 │
│ (notes + summary + save)        │
└─────────────────────────────────┘
```

#### Pre-fill Rules

```
RULE 1: tracker.channels generates pre-filled rows
        with type = ADS and the channel's brand icon.

RULE 2: tracker.expense_types generates pre-filled rows
        with their own type and a monochrome icon.

RULE 3: Channels come first, then expense types.
        Order within each group: same order as project config.

RULE 4: Pre-filled rows with $0 are included in the form
        but excluded from the save if untouched.
        (same as current V1 behavior with platforms)

RULE 5: DMS/LEADS section only shows if tracker.channels
        is not empty (user has ad channels).
```

#### The [+ Add Expense] Interaction

When the user taps [+ Add expense], a bottom sheet appears:

```
┌─────────────────────────────────┐
│                                 │
│ Add Expense                     │
│                                 │
│ Amount                          │
│ ┌─────────────────────────────┐ │
│ │ [$] ___                     │ │
│ └─────────────────────────────┘ │
│                                 │
│ What kind?                      │
│ ┌────────┐ ┌────────┐ ┌──────┐ │
│ │  Ads   │ │ Tools  │ │ Team │ │
│ └────────┘ └────────┘ └──────┘ │
│ ┌──────────┐ ┌──────────┐      │
│ │ Products │ │ Shipping │      │
│ └──────────┘ └──────────┘      │
│ ┌────────┐                     │
│ │ Other  │                     │
│ └────────┘                     │
│                                 │
│ ─── conditional fields ──────── │
│                                 │
│ IF "Ads" selected:              │
│ Channel                         │
│ ┌─────────────────────────────┐ │
│ │ [Select channel         ▼] │ │
│ └─────────────────────────────┘ │
│ Shows: project channels +       │
│ defaults (YT, FB, IG, TT, G)   │
│ + Other with free text          │
│                                 │
│ IF "Other" selected:            │
│ What's this for?                │
│ ┌─────────────────────────────┐ │
│ │ [e.g. Etsy fees          ] │ │
│ └─────────────────────────────┘ │
│                                 │
│ IF anything else selected:      │
│ (no extra fields — just amount  │
│  and type)                      │
│                                 │
│ [Add to entry]     [Cancel]     │
│                                 │
└─────────────────────────────────┘
```

After tapping "Add to entry," the expense appears as a new row on the main form with an [×] remove button (since it is a one-off, not a pre-configured row):

```
│ other · Etsy fees               │
│ ┌─────────────────────────────┐ │
│ │ [📝] 18                USD │ │  [×]
│ └─────────────────────────────┘ │
```

**What [+ Add expense] is for:** One-off expenses that don't appear every day. A mic stand, a one-time fee, an unusual cost. If the user finds themselves adding the same type daily, they should add it in project settings so it becomes a pre-filled row.

**What [+ Add expense] is NOT for:** Reconfiguring the project. The user cannot rename types, reorder rows, or change their project setup from this screen.

---

### Screen 9 — Edit Entry

Exact same form as Screen 7, pre-filled with the saved entry data. All the same layout and interaction rules apply.

**For migrated V1 entries:** Existing platform spend rows display as pre-filled expense rows with type: ADS. The edit form shows them identically to how they were saved.

---

### Overview Tab — Posts Section

The Posts feature (Add Post form + post list on the Overview tab) is a content tracking tool for users who publish ads or content on social platforms. It is pre-work for V1.5 AI Post Analysis.

**V1.1 change: conditional visibility based on ad channels.**

```
RULE:
  IF tracker.channels is NOT empty (user has ad channels):
    → Show "Posts (Optional)" section on Overview tab
    → Show "+ Add Post" button
    → Platform dropdown in Add Post shows tracker.channels
    → Everything works exactly as today — zero changes

  IF tracker.channels IS empty (freelancer, non-ad user):
    → Hide "Posts (Optional)" section entirely
    → User never sees it
```

**No changes to:** Add Post form fields, post list display, post data model, post edit/delete functionality. The only change is the conditional show/hide based on whether the project has ad channels configured.

This follows the same pattern as DMS/LEADS on Log Entry — only shown when ad channels exist.

---

### Screen 8 — Entry Detail

The Entry Detail screen has a specific card-based structure. We keep that structure and only change labels and card content where needed.

**PROFIT/LOSS SUMMARY — zero changes:**
```
┌──────────────────────────────────────┐
│     PROFIT/LOSS SUMMARY              │
│     ▲ $494,96                       │
│     NET PROFIT                       │
└──────────────────────────────────────┘

No changes. Profit is profit.
```

**BREAKDOWN — Revenue/Income card:**
```
CURRENT:
┌──────────────────────────────────────┐
│ 💰 Revenue                           │
│                                      │
│ Total Received             $500      │
│ From all channels combined           │
└──────────────────────────────────────┘

NEW:
┌──────────────────────────────────────┐
│ 💰 Income                            │  ← header change only
│                                      │
│ Total Received             $500      │  ← NO CHANGE
│ From all channels combined           │  ← NO CHANGE
└──────────────────────────────────────┘
```

**BREAKDOWN — AD SPEND/Expenses card:**

For existing/migrated entries (all expenses are type ADS), the card looks nearly identical to current:
```
CURRENT:
┌──────────────────────────────────────┐
│ 💸 AD SPEND                          │
│                                      │
│ [f] facebook               $2,28    │
│ [♪] tiktok                 $1,92    │
│ [X] x                      $0,84    │
│ ─────────────────────────────────    │
│ Total Spend                $5,04     │
└──────────────────────────────────────┘

NEW (ad-only entry — same data, label change):
┌──────────────────────────────────────┐
│ 💸 Expenses                          │  ← "AD SPEND" → "Expenses"
│                                      │
│ [f] facebook               $2,28    │  ← NO CHANGE
│ [♪] tiktok                 $1,92    │  ← NO CHANGE
│ [X] x                      $0,84    │  ← NO CHANGE
│ ─────────────────────────────────    │
│ Total Expenses             $5,04     │  ← "Total Spend" → "Total Expenses"
└──────────────────────────────────────┘

Platform icons, per-platform amounts, layout — ALL IDENTICAL.
```

For a NEW entry that has mixed expense types:
```
NEW (mixed entry):
┌──────────────────────────────────────┐
│ 💸 Expenses                          │
│                                      │
│ [f] facebook              $100,00    │  ← ADS type, platform icon
│ [▶] youtube               $200,00   │  ← ADS type, platform icon
│ [👥] team                  $300,00   │  ← TEAM type, monochrome icon
│ [🔧] tools                  $15,00   │  ← TOOLS type, monochrome icon
│ [📝] mic stand               $45,00  │  ← OTHER type, shows custom label
│ ─────────────────────────────────    │
│ Total Expenses            $660,00    │
└──────────────────────────────────────┘

Same card structure. Same layout pattern.
Each row: icon + name + amount (right-aligned).
Non-ad rows use monochrome icons and show type name
or custom label instead of platform name.
```

For a freelancer entry with no ads:
```
NEW (no-ads entry):
┌──────────────────────────────────────┐
│ 💸 Expenses                          │
│                                      │
│ [🔧] tools                  $30,00   │
│ [👥] team                  $150,00   │
│ ─────────────────────────────────    │
│ Total Expenses            $180,00    │
└──────────────────────────────────────┘
```

**DMS / LEADS card — conditional display:**
```
CURRENT:
┌──────────────────────────────────────┐
│ 💬 DMS / LEADS                       │
│                                      │
│ Total Received        39 messages    │
│ Potential leads                      │
└──────────────────────────────────────┘

V1.1:
  IF entry has leads > 0 → show card exactly as-is, NO CHANGES
  IF entry has leads = 0 or null → hide this card entirely
```

**CALCULATION section:**
```
CURRENT:
┌──────────────────────────────────────┐
│ CALCULATION                          │
│                                      │
│ Revenue               +$500          │
│ Total Spend           - $5,04        │
│ ─────────────────────────────────    │
│ Daily Profit      ▲ $494,96         │
└──────────────────────────────────────┘

NEW:
┌──────────────────────────────────────┐
│ CALCULATION                          │
│                                      │
│ Income                +$500          │  ← "Revenue" → "Income"
│ Total Expenses        - $5,04        │  ← "Total Spend" → "Total Expenses"
│ ─────────────────────────────────    │
│ Daily Profit      ▲ $494,96         │  ← NO CHANGE
└──────────────────────────────────────┘

Label swap only. Math and layout unchanged.
```

**NOTES + METADATA + Edit Entry button:** Zero changes. These sections have nothing to do with expense or revenue terminology.

---

### Entries Tab — Summary Card + Entry Cards

The Entries tab has two parts: a summary card at the top and individual entry cards below. Both keep their existing layout.

**Summary card — zero structural changes:**
```
┌──────────────────────────────────────┐
│ 📊 SUMMARY (30 days)                │
│                                      │
│ Total Entries     │ Total Profit     │
│ 2                 │ $269             │
│───────────────────│──────────────────│
│ Avg Daily Profit  │ Total DMs/Leads  │
│ $134,5            │ 5                │
│───────────────────┴──────────────────│
│ Best Day  Feb 27            $319     │
│ Worst Day Feb 2             $-50     │
└──────────────────────────────────────┘

No changes. All values come from aggregated totals.
DMs/Leads stays if it has data.
```

**Entry cards — label swap only:**
```
CURRENT:
┌──────────────────────────────────────┐
│ 27    ▲ $319  Profit                 │
│ Feb   Revenue: $3...  │ Spend: $75   │  💬 5  >
└──────────────────────────────────────┘

NEW:
┌──────────────────────────────────────┐
│ 27    ▲ $319  Profit                 │
│ Feb   Income: $3...  │ Expenses: $75 │  💬 5  >
└──────────────────────────────────────┘

ONLY CHANGES:
  "Revenue" → "Income"
  "Spend"   → "Expenses"

Card layout, date display, profit arrow, profit/loss label,
leads icon, navigation arrow — ALL UNCHANGED.
No expense type summary line added to cards.
```

Filter chips (7 days / 30 days / All Time), History link, and the Log Entry FAB are all unchanged.

---

### Screen 5 — Reports Tab

The Reports tab has several card sections. Most need only label swaps. One new card is added.

**TOTAL PROFIT/LOSS card:**
```
CURRENT:
┌──────────────────────────────────────┐
│ 📊 TOTAL PROFIT/LOSS                │
│                                      │
│ ▲ +$5 363,68                        │
│                                      │
│ Total Revenue          $5 755,08     │
│ Total Spend           -$353,96       │
│ Setup Costs           -$37,44        │
│ ───────────────────────────────────  │
│ Final Profit      ▲ +$5 363,68      │
└──────────────────────────────────────┘

NEW:
┌──────────────────────────────────────┐
│ 📊 TOTAL PROFIT/LOSS                │
│                                      │
│ ▲ +$5 363,68                        │  ← NO CHANGE
│                                      │
│ Total Income           $5 755,08     │  ← "Revenue" → "Income"
│ Total Expenses        -$353,96       │  ← "Spend" → "Expenses"
│ Setup Costs           -$37,44        │  ← NO CHANGE
│ ───────────────────────────────────  │
│ Final Profit      ▲ +$5 363,68      │  ← NO CHANGE
└──────────────────────────────────────┘

Structure, numbers, Setup Costs line — all unchanged.
```

**NEW CARD — EXPENSE BREAKDOWN (inserted after TOTAL PROFIT/LOSS):**

This is the one new section added to reports. It follows the same card styling as existing cards.

```
┌──────────────────────────────────────┐
│ 📊 EXPENSE BREAKDOWN                │
│                                      │
│ By type:                             │
│ Ads                    $353,96   91% │
│ Tools                   $25,00    6% │
│ Team                    $12,44    3% │
│ ───────────────────────────────────  │
│ Total                  $391,40       │
└──────────────────────────────────────┘

DISPLAY RULES:
  - Only shows expense types that have > $0 total
  - If ALL expenses are ADS type (like migrated V1 data),
    shows: "Ads  $353,96  100%"
  - Types with $0 are not listed
  - Percentages relative to total expenses
  - No per-channel breakdown inside this card
    (reports currently do not break down by platform
    and we are not adding that in V1.1)
```

**REVENUE VS SPEND OVER TIME:**
```
CURRENT:
┌──────────────────────────────────────┐
│ 🔄 REVENUE VS SPEND OVER TIME       │
│                                      │
│ Nov 18-Nov 24                        │
│ Revenue: $27,48                      │
│ Spend: $20,76                        │
│ Profit: ▲ +$6,72                    │
└──────────────────────────────────────┘

NEW:
┌──────────────────────────────────────┐
│ 🔄 INCOME VS EXPENSES OVER TIME     │  ← header change
│                                      │
│ Nov 18-Nov 24                        │
│ Income: $27,48                       │  ← "Revenue" → "Income"
│ Expenses: $20,76                     │  ← "Spend" → "Expenses"
│ Profit: ▲ +$6,72                    │  ← NO CHANGE
└──────────────────────────────────────┘

Same pattern for all weekly/monthly rows.
```

**WORST PERFORMING DAYS:**
```
CURRENT:
│ 1. Feb 2: ▼ $-50                    │
│ Revenue: $0, Spend: $50             │

NEW:
│ 1. Feb 2: ▼ $-50                    │
│ Income: $0, Expenses: $50           │

Label swap only. Structure unchanged.
```

**BURN RATE card:**
```
CURRENT:
┌──────────────────────────────────────┐
│ 💰 BURN RATE                         │
│ How fast you're spending money       │
│                                      │
│ Average Daily Spend        $10,41    │
│ Average Weekly Spend       $72,87    │
│ Average Monthly Spend      $316,88   │
│ ───────────────────────────────────  │
│ Current Pace:                        │
│ At this rate, you'll spend           │
│ $3 799,65 per year on ads            │
│                                      │
│ ROI                        1526%     │
│ For every 1 USD spent, you           │
│ earn 16.26 in revenue                │
└──────────────────────────────────────┘

NEW:
┌──────────────────────────────────────┐
│ 💰 DAILY SPEND                       │  ← "BURN RATE" → "DAILY SPEND"
│ How fast you're spending money       │  ← NO CHANGE
│                                      │
│ Average Daily Spend        $10,41    │  ← NO CHANGE
│ Average Weekly Spend       $72,87    │  ← NO CHANGE
│ Average Monthly Spend      $316,88   │  ← NO CHANGE
│ ───────────────────────────────────  │
│ Current Pace:                        │
│ At this rate, you'll spend           │
│ $3 799,65 per year                   │  ← remove "on ads"
│                                      │
│ ROI                        1526%     │  ← NO CHANGE
│ For every 1 USD spent, you           │
│ earn 16.26 in income                 │  ← "revenue" → "income"
└──────────────────────────────────────┘

Structure and all numbers unchanged.
```

**CUMULATIVE PROFIT TREND + Break-even:**
```
┌──────────────────────────────────────┐
│ 📈 CUMULATIVE PROFIT TREND           │
│                                      │
│ Jan 16                  ▲ +$87,24   │
│ Jan 17                  ▲ +$94,68   │
│ ...                                  │
│                                      │
│ ✓ Break-even: Dec 10 (day 22)       │
│ Recovered setup costs on Dec 10      │
└──────────────────────────────────────┘

ZERO CHANGES. This section uses profit only.
```

**Daily/Weekly/Monthly/All Time filter chips and Export Report button:** Zero changes.

**Summary of Reports changes:**
- One NEW card: Expense Breakdown (by type, no per-channel detail)
- Label swaps: "Revenue" → "Income", "Spend" → "Expenses" across existing cards
- "BURN RATE" → "DAILY SPEND" header
- Remove "on ads" from pace text
- Everything else: structure, numbers, calculations, layout — unchanged

---

### Goals Tab

The Goals tab currently shows two cards: REVENUE GOAL and ENGAGEMENT GOAL. Both keep their existing card layout and progress bar style.

**REVENUE GOAL card → renamed to INCOME GOAL:**
```
CURRENT:
┌──────────────────────────────────────┐
│ 💰 REVENUE GOAL                      │
│                                      │
│ GOAL: $375                           │
│ ████████████████████████████  green  │
│ 1440.3%        +$5 026,12 over goal │
└──────────────────────────────────────┘

NEW:
┌──────────────────────────────────────┐
│ 💰 INCOME GOAL                       │  ← "REVENUE" → "INCOME"
│                                      │
│ GOAL: $375                           │  ← NO CHANGE
│ ████████████████████████████  green  │  ← NO CHANGE
│ 1440.3%        +$5 026,12 over goal │  ← NO CHANGE
└──────────────────────────────────────┘

Available to ALL projects. Everyone has income targets.
Shows if user set an Income Goal during project creation.
If not set: show setup prompt — "No income target set.
Set one in project settings to track your progress."
```

**ENGAGEMENT GOAL card → renamed to LEADS GOAL, conditional display:**
```
CURRENT:
┌──────────────────────────────────────┐
│ 💬 ENGAGEMENT GOAL                   │
│                                      │
│ GOAL: 500 DMs                        │
│ ████████████████████████████  green  │
│ 208.0%           +540 DMs over goal │
└──────────────────────────────────────┘

NEW — project HAS ad platforms AND target is set:
┌──────────────────────────────────────┐
│ 💬 LEADS GOAL                        │  ← "ENGAGEMENT" → "LEADS"
│                                      │
│ GOAL: 500 DMs                        │  ← NO CHANGE
│ ████████████████████████████  green  │  ← NO CHANGE
│ 208.0%           +540 DMs over goal │  ← NO CHANGE
└──────────────────────────────────────┘

NEW — project HAS ad platforms but NO target set:
┌──────────────────────────────────────┐
│ 💬 LEADS GOAL                        │
│                                      │
│ No leads target set.                 │
│ Set one in project settings to       │
│ track your DMs and leads.            │
└──────────────────────────────────────┘

NEW — project has NO ad platforms:
┌──────────────────────────────────────┐
│ 💬 LEADS GOAL                        │
│                                      │
│ Available for projects that track    │
│ advertising. Add advertising         │
│ platforms in project settings to     │
│ enable lead tracking.                │
└──────────────────────────────────────┘
```

The Leads Goal card is always visible on the Goals tab — never hidden. For non-ad users it shows the explanation tag so the page doesn't feel empty and the user learns that the feature exists if they ever start advertising.

**Hub card progress bar — zero logic change:**
```
IF income target is set → show income progress bar
IF income target NOT set AND leads target is set
  → show leads progress bar
IF neither is set → no progress bar

This is the existing priority logic. No change needed.
Only the label inside the bar changes if it currently
says "Revenue" — swap to "Income."
```

**"Manage Goals" button:** No change. Still opens settings where user can edit targets.

---

### Label Changes Across All Screens

These are find-and-replace changes. No logic, no layout, no structural work.

| Location | Current | New |
|---|---|---|
| Log Entry header section | "Total Revenue" | "Income" |
| Log Entry expense section | "AD SPEND" | "EXPENSES" |
| Log Entry microcopy | "Enter how much you spent on each platform today" | "Enter how much you spent today" |
| Log Entry summary | "Revenue" / "Spend" | "Income" / "Expenses" |
| Entry Detail income card header | "Revenue" | "Income" |
| Entry Detail expense card header | "AD SPEND" | "Expenses" |
| Entry Detail expense card total | "Total Spend" | "Total Expenses" |
| Entry Detail calculation | "Revenue" / "Total Spend" | "Income" / "Total Expenses" |
| Entry Cards | "Revenue" / "Spend" | "Income" / "Expenses" |
| Reports: Total Profit/Loss card | "Total Revenue" / "Total Spend" | "Total Income" / "Total Expenses" |
| Reports: weekly/monthly rows | "Revenue" / "Spend" | "Income" / "Expenses" |
| Reports: over time header | "REVENUE VS SPEND OVER TIME" | "INCOME VS EXPENSES OVER TIME" |
| Reports: worst days rows | "Revenue" / "Spend" | "Income" / "Expenses" |
| Reports: burn rate header | "BURN RATE" | "DAILY SPEND" |
| Reports: pace text | "per year on ads" | "per year" |
| Reports: ROI text | "in revenue" | "in income" |
| Dashboard | "Revenue" / "Spend" | "Income" / "Expenses" |
| Project Creation | "Revenue Target" | "Income Goal" |
| Project Creation | "Engagement Target" | "Leads Goal" |
| Project Creation | "Platforms" | "Where do you advertise?" |
| Goals tab card header | "REVENUE GOAL" | "INCOME GOAL" |
| Goals tab card header | "ENGAGEMENT GOAL" | "LEADS GOAL" |
| Hub card progress bar | "Revenue" (if shown) | "Income" |

---

### Fields Being Removed from Screen 7

| Field | What happens |
|---|---|
| New Followers (integer) | Removed from form. Data stays in database. Not displayed anywhere |
| Engagement (percentage) | Removed from form. Data stays in database. Not displayed anywhere |
| Misc Cost (Setup/Tools) | Migrated to entry_expenses as type: OTHER, label: "Setup/Tools". Then removed from form |

For old entries that have followers/engagement data: Screen 8 (Entry Detail) can show them in a dimmed "Legacy" section so users can see their historical data, but the fields are no longer actively tracked.

---

## Data Model

### Current Schema (V1)

```
daily_entries
├── id (UUID, PK)
├── tracker_id (FK)
├── entry_date (DATE)
├── total_revenue (DECIMAL)
├── total_dms_leads (INTEGER, NOT NULL)
├── notes (TEXT)
├── profit (GENERATED: revenue - SUM(platform_spends))
└── timestamps

entry_platform_spends
├── id (UUID, PK)
├── entry_id (FK → daily_entries)
├── platform (TEXT, REQUIRED)
├── amount (DECIMAL)
└── timestamps
CONSTRAINT: UNIQUE(entry_id, platform)
```

### New Schema (V1.1)

**New table — replaces entry_platform_spends:**
```sql
CREATE TABLE entry_expenses (
  id UUID PRIMARY KEY,
  entry_id UUID NOT NULL REFERENCES daily_entries(id) ON DELETE CASCADE,
  amount DECIMAL NOT NULL DEFAULT 0,
  expense_type VARCHAR(50) NOT NULL,
  -- Valid values: 'ADS', 'TOOLS', 'TEAM', 'PRODUCTS', 'SHIPPING', 'OTHER'
  platform VARCHAR(50),
  -- Only populated when expense_type = 'ADS'
  -- Contains the channel name: 'facebook', 'youtube', etc.
  label VARCHAR(100),
  -- Only populated when expense_type = 'OTHER'
  -- Free text: 'Etsy fees', 'Mic stand', etc.
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

  CONSTRAINT chk_expense_amount CHECK(amount >= 0)
);

CREATE INDEX idx_expenses_entry ON entry_expenses(entry_id);
CREATE INDEX idx_expenses_type ON entry_expenses(expense_type);
CREATE INDEX idx_expenses_platform ON entry_expenses(platform);
```

**Modified table — trackers:**
```sql
ALTER TABLE trackers
  ADD COLUMN expense_types TEXT[] DEFAULT '{}';
  -- Stores: ['TOOLS', 'TEAM', 'PRODUCTS', 'SHIPPING']
  -- These generate pre-filled rows on Log Entry alongside channels
```

**Modified table — daily_entries:**
```sql
ALTER TABLE daily_entries
  ALTER COLUMN total_dms_leads DROP NOT NULL,
  ALTER COLUMN total_dms_leads SET DEFAULT 0;
  -- total_dms_leads becomes nullable (optional)
```

**What does NOT change:**
- `total_revenue` stays as a single field on daily_entries
- `profit` calculation stays: total_revenue - total_spend
- `total_spend` is still the sum of all expense amounts for that entry

### How Each Row Type Saves

```
PRE-FILLED ROW from channels (e.g. facebook):
  → {type: "ADS", platform: "facebook", label: null, amount: 150}

PRE-FILLED ROW from expense_types (e.g. tools):
  → {type: "TOOLS", platform: null, label: null, amount: 30}

ADDED via [+ Add expense] with type Ads, channel Instagram:
  → {type: "ADS", platform: "instagram", label: null, amount: 80}

ADDED via [+ Add expense] with type Other, label "Etsy fees":
  → {type: "OTHER", platform: null, label: "Etsy fees", amount: 18}

ADDED via [+ Add expense] with type Team:
  → {type: "TEAM", platform: null, label: null, amount: 300}
```

---

## Data Migration

### Migrating Existing Data

```sql
-- Step 1: Create entry_expenses from existing platform spends
INSERT INTO entry_expenses (id, entry_id, amount, expense_type, platform, created_at, updated_at)
SELECT
  gen_random_uuid(),
  entry_id,
  amount,
  'ADS',
  platform,
  created_at,
  updated_at
FROM entry_platform_spends;

-- Step 2: Migrate misc_cost values (if any exist)
-- These were in the Growth & Setup section
INSERT INTO entry_expenses (id, entry_id, amount, expense_type, label, created_at)
SELECT
  gen_random_uuid(),
  id,
  misc_cost,
  'OTHER',
  'Setup/Tools',
  created_at
FROM daily_entries
WHERE misc_cost > 0;

-- Step 3: Set all existing trackers to have empty expense_types
-- (they only have channels, which is correct)
UPDATE trackers SET expense_types = '{}' WHERE expense_types IS NULL;

-- Step 4: Verify profit calculations
-- For every entry:
-- total_revenue - SUM(entry_expenses.amount)
-- must equal the existing profit value

-- Step 5: Keep entry_platform_spends table (do not drop)
-- Remove in a future release after confirming stability
```

**What happens to existing data on each screen:**

| Screen | Before | After | User sees |
|---|---|---|---|
| Log Entry | Platform rows pre-filled from tracker.platforms | Same rows, now from tracker.channels | Identical (same platforms, same icons, same amounts) |
| Entry Detail | "AD SPEND" card with platform rows | "Expenses" card with same platform rows | Same info, header + total label change only |
| Entry Cards | "Revenue: $X │ Spend: $X" | "Income: $X │ Expenses: $X" | Label swap only, card layout unchanged |
| Reports | No expense type breakdown | New "Expense Breakdown" card with by-type percentages | One new card, all existing cards get label swaps only |
| Dashboard | "Spend: $4,159" | "Expenses: $4,159" | Label change only |

**Zero data loss. Zero calculation changes.**

---

## Icons

### Platform Icons (Ad Channels) — Keep Existing

These are the brand-colored platform logos already in the app. They appear in expense rows for ADS-type entries.

| Channel | Icon | Style |
|---|---|---|
| facebook | Facebook blue logo | Brand color, existing asset |
| instagram | Instagram logo | Brand color, existing asset |
| tiktok | TikTok logo | Brand color, existing asset |
| youtube | YouTube red logo | Brand color, existing asset |
| google | Google logo | Brand color, existing asset |
| x | X logo | Brand color, existing asset |

### Expense Type Icons — New, Monochrome

These are simple icons for non-ad expense types. Use Iconsax or equivalent icon library already in the project.

| Type | Icon | Description |
|---|---|---|
| tools | Wrench or gear | Software, subscriptions |
| team | Two people | Editors, contractors, freelancers |
| products | Box/package | Inventory, materials, COGS |
| shipping | Truck or delivery | Postage, logistics |
| other | Tag or note | Catch-all with custom label |

**Visual distinction principle:**
- Brand-colored logos = ad platforms (user recognizes instantly)
- Monochrome icons = business expense types (clean, not distracting)
- This creates natural visual grouping on the Log Entry screen without needing labels or separators

---

## Edge Cases

### User logs expenses but no income
Entry saves with $0 revenue. Profit shows negative (red). This is valid — investment days before revenue starts.

### User logs income but no expenses
All pre-filled expense rows show $0. Entry saves with only the revenue. Profit equals revenue. No expense rows with $0 are written to entry_expenses.

### User has the same channel as a pre-filled row AND adds it via [+ Add]
Example: Facebook is pre-filled AND user adds another Ads expense for Facebook via [+ Add]. Both save as separate entry_expenses rows. This is valid — the user may have split their Facebook spend across campaigns. The new table has no uniqueness constraint on platform.

### User selects "Other" via [+ Add] but leaves label empty
Save succeeds. Displays as "Other $X" with no label. The label is optional.

### Editing a migrated V1 entry
Screen 9 shows the new form layout. Existing platform spends display as pre-filled ADS rows. User can now add non-ad expenses to the old entry via [+ Add].

### Entry with many expense rows
Screen 7 scrolls. No hard limit. The summary card stays at the bottom.

### Reports with zero entries of a given type
Don't display empty types in the Expense Breakdown card. If all expenses are ADS, show "Ads 100%". No "Tools 0%" rows.

### Project with no channels and no expense types
Log Entry shows empty expense section with helper text and [+ Add expense] button. User can still log income and add one-off expenses.

---

## Implementation Plan

> **How to use:** Mark checkboxes as you complete each task. Set dates when items are done. Verify all acceptance criteria before moving to the next phase.

### Build Progress Tracker

| Phase | Description | Status |
|---|---|---|
| Phase 1 | Database Migration | ⏳ READY TO RUN |
| Phase 2 | Data Layer — Models + Providers | 🔒 After Phase 1 |
| Phase 3 | Project Creation + Edit (Screen 2) | 🔒 After Phase 2 |
| Phase 4 | Log Entry + Edit Entry (Screens 7 + 9) | 🔒 After Phase 3 |
| Phase 5 | Display Screens (8, 5, Goals, Dashboard) | 🔒 After Phase 4 |
| Phase 6 | Polish + End-to-End Verification | 🔒 After Phase 5 |

---

### Phase 1: Database Migration ⏳ READY TO RUN

> Run this SQL in Supabase → SQL Editor **before any code changes.**
> You (the user) can run this migration while the developer builds Phase 2 in parallel.

**Current State ❌**
- `entry_platform_spends` only stores ad platform expenses — no way to store Tools, Team, etc.
- No `expense_types` column on `trackers` — can't save which cost categories a project uses
- `total_dms_leads` has `NOT NULL` constraint — breaks for non-ad projects with no DMs

**Target State ✅**
- New `entry_expenses` table stores all 6 types: ADS, TOOLS, TEAM, PRODUCTS, SHIPPING, OTHER
- `trackers.expense_types TEXT[]` stores the cost categories per project
- `total_dms_leads` is nullable — truly optional for non-ad users
- All 250 existing `entry_platform_spends` rows migrated to `entry_expenses` as `expense_type = 'ADS'`
- Zero data loss — profit calculations unchanged

**Migration SQL**

```sql
-- ============================================================
-- RHYDLE V1.1 MIGRATION
-- Run in: Supabase → SQL Editor
-- Safe: creates new tables, does not drop existing ones
-- ============================================================

-- Step 1: Create entry_expenses table
CREATE TABLE IF NOT EXISTS entry_expenses (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  entry_id UUID NOT NULL REFERENCES daily_entries(id) ON DELETE CASCADE,
  amount INTEGER NOT NULL DEFAULT 0,
  expense_type VARCHAR(50) NOT NULL,
  -- Valid values: 'ADS', 'TOOLS', 'TEAM', 'PRODUCTS', 'SHIPPING', 'OTHER'
  platform VARCHAR(50),
  -- Only populated when expense_type = 'ADS' (e.g. 'Facebook', 'TikTok')
  label VARCHAR(100),
  -- Only populated when expense_type = 'OTHER' (e.g. 'Etsy fees', 'Mic stand')
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  CONSTRAINT chk_expense_amount CHECK (amount >= 0)
);

CREATE INDEX IF NOT EXISTS idx_expenses_entry ON entry_expenses(entry_id);
CREATE INDEX IF NOT EXISTS idx_expenses_type ON entry_expenses(expense_type);
CREATE INDEX IF NOT EXISTS idx_expenses_platform ON entry_expenses(platform);

-- Step 2: Enable RLS (mirrors entry_platform_spends policies)
ALTER TABLE entry_expenses ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own expenses" ON entry_expenses
  FOR SELECT USING (
    entry_id IN (
      SELECT de.id FROM daily_entries de
      JOIN trackers t ON de.tracker_id = t.id
      WHERE t.user_id = auth.uid()
    )
  );

CREATE POLICY "Users can insert own expenses" ON entry_expenses
  FOR INSERT WITH CHECK (
    entry_id IN (
      SELECT de.id FROM daily_entries de
      JOIN trackers t ON de.tracker_id = t.id
      WHERE t.user_id = auth.uid()
    )
  );

CREATE POLICY "Users can update own expenses" ON entry_expenses
  FOR UPDATE USING (
    entry_id IN (
      SELECT de.id FROM daily_entries de
      JOIN trackers t ON de.tracker_id = t.id
      WHERE t.user_id = auth.uid()
    )
  );

CREATE POLICY "Users can delete own expenses" ON entry_expenses
  FOR DELETE USING (
    entry_id IN (
      SELECT de.id FROM daily_entries de
      JOIN trackers t ON de.tracker_id = t.id
      WHERE t.user_id = auth.uid()
    )
  );

-- Step 3: Add expense_types column to trackers
ALTER TABLE trackers
  ADD COLUMN IF NOT EXISTS expense_types TEXT[] DEFAULT '{}';

-- Step 4: Make total_dms_leads nullable (optional for non-ad projects)
ALTER TABLE daily_entries
  ALTER COLUMN total_dms_leads DROP NOT NULL;

-- Step 5: Set expense_types = '{}' for all existing trackers
UPDATE trackers SET expense_types = '{}' WHERE expense_types IS NULL;

-- Step 6: Migrate entry_platform_spends → entry_expenses (type = 'ADS')
INSERT INTO entry_expenses (id, entry_id, amount, expense_type, platform, created_at, updated_at)
SELECT
  gen_random_uuid(),
  entry_id,
  amount,
  'ADS',
  platform,
  created_at,
  updated_at
FROM entry_platform_spends;

-- Step 7: Verify migration (run these to confirm before proceeding)
-- SELECT COUNT(*) FROM entry_platform_spends;      -- e.g. 250
-- SELECT COUNT(*) FROM entry_expenses;             -- must equal above
-- SELECT DISTINCT expense_type FROM entry_expenses; -- should show only 'ADS'
-- SELECT expense_types FROM trackers LIMIT 5;      -- should show '{}'

-- NOTE: entry_platform_spends is NOT dropped — kept for safety
-- Can be removed in V1.2 after confirming stability
```

**Acceptance Criteria**
- [ ] `COUNT(entry_platform_spends)` equals `COUNT(entry_expenses)` (2026-__-__)
- [ ] `DISTINCT expense_type FROM entry_expenses` shows only `ADS` (2026-__-__)
- [ ] `expense_types FROM trackers` shows `{}` for all existing trackers (2026-__-__)
- [ ] App loads all existing data correctly after migration — no errors (2026-__-__)
- [ ] **Phase 1 complete** (2026-__-__)

---

### Phase 2: Data Layer — Models + Providers 🔒

**Current State ❌**
- `Tracker.platforms` — ad-specific naming, no field for non-ad cost types
- `Entry.platformSpends: Map<String, int>` — can only store ad spend
- `EntriesNotifier` reads/writes `entry_platform_spends` table (wrong table)
- `PlatformConstants` includes LinkedIn, X, Reddit; missing Instagram

**Target State ✅**
- `Tracker.channels` — renamed from `platforms` (same data, better name)
- `Tracker.expenseTypes: List<String>` — new field for non-ad cost categories
- New `EntryExpense` model: `{id, expenseType, platform?, label?, amount}`
- `Entry.expenses: List<EntryExpense>` — replaces `platformSpends`
- `EntriesNotifier` reads/writes `entry_expenses` table
- `PlatformConstants`: Facebook, Instagram, TikTok, YouTube, Google Ads

**Tasks — Constants & Icons**
- [ ] `platform_constants.dart`: remove LinkedIn, X, Reddit; add Instagram (2026-__-__)
- [ ] Add `assets/icons/instagram.svg` + register in `pubspec.yaml` (2026-__-__)
- [ ] `platform_icons.dart`: add Instagram icon case in `getIcon()` switch (2026-__-__)
- [ ] Create `lib/core/constants/expense_type_constants.dart` with 5 types + Iconsax icons (2026-__-__)
  ```
  TOOLS    → Iconsax.setting_2      (gear — software, subscriptions)
  TEAM     → Iconsax.profile_2user  (two people — editors, contractors)
  PRODUCTS → Iconsax.box            (box — inventory, materials)
  SHIPPING → Iconsax.truck          (truck — postage, logistics)
  OTHER    → Iconsax.tag_2          (tag — catch-all with custom label)
  ```

**Tasks — Domain Models**
- [ ] `tracker.dart`: rename `platforms` → `channels`, add `expenseTypes: List<String>` (2026-__-__)
- [ ] `tracker.dart`: update `toMap()`, `fromMap()`, `copyWith()` for `expenseTypes` (2026-__-__)
- [ ] `entry_provider.dart`: create `EntryExpense` model class (2026-__-__)
- [ ] `entry_provider.dart`: replace `platformSpends: Map<String, int>` with `expenses: List<EntryExpense>` in `Entry` (2026-__-__)
- [ ] `entry_provider.dart`: update `Entry.totalSpend` getter to sum `expenses.map((e) => e.amount)` (2026-__-__)
- [ ] `entry_provider.dart`: update `Entry.create()`, `copyWith()` for new `expenses` field (2026-__-__)

**Tasks — Providers**
- [ ] `entry_provider.dart` `loadEntries()`: read from `entry_expenses` table (not `entry_platform_spends`) (2026-__-__)
- [ ] `entry_provider.dart` `createEntry()`: write to `entry_expenses` using `gen_random_uuid()` (not deterministic MD5) (2026-__-__)
- [ ] `entry_provider.dart` `updateEntry()`: delete + re-insert rows in `entry_expenses` (2026-__-__)
- [ ] `entry_provider.dart` `deleteEntry()`: delete from `entry_expenses` (2026-__-__)
- [ ] `tracker_provider.dart`: load `expense_types` from Supabase → populate `tracker.expenseTypes` (2026-__-__)
- [ ] `tracker_provider.dart`: save `expense_types` when creating/updating a tracker (2026-__-__)
- [ ] `tracker_provider.dart`: rename all `platforms` → `channels` references throughout (2026-__-__)
- [ ] Grep for `tracker.platforms` across all files and update every reference (2026-__-__)

**Acceptance Criteria**
- [ ] ✅ All existing entries load correctly — ad spend shows as `expense_type = 'ADS'` (2026-__-__)
- [ ] ✅ `tracker.channels` and `tracker.expenseTypes` both populated from Supabase (2026-__-__)
- [ ] ✅ `Entry.totalSpend` correct for all entries (old ad-only + new mixed) (2026-__-__)
- [ ] ✅ No compile errors — all `tracker.platforms` references updated (2026-__-__)
- [ ] ✅ Instagram icon renders correctly in platform lists (2026-__-__)
- [ ] **Phase 2 complete** (2026-__-__)

---

### Phase 3: Project Creation + Edit (Screen 2 + Edit Screen) 🔒

**Current State ❌**
| Field | Current | Problem |
|---|---|---|
| "Platforms" | Single chip group, required | Ad-only framing; blocks non-ad users |
| Platform list | LinkedIn, X, Reddit included; no Instagram | Wrong set |
| Validation | At least 1 platform required | Blocks freelancers |
| Other costs | Not present | Can't configure Teams, Tools, etc. |
| "Revenue Target" | Label | No connection to Goals tab |
| "Engagement Target" | Always active | Misleading without ad channels |

**Target State ✅**
| Field | Target | Behavior |
|---|---|---|
| "Where do you advertise?" | Optional chip group | Facebook, Instagram, TikTok, YouTube, Google Ads — none pre-selected |
| "What do you regularly spend on?" | New optional chip group | Tools, Team, Products, Shipping |
| Validation | Removed | Both groups completely optional |
| "Income Goal" | Renamed | Microcopy: "Set an income target to track on your Goals page" |
| "Leads Goal" | Always visible | Disabled until ad platform selected; microcopy explains why |

**Tasks**
- [ ] `create_tracker_screen.dart`: rename chip group label "Platforms" → "Where do you advertise?" (2026-__-__)
- [ ] `create_tracker_screen.dart`: update `_availablePlatforms` from updated `PlatformConstants` (no LinkedIn/X/Reddit, has Instagram) (2026-__-__)
- [ ] `create_tracker_screen.dart`: remove `{"Facebook", "TikTok"}` default pre-selection — start empty (2026-__-__)
- [ ] `create_tracker_screen.dart`: add second chip group "What do you regularly spend on?" with [Tools, Team, Products, Shipping] (2026-__-__)
- [ ] `create_tracker_screen.dart`: wire second chip group to `_selectedExpenseTypes: Set<String>` state variable (2026-__-__)
- [ ] `create_tracker_screen.dart`: remove "at least 1 platform required" validation from `_handleCreate()` (2026-__-__)
- [ ] `create_tracker_screen.dart`: pass `expenseTypes: _selectedExpenseTypes.toList()` to `createTracker()` (2026-__-__)
- [ ] `create_tracker_screen.dart`: "Revenue Target" → "Income Goal" label + microcopy "Set an income target to track on your Goals page" (2026-__-__)
- [ ] `create_tracker_screen.dart`: "Engagement Target" → "Leads Goal" (2026-__-__)
- [ ] `create_tracker_screen.dart`: Leads Goal field — disabled + greyed when `_selectedPlatforms.isEmpty` (2026-__-__)
- [ ] `create_tracker_screen.dart`: Leads Goal microcopy **disabled**: "Tracks leads from your advertising platforms. Select a platform above to enable." (2026-__-__)
- [ ] `create_tracker_screen.dart`: Leads Goal microcopy **enabled**: "Track DMs and leads from your advertising" (2026-__-__)
- [ ] Mirror ALL above changes in `edit_tracker_screen.dart` (2026-__-__)
- [ ] `app_en.arb`: add/update all new strings (2026-__-__)
- [ ] `app_fr.arb`: translate all new strings (2026-__-__)

**Acceptance Criteria**
- [ ] ✅ Create project with only ad channels → works like V1, Log Entry shows channel rows (2026-__-__)
- [ ] ✅ Create project with only expense types → works, Log Entry shows cost type rows (2026-__-__)
- [ ] ✅ Create project with both → both saved to Supabase correctly (2026-__-__)
- [ ] ✅ Create project with nothing → allowed, no error, saves with empty arrays (2026-__-__)
- [ ] ✅ Leads Goal is greyed/disabled when no ad platform selected (2026-__-__)
- [ ] ✅ Leads Goal activates after selecting an ad platform (2026-__-__)
- [ ] ✅ Edit project screen mirrors all changes (2026-__-__)
- [ ] **Phase 3 complete** (2026-__-__)

---

### Phase 4: Log Entry + Edit Entry (Screens 7 + 9) 🔒

**Current State ❌**
| Element | Current | Problem |
|---|---|---|
| Revenue field | "Total Revenue" | Ad-specific language |
| Expense section | "AD SPEND" | Only for ad runners |
| Pre-filled rows | Only from `tracker.platforms` | Freelancers see no rows |
| One-off expenses | Not possible | Can't log a mic stand or one-time fee |
| DMS/LEADS section | Always shown | Irrelevant for non-ad projects |
| Summary labels | "Revenue" / "Spend" | Ad-specific |

**Target State ✅**
| Element | Target | Behavior |
|---|---|---|
| Revenue field | "Income" | Works for all users |
| Expense section | "EXPENSES" | Generic label |
| Pre-filled rows | From `tracker.channels` (brand icons) + `tracker.expenseTypes` (monochrome icons) | Channels first, then types |
| [+ Add expense] | New button + bottom sheet | All 6 types, conditional fields |
| DMS/LEADS | Conditional | Only if `tracker.channels.isNotEmpty` |
| Empty state | Helper text | Guides user when no rows configured |
| Summary labels | "Income" / "Expenses" | Generic |

**Tasks — Labels**
- [ ] `log_entry_screen.dart`: "Total Revenue" → "Income" (2026-__-__)
- [ ] `log_entry_screen.dart`: "AD SPEND" → "EXPENSES" section header (2026-__-__)
- [ ] `log_entry_screen.dart`: Summary card "Revenue"→"Income", "Spend"→"Expenses" (2026-__-__)
- [ ] `log_entry_screen.dart`: microcopy → "Enter how much you spent today" (2026-__-__)

**Tasks — Pre-filled rows**
- [ ] `log_entry_screen.dart`: initialize controllers for `tracker.channels` (ADS) + `tracker.expenseTypes` (2026-__-__)
- [ ] `log_entry_screen.dart`: render channel rows first with `PlatformIcons.getIcon()` (brand icons) (2026-__-__)
- [ ] `log_entry_screen.dart`: render expense type rows after with `ExpenseTypeConstants.getIcon()` (monochrome) (2026-__-__)
- [ ] `log_entry_screen.dart`: show empty state text when both lists are empty (2026-__-__)
  - "No expense categories set up. Tap below to add expenses, or set them up in project settings so they appear here every day."

**Tasks — [+ Add expense] button and bottom sheet**
- [ ] `log_entry_screen.dart`: add `[+ Add expense]` button below expense rows (2026-__-__)
- [ ] Create `add_expense_bottom_sheet.dart` in `features/tracker/widgets/` (2026-__-__)
  - Amount `GOLTextField` (number input)
  - Type selector: 6 chips [Ads, Tools, Team, Products, Shipping, Other]
  - **If Ads selected:** Channel dropdown → shows `tracker.channels` + all defaults (FB, IG, TT, YT, Google Ads) + "Other" option with free text
  - **If Other selected:** "What's this for?" text field (free label, optional)
  - **All other types:** no extra fields
  - `[Add to entry]` and `[Cancel]` buttons
- [ ] `log_entry_screen.dart`: handle result → append to `_addedExpenses: List<EntryExpense>` state (2026-__-__)
- [ ] `log_entry_screen.dart`: render added expenses as rows with `[×]` remove button (2026-__-__)
- [ ] `log_entry_screen.dart`: `[×]` removes expense from `_addedExpenses` (2026-__-__)

**Tasks — Conditional sections + Save**
- [ ] `log_entry_screen.dart`: DMS/LEADS section → `if (tracker.channels.isNotEmpty)` (2026-__-__)
- [ ] `log_entry_screen.dart` `_saveEntry()`: build `List<EntryExpense>` from non-zero pre-filled rows + added expenses (2026-__-__)
- [ ] `log_entry_screen.dart` `_saveEntry()`: call `createEntry(expenses: expenses)` (2026-__-__)

**Tasks — Edit Entry (Screen 9)**
- [ ] `edit_entry_screen.dart`: mirror all label changes (2026-__-__)
- [ ] `edit_entry_screen.dart`: pre-fill rows from `entry.expenses` instead of `entry.platformSpends` (2026-__-__)
- [ ] `edit_entry_screen.dart`: handle added/removed expenses in update flow (2026-__-__)

**Tasks — Localization**
- [ ] `app_en.arb`: add `income`, `expenses`, `enterSpendToday`, `noExpenseCategoriesSetUp`, `addExpense`, `whatKind`, `addToEntry`, `whatsThisFor` (2026-__-__)
- [ ] `app_fr.arb`: translate all new strings (2026-__-__)

**Acceptance Criteria**
- [ ] ✅ Ad runner (Facebook + TikTok): pre-filled rows with brand icons, DMS/LEADS visible, layout identical to V1 (2026-__-__)
- [ ] ✅ Freelancer (Tools + Team): pre-filled rows with monochrome icons, NO DMS/LEADS section (2026-__-__)
- [ ] ✅ Hybrid (Facebook + Team): channels first, then types, DMS/LEADS visible (2026-__-__)
- [ ] ✅ Empty project: helper text + [+ Add expense] only (2026-__-__)
- [ ] ✅ [+ Add expense] — Ads: shows channel dropdown (2026-__-__)
- [ ] ✅ [+ Add expense] — Other: shows label field (2026-__-__)
- [ ] ✅ [+ Add expense] — Tools/Team/Products/Shipping: no extra fields (2026-__-__)
- [ ] ✅ Added expense appears as removable row (2026-__-__)
- [ ] ✅ [×] removes added expense from form (2026-__-__)
- [ ] ✅ Pre-filled row with $0 not saved to `entry_expenses` (2026-__-__)
- [ ] ✅ Profit calculation correct: revenue − sum(all expense amounts) (2026-__-__)
- [ ] ✅ Edit entry shows saved expenses correctly (2026-__-__)
- [ ] **Phase 4 complete** (2026-__-__)

---

### Phase 5: Display Screens (Screens 8, 5, Goals, Entries Tab, Dashboard) 🔒

**Current State ❌ → Target State ✅**

| Screen | Current ❌ | Target ✅ |
|---|---|---|
| Entry Detail (8) | "AD SPEND" card, "Total Spend", DMS always visible | "Expenses" card, "Total Expenses", DMS only if leads > 0 |
| Entry Detail (8) | Platform icons only | Brand icons for ADS, monochrome for other types |
| Entry Detail (8) | "Revenue" in calculation section | "Income" in calculation section |
| Reports (5) | No expense breakdown | New "EXPENSE BREAKDOWN" card (by type + %) |
| Reports (5) | "BURN RATE" header, "on ads" in pace text | "DAILY SPEND", "per year" |
| Reports (5) | "Revenue VS Spend" labels | "Income VS Expenses" labels everywhere |
| Goals tab | "REVENUE GOAL" / "ENGAGEMENT GOAL" | "INCOME GOAL" / "LEADS GOAL" |
| Goals tab | Engagement card may be absent | Leads Goal always visible, context-aware |
| Entries tab cards | "Revenue: $X │ Spend: $X" | "Income: $X │ Expenses: $X" |
| Overview tab | Posts section always shown | Posts section only if `tracker.channels.isNotEmpty` |
| Dashboard | "Revenue" / "Spend" | "Income" / "Expenses" |

**Tasks — Entry Detail (Screen 8)**
- [ ] "Revenue" card header → "Income" (2026-__-__)
- [ ] "AD SPEND" card header → "Expenses" (2026-__-__)
- [ ] "Total Spend" → "Total Expenses" (2026-__-__)
- [ ] Calculation section: "Revenue"→"Income", "Total Spend"→"Total Expenses" (2026-__-__)
- [ ] Iterate `entry.expenses` (not `entry.platformSpends`) to render expense rows (2026-__-__)
  - `ADS` type: `PlatformIcons.getIcon(expense.platform)` — brand icon + platform name
  - `OTHER` type: `ExpenseTypeConstants.getIcon('OTHER')` — monochrome icon + `expense.label`
  - All other types: `ExpenseTypeConstants.getIcon(expense.expenseType)` — monochrome icon + type name
- [ ] DMS/LEADS card: `if (entry.totalDmsLeads > 0)` (2026-__-__)
- [ ] Remove Growth Metrics card (followers/engagement) if still present (2026-__-__)

**Tasks — Reports Tab (Screen 5)**
- [ ] `reports_provider.dart`: add `expenseBreakdown: Map<String, int>` — grouped by expense_type (2026-__-__)
- [ ] Add "EXPENSE BREAKDOWN" card after "TOTAL PROFIT/LOSS" card (2026-__-__)
  - Each type: name + amount + percentage of total
  - Types with $0 are hidden
  - "Total" row at the bottom
- [ ] "TOTAL PROFIT/LOSS" card: "Total Revenue"→"Total Income", "Total Spend"→"Total Expenses" (2026-__-__)
- [ ] "REVENUE VS SPEND OVER TIME" → "INCOME VS EXPENSES OVER TIME" (header + all row labels) (2026-__-__)
- [ ] "WORST PERFORMING DAYS": "Revenue"→"Income", "Spend"→"Expenses" in rows (2026-__-__)
- [ ] "BURN RATE" → "DAILY SPEND" card header (2026-__-__)
- [ ] Pace text: "per year on ads" → "per year" (2026-__-__)
- [ ] ROI text: "in revenue" → "in income" (2026-__-__)

**Tasks — Goals Tab**
- [ ] "REVENUE GOAL" → "INCOME GOAL" (2026-__-__)
- [ ] "ENGAGEMENT GOAL" → "LEADS GOAL" (2026-__-__)
- [ ] Income Goal card: show setup prompt if `tracker.revenueTarget == null` (2026-__-__)
  - "No income target set. Set one in project settings to track your progress."
- [ ] Leads Goal card: **always visible** (never hidden) with 3 states (2026-__-__)
  - `tracker.channels.isEmpty` → "Available for projects that track advertising. Add advertising platforms in project settings to enable lead tracking."
  - `tracker.channels.isNotEmpty` AND `tracker.engagementTarget == null` → "No leads target set. Set one in project settings to track your DMs and leads."
  - `tracker.channels.isNotEmpty` AND target set → progress bar (unchanged logic)
- [ ] Hub card progress bar: "Revenue" → "Income" label (if applicable) (2026-__-__)

**Tasks — Entries Tab + Overview Tab + Dashboard**
- [ ] Entries tab — entry cards: "Revenue"→"Income", "Spend"→"Expenses" (2026-__-__)
- [ ] Overview tab — Posts section: `if (tracker.channels.isNotEmpty)` (2026-__-__)
- [ ] Dashboard: "Revenue"→"Income", "Spend"→"Expenses" wherever present (2026-__-__)

**Tasks — Localization**
- [ ] `app_en.arb`: add/update all label change strings (see Label Changes reference below) (2026-__-__)
- [ ] `app_fr.arb`: translate all new strings (2026-__-__)

**Label Changes Reference**

| Location | Current | New |
|---|---|---|
| Log Entry revenue field | Total Revenue | Income |
| Log Entry expense section | AD SPEND | EXPENSES |
| Log Entry microcopy | Enter how much you spent on each platform today | Enter how much you spent today |
| Log Entry summary | Revenue / Spend | Income / Expenses |
| Entry Detail income card | Revenue | Income |
| Entry Detail expense card | AD SPEND | Expenses |
| Entry Detail expense total | Total Spend | Total Expenses |
| Entry Detail calculation | Revenue / Total Spend | Income / Total Expenses |
| Entry cards | Revenue: / Spend: | Income: / Expenses: |
| Reports P&L card | Total Revenue / Total Spend | Total Income / Total Expenses |
| Reports weekly rows | Revenue / Spend | Income / Expenses |
| Reports over-time header | REVENUE VS SPEND OVER TIME | INCOME VS EXPENSES OVER TIME |
| Reports worst days | Revenue / Spend | Income / Expenses |
| Reports burn rate header | BURN RATE | DAILY SPEND |
| Reports pace text | per year on ads | per year |
| Reports ROI text | in revenue | in income |
| Dashboard | Revenue / Spend | Income / Expenses |
| Project Creation | Revenue Target | Income Goal |
| Project Creation | Engagement Target | Leads Goal |
| Project Creation | Platforms | Where do you advertise? |
| Goals tab | REVENUE GOAL | INCOME GOAL |
| Goals tab | ENGAGEMENT GOAL | LEADS GOAL |
| Hub card | Revenue (in progress bar) | Income |

**Acceptance Criteria**
- [ ] ✅ Entry Detail — ad-only data: brand icons, layout identical to V1 (2026-__-__)
- [ ] ✅ Entry Detail — mixed data: brand + monochrome icons in same "Expenses" card (2026-__-__)
- [ ] ✅ Entry Detail — no leads: DMS/LEADS card hidden (2026-__-__)
- [ ] ✅ Reports — ad-only data: Expense Breakdown shows "Ads 100%" (2026-__-__)
- [ ] ✅ Reports — mixed data: Expense Breakdown shows percentage per type (2026-__-__)
- [ ] ✅ Reports — types with $0 NOT listed in breakdown (2026-__-__)
- [ ] ✅ Goals tab — no ad channels: Leads Goal shows explanation tag (2026-__-__)
- [ ] ✅ Goals tab — ad channels, no leads target: Leads Goal shows setup prompt (2026-__-__)
- [ ] ✅ Goals tab — Leads Goal card NEVER hidden (2026-__-__)
- [ ] ✅ Overview tab — non-ad project: Posts section hidden entirely (2026-__-__)
- [ ] ✅ Zero remaining "AD SPEND", "Revenue", "Spend" labels across all screens (2026-__-__)
- [ ] **Phase 5 complete** (2026-__-__)

---

### Phase 6: Polish + Full End-to-End Verification 🔒

**Tasks**
- [ ] Full E2E — Existing user: open app → all old data intact, identical profit calculations (2026-__-__)
- [ ] Full E2E — Ad runner: create project → log 3 entries → verify all screens correct (2026-__-__)
- [ ] Full E2E — Freelancer: create Tools+Team project → no DMS/LEADS, no Posts section (2026-__-__)
- [ ] Full E2E — Hybrid: channels + types → all rows correct, Reports breakdown accurate (2026-__-__)
- [ ] Full E2E — Empty project: create with nothing → log income only → works (2026-__-__)
- [ ] Grep codebase for `adSpend`, `platformSpend`, `revenueTarget` (old keys) → fix any missed (2026-__-__)
- [ ] Verify `app_fr.arb` has all strings translated — no missing keys (2026-__-__)
- [ ] Verify profit: `entry.totalRevenue − sum(entry_expenses.amount)` equals old profit for all V1 entries (2026-__-__)

**Acceptance Criteria**
- [ ] ✅ Zero data loss — all existing entries load with correct amounts (2026-__-__)
- [ ] ✅ Profit unchanged — old entries show same profit as before migration (2026-__-__)
- [ ] ✅ All 4 user type flows work end-to-end (2026-__-__)
- [ ] ✅ No hardcoded English strings in screens (all via l10n) (2026-__-__)
- [ ] ✅ No compiler warnings or deprecated API usage introduced (2026-__-__)
- [ ] **V1.1 COMPLETE** (2026-__-__)

---

## What We Are NOT Building

| Feature | Why not now |
|---|---|
| Multiple income line items | Keep single income field. Defer source tracking until we have data showing users want it |
| Income category presets | Free-text doesn't exist yet — no need to categorize what we don't collect |
| Tracker type selector (ad vs business) | Not needed. Channel + expense type selection handles this naturally |
| Template system | Expense types at creation solve 80% of the same problem without new screens |
| Recurring expenses | Users can use Copy to Today. Automation is a future feature |
| Expense configuration from Log Entry | Log Entry captures data. Project settings configure the form. Keep these jobs separate |
| Charts or visual graphs | V1 is numbers-only. Charts come in V1.5 with insights |
| Platform auto-sync | V2 scope. V1.1 makes manual entry flexible enough for all users |
| Generalizing Posts into "Links" or "References" | Posts are specifically for content/ad tracking and feed V1.5 AI Post Analysis. Non-ad users don't see the section. A generic attachments feature would be vague and useful to nobody |

---

*Last updated: March 2026*
*Applies to: Screens 2, 4, 5, 7, 8, 9 (modified)*
*Backwards compatible with all existing V1 screens*
