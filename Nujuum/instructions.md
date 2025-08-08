# Nujuum — Technical Specs (Iteration 1)

## General Information

**Colors + Font:**
Font Family: Gotham
Nujuum Purple: 6041B5
Nujuum Gold: FCB918

## 1. Loading Page

**Purpose:**  
Display the Nujuum brand on launch, establishing a premium, minimalist identity.


**UI Features:**
- Full-screen soft-neutral background.
- Centered Nujuum logo (`Nujuum-Full.jpg` or `Nujuum-Small.jpg`) with smooth fade-in animation.
- (Optional) Subtle, short “shimmer” animation on the gold star.
- App name below logo in soft gray or purple.
- Duration: 1–2 seconds or until app is ready.

**Technical Details:**
- Component: `SplashScreenView`
- Animation: SwiftUI `.opacity`, `.scale`, and `.animation` modifiers
- Assets: Import logo as `@2x`, `@3x` for retina display
- Dismissal: On ready (assets loaded), auto-transition to onboarding

---

## 2. Onboarding Flow

**Purpose:**  
Authenticate the user, then engage and prime them for the app’s conversation-first learning style.

### a. Sign-In

- Apple Sign-In only (privacy, simplicity)
- Full-screen modal
- Logo at top
- Large “Sign in with Apple” button
- On success: proceed to onboarding questions

**Technical:**
- Use `AuthenticationServices` (`ASAuthorizationAppleIDButton`)
- Store user identifier in secure Keychain
- Simple user state check: skip if already signed in

### b. Engagement Questions

- Series of full-screen cards with smooth horizontal swipe animation
- Each card:  
  - Engaging question (e.g., "Why do you want to speak Levantine Arabic?")
  - Multiple choice or free response
  - Progress indicator dots at bottom
  - Motivational microcopy

- Final step:  
  - Set daily speaking goal (slider or segmented buttons: 5, 10, 15 min)

**Technical:**
- SwiftUI `TabView` or custom `PageView` for horizontal swiping  
- Answers stored in `UserDefaults` or local profile model
- Lightweight, animated transitions (`.transition(.slide)`)

**Example Question Cards:**
1. "What’s your main motivation for learning Levantine Arabic?" (*choices: Travel, Family, Career, Curiosity*)
2. "How confident do you feel speaking out loud?" (*slider/emoji scale*)
3. "Pick your daily speaking commitment." (*5/10/15 min options*)

---

## 3. Paywall → Home Page

**Purpose:**  
Introduce Nujuum’s premium offering and set up access to core features.

### a. Paywall

- Appears after onboarding questions
- Clean layout with Nujuum branding
- Headline: e.g., “Unlock Real Speaking Confidence in Levantine Arabic”
- List of premium features (speaking challenges, pronunciation feedback, streaks)
- Call-to-action button: “Start Free Trial” or “Subscribe”
- Legal links: Terms, Privacy Policy

**Technical:**
- Modal presentation
- Localized copy
- In-app purchase (IAP) integration using StoreKit 2 (iOS 16+)
- Handle trial, restore purchase

### b. Home Page (Post-Paywall)

- Displays daily speaking challenge (prompt, record button)
- Progress visualization (ring/bar)
- Streak tracker
- Simple navigation: profile, history

**Technical:**
- Access contingent on active subscription
- SwiftUI `NavigationStack` with persistent bottom or tab navigation
- All main data stored locally; able to operate offline for basic use

---

**Note:** All assets (logos, icons) referenced in `/Assets.xcassets` for high-res display.
