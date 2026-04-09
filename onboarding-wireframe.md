# PERFORMANCE TRACKER APP - ONBOARDING WIREFRAMES

**Total Screens: 6**
1. Splash Screen (2 seconds)
2. Problem Recognition (Onboarding 1)
3. Solution Preview (Onboarding 2)
4. How It Works (Onboarding 3)
5. Interactive Demo (Onboarding 4)
6. Login/Signup Screen

---

## 📘 ILLUSTRATION STRATEGY (Storyset.com)

### **Recommended Format: Animated SVG**

**Why SVG over GIF:**
- ✅ Scalable (no pixelation on any device)
- ✅ Smaller file size (better performance)
- ✅ Color customizable (match brand colors)
- ✅ Flutter native support (flutter_svg package)
- ✅ Smooth animations (60fps)

**Storyset Categories to Use:**
- **Business & Work** (for problem/solution screens)
- **Data Analysis** (for tracking/reports concepts)
- **Mobile Apps** (for app usage scenarios)
- **Finance** (for money/profit concepts)

**Animation Style:**
- Use Storyset's built-in "Animate" option
- Select "Floating" or "Pulse" animations (subtle, not distracting)
- Export as animated SVG with embedded CSS animations
- Duration: 2-3 second loops

**Color Customization:**
- Replace default colors with your primary brand color
- Keep illustrations predominantly monochromatic with one accent color
- Maintain consistency across all onboarding screens

---

## SCREEN 1: SPLASH SCREEN

**Duration:** 2 seconds (auto-transitions)

**Purpose:** Brand introduction + smooth entry

```
┌─────────────────────────────────────────────┐
│                                             │
│                                             │
│                                             │
│                                             │
│                                             │
│                                             │
│            [APP LOGO - CENTER]              │
│                                             │
│         ┌────────────────────┐              │
│         │   📊 Profit Icon   │              │
│         │   or Custom Logo   │              │
│         └────────────────────┘              │
│                                             │
│                                             │
│           Grow Out Loud                     │
│         (or your app name)                  │
│                                             │
│                                             │
│                                             │
│         Track • Analyze • Grow              │
│         (subtle tagline)                    │
│                                             │
│                                             │
│                                             │
│     ─────────────────────                   │
│     Loading indicator (optional)            │
│                                             │
│                                             │
└─────────────────────────────────────────────┘

CONTENT HIERARCHY:
├─ App Logo (centered, prominent)
├─ App Name (below logo, bold)
└─ Tagline (subtle, light weight)

ANIMATION:
- Logo fades in (300ms)
- App name scales in (400ms, slight delay)
- Tagline fades in (500ms, slight delay)
- Hold for 1.5 seconds
- Smooth fade out to next screen (300ms)

BACKGROUND:
- Solid brand color OR
- Subtle gradient (light → slightly darker)
- Clean, minimal
```

---

## SCREEN 2: PROBLEM RECOGNITION (Onboarding 1/3)

**Purpose:** "This app gets me" moment

```
┌─────────────────────────────────────────────┐
│                                   [Skip]    │
│                                             │
│                                             │
│   [SVG ILLUSTRATION - TOP HALF]             │
│                                             │
│   ┌─────────────────────────────────────┐   │
│   │                                     │   │
│   │   Storyset: "Confused businessman   │   │
│   │   with multiple devices/charts"     │   │
│   │                                     │   │
│   │   Style: "Business" category        │   │
│   │   Animation: Floating elements      │   │
│   │   Colors: Your primary + neutral    │   │
│   │                                     │   │
│   │   Person looking at multiple        │   │
│   │   screens/spreadsheets with         │   │
│   │   question marks floating           │   │
│   │                                     │   │
│   └─────────────────────────────────────┘   │
│                                             │
│                                             │
│   ────────────────────────                  │
│                                             │
│   Running multiple                          │
│   online businesses?                        │
│                                             │
│   You keep asking yourself:                 │
│                                             │
│   • "Did my ads even pay off?"              │
│   • "Which project makes money?"            │
│   • "How much did I spend?"                 │
│                                             │
│                                             │
│   You're not alone.                         │
│                                             │
│                                             │
│   ○ ○ ○ (progress dots)                     │
│                                             │
│   [Continue Button]                         │
│                                             │
└─────────────────────────────────────────────┘

LAYOUT:
├─ Skip button (top right)
├─ SVG Illustration (40% of screen)
├─ Headline (bold, attention-grabbing)
├─ Bullet points (problems)
├─ Reassurance text
├─ Progress dots
└─ CTA button

SVG DETAILS:
Storyset Search: "confused business analytics"
Elements: Person, laptop, charts, question marks
Animation: Subtle floating + pulsing question marks
Color scheme: Match your primary brand color
```

---

## SCREEN 3: SOLUTION PREVIEW (Onboarding 2/3)

**Purpose:** Show what the app does

```
┌─────────────────────────────────────────────┐
│  [←]                              [Skip]    │
│                                             │
│                                             │
│   [SVG ILLUSTRATION - TOP HALF]             │
│                                             │
│   ┌─────────────────────────────────────┐   │
│   │                                     │   │
│   │   Storyset: "Person with mobile     │   │
│   │   phone showing data/analytics"     │   │
│   │                                     │   │
│   │   Style: "Mobile apps" category     │   │
│   │   Animation: Phone screen glowing   │   │
│   │   with data flowing                 │   │
│   │                                     │   │
│   │   Person smiling, holding phone     │   │
│   │   with visible profit numbers       │   │
│   │   floating around (stylized)        │   │
│   │                                     │   │
│   └─────────────────────────────────────┘   │
│                                             │
│                                             │
│   ────────────────────────                  │
│                                             │
│   One Daily Question:                       │
│   "Did I make money today?"                 │
│                                             │
│                                             │
│   Log your revenue and ad spend.            │
│   See your profit instantly.                │
│                                             │
│   No spreadsheets.                          │
│   No API setup.                             │
│   Just simple tracking.                     │
│                                             │
│                                             │
│   ○ ● ○ (progress dots)                     │
│                                             │
│   [Continue Button]                         │
│                                             │
└─────────────────────────────────────────────┘

LAYOUT:
├─ Back button (top left)
├─ Skip button (top right)
├─ SVG Illustration (40% of screen)
├─ Core promise (bold, centered)
├─ Benefit statements (short lines)
├─ Progress dots
└─ CTA button

SVG DETAILS:
Storyset Search: "mobile analytics success"
Elements: Person, smartphone, profit indicators
Animation: Data points flowing from phone
Color scheme: Optimistic (greens + brand color)
```

---

## SCREEN 4: HOW IT WORKS (Onboarding 3/3)

**Purpose:** Show the simple 3-step process

```
┌─────────────────────────────────────────────┐
│  [←]                              [Skip]    │
│                                             │
│                                             │
│   [SVG ILLUSTRATION - TOP SECTION]          │
│                                             │
│   ┌─────────────────────────────────────┐   │
│   │                                     │   │
│   │   Storyset: "Step-by-step process   │   │
│   │   with person and checklist"        │   │
│   │                                     │   │
│   │   Style: "Business workflow"        │   │
│   │   Animation: Checkmarks appearing   │   │
│   │   sequentially                      │   │
│   │                                     │   │
│   │   Shows 3 connected steps visually  │   │
│   │   (create → log → view)             │   │
│   │                                     │   │
│   └─────────────────────────────────────┘   │
│                                             │
│                                             │
│   ────────────────────────                  │
│                                             │
│   Three Simple Steps                        │
│                                             │
│                                             │
│   1. Create a Tracker                       │
│   "Instagram Side Hustle"                   │
│   Platforms: Instagram, Facebook            │
│                                             │
│   2. Log Daily (30 seconds)                 │
│   Revenue: $120 | Ad Spend: $45             │
│   Profit: $75 ✓                             │
│                                             │
│   3. See Your Progress                      │
│   This Week: +$580                          │
│   Best Day: Monday ($120)                   │
│                                             │
│                                             │
│   ○ ○ ● (progress dots)                     │
│                                             │
│   [Try Demo Button]                         │
│                                             │
└─────────────────────────────────────────────┘

LAYOUT:
├─ Back button (top left)
├─ Skip button (top right)
├─ SVG Illustration (30% of screen)
├─ Section headline
├─ 3 step cards (compact, visual)
├─ Progress dots
└─ CTA button

SVG DETAILS:
Storyset Search: "checklist workflow success"
Elements: Person, clipboard, checkmarks, arrows
Animation: Steps completing one by one
Color scheme: Progressive (neutral → success green)
```

---

## SCREEN 5: INTERACTIVE DEMO (Onboarding 4/4)

**Purpose:** Let user try it risk-free

```
┌─────────────────────────────────────────────┐
│  [←]  Try It Yourself                       │
│                                             │
│                                             │
│   [SVG ILLUSTRATION - TOP]                  │
│                                             │
│   ┌─────────────────────────────────────┐   │
│   │                                     │   │
│   │   Storyset: "Person calculating     │   │
│   │   finances on calculator"           │   │
│   │                                     │   │
│   │   Style: "Finance" category         │   │
│   │   Animation: Numbers counting up    │   │
│   │                                     │   │
│   │   Shows person with calculator      │   │
│   │   and rising profit chart          │   │
│   │                                     │   │
│   └─────────────────────────────────────┘   │
│                                             │
│                                             │
│   Let's log a sample entry:                 │
│                                             │
│   ┌──────────────────────────────────┐      │
│   │  Sample: "YouTube Channel"       │      │
│   │  Platforms: YouTube, Instagram   │      │
│   └──────────────────────────────────┘      │
│                                             │
│   Today's Revenue                           │
│   [Input Field] (type "250")                │
│                                             │
│   YouTube Ad Spend                          │
│   [Input Field] (type "80")                 │
│                                             │
│   Instagram Ad Spend                        │
│   [Input Field] (type "45")                 │
│                                             │
│   ─────────────────────────                 │
│                                             │
│   Profit: $125 (live calculation)           │
│                                             │
│                                             │
│   [Calculate My Profit Button]              │
│                                             │
│                                             │
│   AFTER CALCULATION SUCCESS:                │
│   ┌──────────────────────────────────┐      │
│   │  💰 You made $125 today!         │      │
│   │  Revenue: $250                   │      │
│   │  Spent: -$125                    │      │
│   │  Profit: $125 ✓                  │      │
│   └──────────────────────────────────┘      │
│                                             │
│   [Start Tracking for Real Button]          │
│   → Goes to Login Screen                    │
│                                             │
└─────────────────────────────────────────────┘

LAYOUT:
├─ Back button + screen title
├─ SVG Illustration (20% of screen, smaller)
├─ Sample tracker preview
├─ Interactive input fields
├─ Live profit calculation
├─ Success state (after interaction)
└─ Final CTA button

SVG DETAILS:
Storyset Search: "calculator profit analytics"
Elements: Person, calculator, rising chart
Animation: Numbers counting, chart rising
Color scheme: Success-oriented (greens + brand)

INTERACTION FLOW:
1. User sees empty fields
2. Types amounts (keyboard appears)
3. Profit calculates live
4. Tap "Calculate" → Success state shows
5. Celebration moment (confetti optional)
6. CTA changes to "Start Tracking for Real"
```

---

## SCREEN 6: LOGIN/SIGNUP SCREEN

**Purpose:** Convert users with beautiful, trustworthy design

**Inspiration:** Perplexity-style with background image + gradient overlay

```
┌─────────────────────────────────────────────┐
│                                   [Skip]    │
│                                             │
│   [BACKGROUND IMAGE - FULL SCREEN]          │
│                                             │
│   ┌─────────────────────────────────────┐   │
│   │                                     │   │
│   │   Background Image:                 │   │
│   │   Professional workspace/desk       │   │
│   │   with laptop, notebook, coffee     │   │
│   │                                     │   │
│   │   OR: Abstract data visualization   │   │
│   │   OR: Calm entrepreneurial scene    │   │
│   │                                     │   │
│   │   Source: Unsplash, Pexels          │   │
│   │   Style: Professional, aspirational │   │
│   │   Color tone: Cool/neutral          │   │
│   │                                     │   │
│   └─────────────────────────────────────┘   │
│                                             │
│   [GRADIENT OVERLAY - TOP TO BOTTOM]        │
│   ┌─────────────────────────────────────┐   │
│   │ Gradient: transparent → dark (80%)  │   │
│   │                                     │   │
│   │ Creates depth and readability       │   │
│   │ Darker at bottom (where content is) │   │
│   └─────────────────────────────────────┘   │
│                                             │
│                                             │
│   ─── CONTENT LAYER (on gradient) ───       │
│                                             │
│   [APP LOGO - SMALL]                        │
│   Grow Out Loud                             │
│                                             │
│                                             │
│   Track your profit.                        │
│   Know what works.                          │
│                                             │
│                                             │
│   ───────────────────────────               │
│                                             │
│   [Continue with Google]                    │
│   White button with Google icon             │
│                                             │
│   [Continue with Email]                     │
│   Outlined button                           │
│                                             │
│                                             │
│   Already have an account? Log in           │
│                                             │
│                                             │
│   Privacy Policy  •  Terms of Service       │
│   (Small, links)                            │
│                                             │
└─────────────────────────────────────────────┘

LAYER STRUCTURE (bottom to top):
1. Background image (full bleed)
2. Gradient overlay (rgba, stronger at bottom)
3. Content layer (logo, text, buttons)

GRADIENT SPECIFICATIONS:
Type: Linear gradient (top to bottom)
Start: rgba(0, 0, 0, 0.1) - nearly transparent
Middle: rgba(0, 0, 0, 0.4) - medium opacity
End: rgba(0, 0, 0, 0.85) - strong darkness

Alternative: Use brand color gradient
Start: rgba(primary-color, 0.2)
End: rgba(primary-color, 0.95)

BACKGROUND IMAGE GUIDELINES:
Theme: Professional productivity/success
Examples:
- Clean desk with laptop, notebook, coffee
- Abstract financial charts/data viz
- Minimalist workspace with plants
- Person working (seen from behind/side)

Requirements:
- High resolution (2x-3x screen size)
- Muted/desaturated colors
- Not too busy (gradient will darken it)
- Horizontal orientation
- No text in image
- Professional, aspirational mood

IMAGE SOURCES:
- Unsplash: Search "workspace minimal"
- Pexels: Search "productivity desk"
- Storyset: Use photo/3D section (not illustration)

TEXT COLOR:
- All text white (high contrast on dark gradient)
- Logo white or inverse
- Buttons have high contrast

CONTENT HIERARCHY:
├─ App logo + name (top, centered)
├─ Value proposition (2 short lines)
├─ Primary CTA: Google (filled button)
├─ Secondary CTA: Email (outlined button)
├─ Login link (text link)
└─ Legal links (smallest, bottom)

WHY THIS WORKS:
✅ Premium, professional feel
✅ High perceived value
✅ Gradient provides depth
✅ Text remains readable
✅ Memorable first impression
✅ Trustworthy design
```

---

## 🎨 STORYSET SVG IMPLEMENTATION GUIDE

### **Step-by-Step Process:**

**1. Find Illustrations on Storyset:**
```
Screen 2 (Problem): 
- Search: "business confusion analytics"
- Category: Business > Analysis
- Pick: Confused person with charts

Screen 3 (Solution):
- Search: "mobile app success"
- Category: Mobile Apps > Analytics
- Pick: Happy person with phone

Screen 4 (How It Works):
- Search: "checklist workflow"
- Category: Business > Productivity
- Pick: Step-by-step process

Screen 5 (Demo):
- Search: "calculator money profit"
- Category: Finance > Calculation
- Pick: Person with calculator
```

**2. Customize on Storyset:**
- Click "Customize" button
- Change primary color to your brand color
- Select "Animated" option
- Choose animation: "Floating" or "Breath"
- Keep secondary colors neutral/gray

**3. Export Settings:**
- Format: SVG (not PNG, not GIF)
- Include: Animations (check this option)
- Size: Original (vector, scales automatically)
- Download the .svg file

**4. Flutter Integration:**
```
Use package: flutter_svg

Code structure:
SvgPicture.asset(
  'assets/illustrations/problem_screen.svg',
  fit: BoxFit.contain,
)

Note: Animated SVGs from Storyset work
directly in Flutter without extra setup.
The CSS animations are embedded in the SVG.
```

**5. File Organization:**
```
assets/
├── illustrations/
│   ├── onboarding_problem.svg
│   ├── onboarding_solution.svg
│   ├── onboarding_workflow.svg
│   └── onboarding_demo.svg
└── images/
    └── login_background.jpg
```

---

## 🎬 SCREEN TRANSITION ANIMATIONS

**Between Onboarding Screens:**
- Type: Horizontal slide (left to right)
- Duration: 300ms
- Curve: easeInOut
- Keep back button functional

**From Splash to Onboarding:**
- Type: Crossfade
- Duration: 500ms
- Smooth, elegant

**From Demo to Login:**
- Type: Fade + slight scale up
- Duration: 400ms
- Signals importance of conversion

**Progress Dots Behavior:**
- Active dot: Primary color, slightly larger
- Inactive dots: Gray, smaller
- Animate dot change (slide, not jump)

---

## 📊 ONBOARDING FLOW SUMMARY

```
User Opens App
    ↓ (2 seconds, auto)
SPLASH SCREEN
"Grow Out Loud" + Logo
    ↓ (smooth transition)
ONBOARDING 1: Problem
"Running multiple businesses?"
SVG: Confused person with charts
    ↓ [Continue] or [Skip]
ONBOARDING 2: Solution
"One daily question: Did I make money?"
SVG: Happy person with phone
    ↓ [Continue] or [Skip]
ONBOARDING 3: How It Works
"Three simple steps"
SVG: Workflow checklist
    ↓ [Try Demo] or [Skip]
ONBOARDING 4: Interactive Demo
User logs sample entry
SVG: Calculator/profit visual
Sees: "You made $125!"
    ↓ [Start Tracking for Real]
LOGIN SCREEN
Background image + gradient overlay
[Google] or [Email]
    ↓
App Dashboard
```

---

## ✅ DESIGN PRINCIPLES APPLIED

**1. Visual Hierarchy:**
- Illustrations draw attention (but don't dominate)
- Headlines are scannable
- Buttons are obvious next steps

**2. Progressive Disclosure:**
- Start simple (problem)
- Build understanding (solution → steps)
- End with action (demo)

**3. Emotional Journey:**
- Problem → Empathy
- Solution → Hope
- Demo → Confidence
- Login → Trust

**4. Conversion Optimization:**
- Skip available (user control)
- Interactive demo (investment)
- Beautiful login (premium feel)
- Clear value before asking for account

---

## 🎯 KEY DIFFERENCES FROM GENERIC ONBOARDING

**What Makes This Better:**

| Generic | Our Approach |
|---------|-------------|
| Text-heavy screens | SVG illustrations + minimal text |
| Static images | Animated SVG (subtle movement) |
| Feature list | User problem → solution story |
| No interaction | Interactive demo before signup |
| Plain login screen | Premium background + gradient |
| Many screens (7-10) | Efficient (4 onboarding + 1 login) |
| Skip hidden | Skip clearly available |
| Boring transitions | Smooth, branded animations |

---

## 📱 FINAL DELIVERABLES NEEDED

**Design Team:**
1. Logo (multiple sizes)
2. 4 customized SVG illustrations from Storyset
3. Login background image (high-res)
4. Brand colors applied to all screens
5. Typography hierarchy maintained
6. Button styles (from design system)

**Development Team:**
1. SVG files (assets folder)
2. Background image (optimized)
3. Transition animations (timing specs)
4. Progress dot logic
5. Interactive demo calculations
6. Login integration (Google + Email)

---

