# Mind Arena — Frontend Architecture & Implementation Guide

> **Version:** 1.2
> **Status:** Active frontend source of truth
> **Current milestone:** M1.5 — Slice 01 authorized
> **Next milestone:** M1.5 — Complete Experience Prototype
> **Target stack:** Flutter for mobile, tablet, laptop, web, and desktop
> **Implementation strategy:** Experience design first, mock platform second, backend later
> **Core rule:** The frontend must behave like a complete product before it connects to production services.
> **Day-one rule:** Every implemented slice is adaptive, accessible, and performance-budgeted across compact, medium, and expanded windows.

---

## 1. Purpose of This Document

This document is the long-term frontend engineering handbook for Mind Arena.

It is not only a roadmap or task list. It defines:

- why each frontend system exists;
- what each epic owns;
- what each epic intentionally does not own;
- what must be delivered;
- which earlier systems it depends on;
- how completion is measured;
- which extensions are postponed.

Every frontend implementation discussion, architecture decision, design review, and code review should be traceable to this guide.

The document covers the complete frontend journey from the first product-language decision to a production-ready, backend-replaceable application.

---

## 2. Document System

Mind Arena uses a three-part complementary source-of-truth document system.

```text
Frontend Architecture Guide
        → How the frontend is built, structured, tested, and evolved

Mind Design Bible
        → How the product looks, moves, sounds, responds, and feels

Arena Content Bible
        → How situations, perspectives, prompts, and reflections are created
```

### 2.1 Component Document Roles

- **Frontend Architecture & Implementation Guide:** Authoritative when a decision concerns code ownership, dependencies, state management, repository contracts, accessibility infrastructure, or folder structure.
- **Mind Design Bible:** Authoritative when a decision concerns visual identity, scene pacing, atmosphere, motion choreography, sound design, spatial depth, emotional progression, or micro-interaction feeling.
- **Arena Content Bible:** Authoritative when a decision concerns scenario framing, ambiguity level, choice structure, perspective selection, prompt wording, reconsideration tone, or summary reflection rules.

None of these documents should silently override another. Conflicts require an explicit Decision Record.

### 2.2 Arena Content Bible Specifications

The Arena Content Bible controls what makes an Arena good and prevents future Arenas from degrading into ordinary polls, moral tests, or one-sided debates. It explicitly defines:

- what qualifies as an Arena;
- how much ambiguity is required;
- how stakes are introduced;
- how choices are framed;
- how contrasting perspectives are selected;
- how false balance is avoided;
- acceptable reading length;
- emotional intensity boundaries;
- prohibited or sensitive topics;
- how Build, Challenge, and Question prompts are written;
- how reconsideration avoids pressuring users;
- how Mind Shift summaries avoid judgment;
- how an Arena creates curiosity without manipulation.

### 2.3 Decision Ownership & Record System

To maintain architectural and design discipline, decisions are recorded using two lightweight formats:

- **ADR (Architecture Decision Record):** Tracks code structure, state management, framework boundaries, and data flow.
- **EDR (Experience Decision Record):** Tracks visual, motion, content, pacing, or emotional changes.

An EDR must contain:
- **Decision ID & Title**
- **User Problem Addressed**
- **Options Considered**
- **Chosen Direction**
- **Design / Pacing Rationale**
- **Evidence / User Feedback**
- **Reconsideration Triggers**

#### Decision Ownership Roles

| Area | Decision Owner | Reviewers |
| :--- | :--- | :--- |
| Product Intent & Pacing | Product Owner | Experience Lead, Frontend Architect |
| Design Bible & Aesthetics | Design Lead | Product Owner, Frontend Lead |
| Arena Content & Scenarios | Content Lead | Product Owner, Safety Reviewer |
| Safety & Integrity | Safety Lead | Content Lead, Product Owner |
| Architecture & Code Structure | Frontend Architect | Technical Team |

---

## 3. Experience Manifesto

Mind Arena is not optimized for efficiency alone.

It is built to be memorable.

Every Arena should create at least one of these feelings:

- Curiosity
- Discovery
- Reflection
- Contribution
- Mind Shift

The game mechanics are not the product’s final value. They make meaningful human thinking enjoyable, approachable, and repeatable.

If an implementation functions correctly but feels ordinary, it is incomplete.

If an animation looks impressive but communicates nothing, it should be removed.

If an interaction increases engagement but weakens trust, it should not ship.

We optimize not only for tasks completed inside the product, but for the thoughts and stories users carry with them after leaving it.

Mind Arena should feel:

- thoughtful, but not academic;
- playful, but not childish;
- premium, but not cold;
- surprising, but not confusing;
- reflective, but not judgmental;
- structured, but not restrictive.

The experience is successful when users leave thinking:

“I had not considered that.”

“I understood someone different from me.”

“My position became clearer.”

“I want to try tomorrow’s Arena.”

---

## 4. Current Product Vision

Mind Arena is an experience-first product designed to improve human-to-human thinking and collective insight.

The product is not primarily a chat interface, content feed, social network, or question-answering assistant. It is a structured environment in which people:

1. encounter a meaningful situation;
2. make an independent commitment;
3. discover contrasting human perspectives;
4. contribute through a guided interaction;
5. reconsider their position;
6. observe a personal or collective mind shift.

The V1 experience is **Today’s Arena**, an asynchronous, story-driven, approximately three-minute perspective exercise.

### 4.1 The central interaction model

```text
Situation
    ↓
Private Commitment
    ↓
Human Perspectives
    ↓
Structured Contribution
    ↓
Reconsideration
    ↓
Mind Shift
```

### 4.2 The role of AI

AI is a facilitator, host, narrator, and reflector.

AI may:

- introduce a situation;
- guide pacing;
- reveal contrasting perspectives;
- enforce interaction structure;
- summarize movement in the group;
- reflect changes in reasoning;
- provide safe and deterministic fallback content.

AI must not:

- replace real human participants with synthetic opinions presented as human;
- score intelligence, morality, personality, or social worth;
- declare a winner;
- reward popularity;
- create pressure to conform;
- expose private user content through analytics or logs.

### 4.3 The emotional objective

The frontend should create moments such as:

- “I want to know what happens next.”
- “I had not considered that.”
- “That perspective makes sense, even though I disagree.”
- “My view changed slightly.”
- “I contributed something meaningful.”
- “I want to return tomorrow.”

The design target is not only usability. It is a calm, thoughtful, surprising, safe, and memorable three-minute experience.

---

## 5. Governing Implementation Principle

Mind Arena will not follow the standard sequence:

```text
Backend → API → Frontend → Polish
```

It will follow:

```text
Product Vision
        ↓
Core Experience Loop
        ↓
M1.4 Experience Design
        ↓
Mind Design Bible
        ↓
Scene Storyboards
        ↓
Prototype Videos
        ↓
M1.4 Experience Approval
        ↓
M1.5 Flutter Experience Prototype
        ↓
Mock Platform and Experience State
        ↓
Human Validation
        ↓
Integration Readiness
        ↓
Backend Replacement
        ↓
Live AI Replacement
```

This expresses the critical rule:

Flutter implements an experience that has already been designed. Flutter should not be the tool through which the fundamental experience is discovered.

Some discovery will naturally continue during implementation, but the foundational design language should already exist.

The backend must eventually power an experience that has already been designed and validated.

The frontend should initially behave as if it is connected to a complete platform, while every response is supplied by deterministic local mock implementations.

---

## 6. M1.4 — Experience Design

### Objective

Define and approve the complete visual, emotional, spatial, motion, sound, and interaction language of Today’s Arena before production Flutter implementation.

### Why It Exists

Epic 00 describes the intended product experience. M1.4 turns that intention into concrete visual and temporal decisions.

It prevents components and scenes from being designed independently and ensures that Today’s Arena feels like one continuous experience.

### Scope

- Experience Manifesto
- Visual reference board
- Typography direction
- Color philosophy
- Illustration direction
- AI facilitator appearance
- Scene atmosphere
- Spatial and depth language
- Motion language
- Sound language
- Particle philosophy
- Scene storyboards
- Interaction wireframes
- Transition studies
- Prototype videos
- Accessibility adaptations
- Cross-platform visual principles

### Deliverables

- Mind Design Bible
- Figma mood board
- Visual reference board
- Today’s Arena emotional timeline
- Storyboard for every major scene
- Wireframes for every major interaction
- Motion reference clips
- Transition prototypes
- Sound reference map
- AI facilitator appearance specification
- Illustration direction
- Reduced-motion storyboard
- High-contrast visual direction
- At least one complete prototype video of the Mars Rescue flow

### Technical Feasibility Spikes

While full feature implementation is gated by M1.4 approval, small technical experiments are explicitly permitted to answer design-risk questions before committing to an experience direction:

- Can chosen particle effects maintain target frame rates?
- Can text scale without destroying spatial composition?
- Can scene transitions work smoothly on Flutter web?
- Can audio cues trigger without noticeable latency?
- Can the AI facilitator animation support reduced-motion mode cleanly?
- Does Rive, Lottie, or native Flutter animation best fit a specific interaction need?

#### Feasibility Spike Workflow

```text
Design Question
    ↓
Small Feasibility Spike (Disposable Code)
    ↓
Evidence & Performance Benchmark
    ↓
Design Decision (Recorded in EDR)
    ↓
Discard or Document Spike
```

### M1.4 Timeboxes and Stop Rules

M1.4 does not require a final, permanent brand system. It requires sufficient experience definition to implement and test one complete Mars Rescue flow consistently.

To prevent infinite design iteration, M1.4 is bound by strict limits:

- **1** primary visual direction
- **1** approved fallback visual direction
- **7** scene storyboards
- Core transition studies only
- **1** complete prototype video
- **1** reduced-motion version
- **1** experience-review approval cycle before implementation

Anything beyond these bounds must be logged in the Design Bible backlog for post-M1.5 refinement.

[EDR-0001](../decisions/edr-0001-slice-01-design-evidence.md) authorizes the bounded TA-01/TA-02
implementation from the approved Design Bible and responsive storyboards. The complete-flow motion
study remains required before TA-03 through TA-07 implementation; it is not silently waived.

### Success Criteria

M1.4 is complete when:

- every Today’s Arena scene has an approved storyboard;
- the visual language is recognizable as Mind Arena;
- typography, color, motion, sound, particles, and illustration follow one philosophy;
- the AI facilitator has a defined visual and behavioral presence;
- scene transitions are demonstrated before Flutter implementation;
- accessibility variants are designed, not postponed;
- the complete three-minute experience can be understood from the storyboard and prototype video;
- implementation questions no longer require inventing fundamental design decisions.

### Out of Scope

- Production Flutter scene implementation
- Repository implementation
- State-management implementation
- Production backend
- Live AI
- Final production asset optimization

---

## 7. M1.5 — Experience Prototype

### Goal

Create a fully interactive, production-quality, backend-free version of Today’s Arena.

### M1.5 Product Hypothesis

We believe that exposing a user to contrasting human perspectives through a structured three-minute experience will help them discover, clarify, reinforce, or reconsider part of their original position.

We will consider this product thesis promising when users during testing:

1. **Understand without explanation:** operate the flow smoothly without external guidance;
2. **Discover new angles:** identify at least one perspective they had not previously considered;
3. **Feel safe:** feel comfortable contributing or reconsidering without judgment or anxiety;
4. **Describe the Mind Shift accurately:** summarize their cognitive movement or position clarification clearly;
5. **Express genuine return intent:** indicate interest in experiencing another Arena tomorrow.

> [!NOTE]
> Changing one's opinion is **not** the primary metric. A clarified position or responsibly reinforced stance represents a successful Mind Shift.

### M1.5 Platform Commitment & Certification

Mind Arena supports mobile, tablet, laptop, responsive web, and desktop-class windows from the
first implemented slice. Platform certification prioritizes sensory polish without postponing
layout, input, accessibility, or performance correctness on larger devices.

```text
Experience-Certified Flagship
Mobile phone

Functionally Validated From Day One
Tablet + responsive web + laptop + desktop
```

#### Platform Certification Levels

- **Experience-Certified (Flagship):** Full visual, motion, audio, haptic, accessibility, and performance review.
- **Functionally Validated:** Complete adaptive flow, accessibility, input, resize/state preservation, and performance review, with platform-appropriate sensory polish.
- **Not Yet Validated:** Permitted only for an initial project runner or disposable feasibility spike; no user-observable slice can be marked complete in this state.

#### Day-One Device and Window Matrix

| Device class | Initial window contract | Required input and composition |
| :--- | :--- | :--- |
| Mobile | Compact, below 600 logical pixels | Touch-first focused column; portrait and landscape |
| Tablet | Medium, 600–1023 logical pixels, plus split view | Touch, keyboard, and pointer; supporting rail or two-pane composition where useful |
| Laptop | Expanded, 1024 logical pixels and above | Keyboard and pointer; deliberate information density and visible focus |
| Desktop | Expanded and freely resizable across every class | Keyboard, pointer, window resize, state preservation, and no stretched-phone composition |

Breakpoints are centralized tokens, never scattered device checks. Components respond to their
local constraints. Resizing across classes preserves the active scene, selection, draft, focus
intent, and scroll intent. The exact budgets and verification matrix are authoritative in
`docs/architecture/adaptive-client-and-performance.md`.

### Required Qualities

- Complete end-to-end Today’s Arena journey
- Mock data only
- Zero production backend dependency
- Zero live AI dependency
- Intentional scene transitions
- Complete loading, error, empty, retry, and offline states
- Realistic delays and simulated service behavior
- Mobile experience-certified; tablet, responsive web, laptop, and desktop functionally validated
- Compact, medium, and expanded layouts verified for every user-observable slice
- Touch, keyboard, and pointer behavior verified from the first interactive component
- Startup, input-response, frame-time, memory, and layout-stability budgets measured from the first scene
- Accessibility support
- Suitable for moderated and unmoderated user testing
- Repository contracts ready for later API replacement

### M1.5 Completion Criteria

M1.5 is complete when a new user can:

1. launch the application;
2. understand the purpose;
3. enter Today’s Arena;
4. make a private commitment;
5. reveal human perspectives;
6. build, challenge, or question;
7. reconsider the initial choice;
8. view a Mind Shift summary;
9. complete the experience;
10. return to the home state;

without any backend, live model, manual developer intervention, or broken transition.

---

## 8. Frontend Product Invariants

These rules apply to every epic and every feature.

### 8.1 Experience invariants

- The product must feel guided, not procedural.
- Scenes must communicate progress without feeling like a form wizard.
- The user must always know what is happening, but not necessarily see every system detail.
- Motion must carry meaning.
- Waiting states must preserve immersion.
- The experience must work with deterministic content.
- Every critical interaction needs a recoverable path.
- The product must create delight without becoming distracting.
- Every complete Arena should contain at least one memorable moment.
- Playfulness should reduce the effort of thinking, not trivialize the topic.
- Game mechanics must support curiosity, contribution, and reflection rather than competition or addiction.
- An experience that is usable but emotionally ordinary is not complete.

### 8.2 Human perspective invariants

- Human contributions must be represented clearly as human contributions.
- Mock perspectives must be marked in development and test environments.
- The interface must not imply that generated content is a real participant contribution.
- Popularity signals must not dominate the experience.
- Contribution quality must not be reduced to public scores.

### 8.3 Safety and trust invariants

- V1 is adult-only.
- Adult and minor social pools must remain structurally separable.
- No direct messaging.
- No public follower graph.
- No public profile surface.
- No unmoderated free-text social surface.
- No precise location sharing.
- Per-arena pseudonymous identity is preferred.
- Raw contribution text must never enter standard analytics or crash logs.

### 8.4 Technical invariants

- UI code must depend on repository contracts, not concrete data sources.
- Mock and API repositories must implement the same contracts.
- Scene state must be restorable.
- Business logic must not live inside reusable visual components.
- Design tokens must be used instead of arbitrary visual values.
- Accessibility is part of component completion, not a later patch.
- Reduced-motion support is required for all nonessential animation.
- The mock platform must support success, delay, failure, timeout, offline, and malformed-state simulation.
- Every user-observable slice must compose intentionally at compact, medium, and expanded widths.
- Responsive behavior must be constraint-driven; operating-system or device-name branches cannot choose layout.
- Touch, keyboard, pointer, text scaling, reduced motion, and state-preserving resize are day-one requirements.
- Performance budgets are acceptance criteria from the first scene, not a hardening-only activity.
- Performance evidence must be collected in profile or release mode on representative devices; debug timings are diagnostic only.

---

## 9. Recommended Flutter Architecture

Mind Arena should be organized around experience systems, scenes, and visual components using a clear hierarchy: Arena → Scene → Component.

Initially, experience orchestration and state are held under `experience/`.

```text
lib/
├── app/
│   ├── bootstrap/
│   ├── configuration/
│   ├── routing/
│   └── mind_arena_app.dart
│
├── design/
│   ├── tokens/
│   ├── theme/
│   ├── typography/
│   ├── responsive/
│   └── icons/
│
├── experience/
│   ├── orchestration/
│   ├── state/
│   ├── interaction/
│   ├── facilitation/
│   ├── reflection/
│   ├── progress/
│   └── restoration/
│
├── components/
│   ├── primitives/
│   ├── controls/
│   ├── feedback/
│   ├── arena/
│   └── reflection/
│
├── arenas/
│   └── todays_arena/
│       ├── arena_definition.dart
│       ├── arena_controller.dart
│       ├── arena_state.dart
│       ├── scenes/
│       │   ├── introduction/
│       │   ├── private_commitment/
│       │   ├── perspective_reveal/
│       │   ├── contribution/
│       │   ├── reconsideration/
│       │   ├── mind_shift/
│       │   └── completion/
│       └── fixtures/
│
├── domain/
│   ├── models/
│   ├── repository_contracts/
│   └── policies/
│
├── data/
│   ├── mock/
│   ├── local/
│   ├── repositories/
│   └── mappers/
│
├── accessibility/
├── analytics/
├── offline/
├── testing/
└── shared/
    ├── errors/
    ├── result/
    └── logging/
```

Bundled fonts, images, audio, and animation live in the package-level `assets/` directory outside
`lib/`; Dart ownership boundaries remain under `lib/`.

There should be no generic dumping ground named `screens`, `services`, or `utils` containing unrelated responsibilities.

### Criteria for splitting experience/

Split `experience/` back into separate `engine/` and `state/` packages only when one of these conditions becomes true:

- a second Arena type needs the same engine;
- experience orchestration becomes independently reusable;
- state ownership becomes difficult to understand;
- testing requires independent package boundaries;
- several developers begin owning different layers;
- imports reveal repeated coupling problems.

Do not split it merely because the final architecture diagram looks cleaner.

---

## 10. Repository Replacement Pattern

The frontend must be built against stable contracts.

```dart
abstract interface class ArenaRepository {
  Future<Arena> getTodayArena();
  Future<CommitmentResult> submitCommitment(Commitment input);
  Future<List<Perspective>> getPerspectives(String arenaId);
  Future<ContributionResult> submitContribution(Contribution input);
  Future<ReconsiderationResult> submitReconsideration(
    Reconsideration input,
  );
  Future<MindShift> getMindShift(String sessionId);
}
```

Initial implementation:

```dart
final class MockArenaRepository implements ArenaRepository {
  // Reads fixtures, simulates delay, failure, timeout, and offline states.
}
```

Future implementation:

```dart
final class ApiArenaRepository implements ArenaRepository {
  // Uses production network adapters.
}
```

The UI, scene controllers, experience engine, and state model must not require structural changes when the repository implementation is replaced.

---

## 11. Implementation Stages

The epic numbers remain stable identifiers. They do not represent strict execution order.

### Pre-Implementation Milestone — M1.4 Experience Design

- Experience Manifesto
- Mind Design Bible
- Reference Board
- Emotional Timeline
- Scene Storyboards
- Interaction Wireframes
- Motion Studies
- Sound Studies
- Prototype Videos
- Experience Approval

M1.4 is a milestone rather than an epic because it produces approved design artifacts across multiple systems.

### Stage 1 — Experience Foundation

- Epic 00 — Product Experience Foundation
- Epic 02 — Mind Design System
- Epic 03 — Mind Experience System
- Epic 01 — Frontend Architecture

### Stage 2 — Experience Platform

- Epic 04 — Component Library
- Epic 05 — Scene System
- Epic 06 — Experience Engine
- Epic 11 — State Management
- Epic 12 — Assets System
- Epic 07 — Mock Platform
- Epic 08 — Navigation System

### Stage 3 — Product Experience

- Epic 09 — Core User Flows
- Epic 10 — Today’s Arena
- Epic 13 — Audio & Haptics
- Epic 14 — Accessibility

### Stage 4 — Validation and Production Readiness

- Epic 15 — Offline Experience
- Epic 16 — Analytics & Telemetry
- Epic 17 — Performance
- Epic 18 — Testing Strategy
- Epic 19 — Frontend Integration Readiness
- Epic 20 — Production Readiness
- Epic 21 — Future Foundation

---

# Stage 1 — Experience Foundation

---

# Epic 00 — Product Experience Foundation

## Objective

Define the product language, emotional journey, interaction philosophy, and experience boundaries that every frontend decision must follow.

## Why It Matters

Mind Arena is not a conventional utility application. Its value depends on how the user feels during a short, carefully paced thinking experience.

Without a shared product language, individual scenes may be visually polished but emotionally inconsistent. One scene may feel playful, another clinical, and another like a survey. This epic prevents that fragmentation.

## Scope

- Product principles
- Experience principles
- Emotional journey
- Three-minute pacing philosophy
- Interaction philosophy
- AI presence and voice
- Human-perspective representation
- Trust and safety principles
- Visual identity direction
- Motion philosophy
- Sound philosophy
- Accessibility philosophy
- Content tone
- Empty, loading, error, and recovery tone
- Product vocabulary
- Definition of “calm,” “premium,” “thoughtful,” and “surprising” for Mind Arena

## Out of Scope

- Flutter implementation
- Final component code
- Production content generation
- Backend behavior
- API contracts
- Live AI provider selection
- Marketing brand guidelines beyond product experience needs

## Deliverables

- Product language document
- Primary M1.5 User specification
- Experience principles
- Emotional journey map
- Today’s Arena pacing map
- AI facilitator voice guide
- Interaction vocabulary
- UX writing principles
- Safety and trust interface rules
- Experience review checklist
- Examples of acceptable and unacceptable patterns

### Primary M1.5 User Specification

To prevent design dilution across broad audiences (founders, students, corporate teams, debate enthusiasts, casual gamers), M1.5 targets one precise primary persona:

> **Primary Audience:** Curious adults who enjoy discussing difficult questions but rarely have access to structured, diverse perspectives in their daily routines.

#### Persona Profile

- **Who they are:** Thoughtful adults looking to expand their thinking without entering hostile social feeds or superficial polls.
- **Problem experienced:** Frustrated by online polarization, comment section noise, or superficial surveys; lack structured environments for reflection.
- **What triggers an Arena session:** A short daily break, quiet morning routine, or transition between work tasks.
- **What outcome they expect:** A fresh, surprising angle on a real question, feeling understood and intellectually stimulated in ~3 minutes.
- **Why alternatives are insufficient:** Social media rewards outrage; polls lack reasoning; group chats require real-time scheduling; AI chats lack human authenticity.
- **Why they return tomorrow:** Anticipation of tomorrow's new scenario and curiosity about how other humans view difficult choices.

## Dependencies

None.

## Success Criteria

- Every scene can explain which product principle it supports.
- Designers and engineers use the same vocabulary.
- The role of AI is unambiguous.
- The emotional intention of each step in Today’s Arena is documented.
- Product reviews can identify violations without relying only on personal taste.
- Loading, error, and fallback experiences preserve trust and tone.

## Future Extensions

- Additional Arena experience grammars
- Multiplayer pacing principles
- Facilitated group sessions
- Cultural adaptation guidelines
- Youth-specific product language for a separately designed future product

---

# Epic 01 — Frontend Architecture

## Objective

Create a stable Flutter architecture that supports experience-first development, local simulation, testability, and later data-source replacement.

## Why It Matters

The frontend will evolve from a deterministic experience prototype into a connected product. If scenes directly depend on local JSON, network clients, or provider-specific AI code, replacing those systems will require major rewrites.

A clear architecture lets the team learn from user testing without losing implementation quality.

## Scope

- Project structure
- Feature and scene boundaries
- Layer separation
- Domain models
- Repository contracts
- Dependency injection
- Use-case boundaries
- Error model
- Result types
- Environment configuration
- Build flavors
- Logging rules
- Coding conventions
- Package ownership
- Public API rules between modules
- Decision records
- Dependency direction
- Static analysis rules

## Out of Scope

- Production backend design
- Database architecture
- Server deployment
- Live AI orchestration
- Final API schemas
- Premature microservices
- Feature-specific UI design

## Deliverables

- Flutter project skeleton
- Architecture decision record
- Module ownership map
- Dependency graph
- Repository contract conventions
- Dependency injection setup
- Environment and flavor setup
- Error and result conventions
- Logging and privacy rules
- Lint configuration
- Naming conventions
- Example vertical slice using a mock repository

## Dependencies

- Epic 00 — Product Experience Foundation

## Success Criteria

- Scene code does not import concrete mock or API clients.
- Repositories can be replaced through dependency injection.
- Domain models do not depend on Flutter widgets.
- Components do not contain repository calls.
- App, domain, data, engine, state, and scene responsibilities are clearly separated.
- Architecture rules are enforceable through linting, tests, or review checks.
- A new engineer can locate the correct ownership layer without guessing.

## Future Extensions

- Package extraction
- Plugin architecture
- Remote configuration
- Dynamic feature delivery
- Multi-app shared design package
- Additional platform adapters

---

# Epic 02 — Mind Design System

## Objective

Build the visual language, design token system, and atomic primitives used by every Mind Arena scene and component.

## Why It Matters

The design system is the visual foundation of the product. Today’s Arena must feel like one continuous experience rather than a set of separately designed screens.

A token-driven system improves consistency, accessibility, speed, theming, and future evolution.

## Scope

- Color system
- Semantic color roles
- Typography
- Type scale
- Spacing
- Grid
- Breakpoints
- Responsive behavior
- Elevation
- Radius
- Borders
- Opacity
- Iconography
- Focus states
- Theme system
- Dark and light modes
- High-contrast considerations
- Design tokens
- Visual density
- Content width rules
- Safe-area behavior
- Cross-platform adaptations

## Out of Scope

- Scene-specific business logic
- Final animation choreography
- Data models
- API integration
- One-off visual values outside the token system
- Brand campaigns and external marketing collateral

## Deliverables

- Flutter token package
- Theme extensions
- Typography implementation
- Semantic color definitions
- Spacing and layout scale
- Responsive layout utilities
- Icon registry
- Light theme
- Dark theme
- High-contrast strategy
- Design-system documentation
- Visual token gallery
- Token usage lint or review rules

## Dependencies

- Epic 00 — Product Experience Foundation

## Success Criteria

- No production scene uses arbitrary colors, spacing, radii, or typography.
- Themes can change without rewriting components.
- Text remains readable at supported scale factors.
- All semantic states have defined visual treatments.
- Layout behavior is documented and tested for mobile, tablet, laptop, desktop, and responsive web.
- Breakpoint transitions preserve semantic order, state, focus intent, and readable line length.
- Color contrast meets accessibility targets.
- The visual language clearly feels like Mind Arena.

## Future Extensions

- Seasonal themes
- Arena-specific visual themes
- Dynamic color adaptation
- Brand collaboration themes
- Design-token export to additional platforms

---

# Epic 03 — Mind Experience System

## Objective

Define and implement how Mind Arena moves, transitions, responds, feels spatially, creates atmosphere, uses subtle sound, and guides user emotion.

## Why It Matters

Mind Arena’s storytelling depends on sensory and temporal harmony. Motion, atmosphere, spatial depth, sound cues, and reflection timing combine to create the experience.

Without a unified experience system, visual polish remains static and separate from how the user actually feels while moving through Today’s Arena.

## Scope

- Visual atmosphere
- Depth and elevation philosophy
- Spatial lighting concepts
- Motion principles
- Animation tokens
- Durations and curves
- Delay and stagger rules
- Entrance and exit patterns
- Scene transitions
- Shared-element transitions
- Micro-interactions
- Ambient background movement
- Particle systems
- Sound design philosophy
- Audio feedback cues
- Haptic patterns
- Emotional pacing
- Reflection timing
- Waiting-state immersion
- Celebration moments
- Reduced-motion support
- Performance budgets

## Out of Scope

- Scene business logic
- Unbounded particle effects
- Unmoderated audio generation
- Heavy game-engine rendering
- Platform-native navigation outside Mind Arena ownership

## Deliverables

- Mind Experience principles guide
- Motion token package
- Atmosphere overlay specification
- Spatial depth guidelines
- Audio feedback registry
- Haptic mapping table
- Reusable transition library
- Scene transition contracts
- Shared-element utilities
- Particle system primitives
- Reduced-motion strategy
- Sensory performance budget
- Experience quality checklist

## Dependencies

- Epic 00 — Product Experience Foundation
- Epic 02 — Mind Design System

## Success Criteria

- Every transition, atmosphere effect, sound cue, and animation has a documented experience purpose.
- Scenes move smoothly without visual or emotional jarring.
- The experience remains complete in reduced-motion mode.
- Sound and motion can be disabled or adjusted independently.
- Performance targets are maintained on all target devices.
- The sensory layer feels calm, thoughtful, and surprising.

## Future Extensions

- Adaptive motion based on user preference
- More advanced spatial transitions
- Arena-specific ambient systems
- Procedural celebration patterns
- Shared motion packages for other Mind Arena clients

---

# Stage 2 — Experience Platform

---

# Epic 04 — Component Library

## Objective

Build reusable, accessible, themed, and motion-aware UI components for all Mind Arena experiences.

## Why It Matters

Mind Arena should not create a new button, card, dialog, progress indicator, or contribution pattern inside every scene.

A strong component library preserves consistency and lets product work focus on experience composition rather than repeated low-level implementation.

## Scope

- Buttons
- Icon buttons
- Inputs
- Selection controls
- Cards
- Dialogs
- Bottom sheets
- Tooltips
- Navigation controls
- Progress components
- Lists
- Empty states
- Error states
- Loading states
- Retry states
- Arena introduction components
- Choice components
- Perspective cards
- Build, Challenge, and Question controls
- Reflection cards
- Mind Shift cards
- Completion components
- Accessibility states
- Responsive variants
- Component documentation

## Out of Scope

- Repository access
- API integration
- Full scene orchestration
- Feature workflows
- Arena-specific state machines
- Unapproved one-off UI components

## Deliverables

- Component catalogue
- Reusable Flutter widgets
- Component playground
- Usage examples
- Theming support
- Accessibility behavior
- Golden references
- Interaction-state documentation
- Loading, disabled, pressed, focused, error, and success variants

## Dependencies

- Epic 02 — Design System
- Epic 03 — Motion System
- Epic 01 — Frontend Architecture

## Success Criteria

- Feature scenes are composed primarily from reusable components.
- Duplicate UI patterns are eliminated.
- Components support theming, text scaling, keyboard focus, and reduced motion.
- Components expose clear APIs without feature-specific assumptions.
- Visual states are covered by golden tests.
- Components do not access repositories or global feature state directly.

## Future Extensions

- Public design-system package
- Visual component explorer
- Automated accessibility checks
- Additional Arena-type components
- Advanced data visualization components

---

# Epic 05 — Scene System

## Objective

Create a reusable framework for experience scenes, their lifecycle, transitions, persistence, and composition.

## Why It Matters

Mind Arena is better understood as a sequence of guided scenes than as a collection of pages.

A scene owns more than layout. It owns entry, pacing, interaction readiness, transition timing, interruption handling, restoration, and exit.

## Scope

- Scene definition
- Scene storyboards and visual contracts
- Scene lifecycle
- Scene entry and exit
- Scene readiness
- Scene layout
- Scene transitions
- Scene composition
- Scene navigation commands
- Scene persistence
- Scene restoration
- Scene interruption
- Scene error handling
- Scene loading state
- Scene analytics hooks
- Scene accessibility announcements
- Scene focus management
- Scene test harness

## Out of Scope

- Arena business decisions
- Backend navigation state
- Generic application routing replacement
- Content generation
- Production API integration
- Component visual design

## Deliverables

- Base scene contract
- Scene controller pattern
- Scene host
- Scene transition coordinator
- Scene restoration model
- Scene lifecycle documentation
- Scene storyboard review gate
- Scene test harness
- Example scene implementations
- Focus and accessibility integration
- Interruption and retry behavior
- Scene Traceability Register

### Experience Traceability System

To prevent design drift between the Mind Design Bible and Flutter implementation, every Today’s Arena scene is assigned a stable ID and traceable artifact mapping:

#### Scene Registry

- `TA-01 Arena Introduction`
- `TA-02 Private Commitment`
- `TA-03 Perspective Reveal`
- `TA-04 Structured Contribution`
- `TA-05 Reconsideration`
- `TA-06 Mind Shift`
- `TA-07 Completion`

#### Required Traceability Links per Scene

Each scene artifact matrix must link:

1. **Experience Intention** (product goal)
2. **Emotional Entry State** (user sentiment coming in)
3. **Emotional Exit State** (user sentiment leaving)
4. **Approved Storyboard** (M1.4 visual baseline)
5. **Interaction Wireframe** (layout contract)
6. **Motion Specification** (duration & curves)
7. **Sound Specification** (audio feedback IDs)
8. **Accessibility Variant** (high contrast & screen reader semantics)
9. **Content Fixture** (deterministic mock data)
10. **Flutter Implementation** (widget code)
11. **Tests** (widget & golden test suites)
12. **Experience Review** (approval record)

> [!IMPORTANT]
> **Completeness Rule:** A scene cannot be marked complete when its implementation no longer matches the approved storyboard. Any deviation requires an updated storyboard or an approved EDR.

## Dependencies

- Epic 01 — Frontend Architecture
- Epic 02 — Mind Design System
- Epic 03 — Mind Experience System
- Epic 04 — Component Library

## Success Criteria

- Every major experience step is represented as a scene.
- Every scene implementation matches an approved storyboard from M1.4 before code review.
- Every scene maintains a complete 12-point Traceability Matrix.
- Scenes can enter, pause, resume, retry, restore, and exit predictably.
- Navigation logic is not scattered across widgets.
- Scene transitions can be tested independently.
- A scene can be rendered with mock state in isolation.
- Scene restoration does not depend on the original widget tree remaining alive.

## Future Extensions

- Branching scene graphs
- Multiplayer scenes
- Live collaborative scene synchronization
- Downloadable Arena scene packs
- Authoring tools for new scene sequences

---

# Epic 06 — Experience Engine

## Objective

Build the frontend engine that orchestrates the Today’s Arena experience independently of backend implementations.

## Why It Matters

The experience engine is the heart of Mind Arena.

It determines what happens next, which actions are available, how progress is represented, how invalid transitions are prevented, and how the product responds to completion, interruption, timeout, or fallback.

Without this layer, experience rules would leak into individual scenes and become difficult to test or evolve.

## Scope

- Experience orchestration
- Interaction engine
- Facilitation engine
- Decision engine
- Perspective engine
- Reflection engine
- Progress engine
- Completion engine
- State transition rules
- Action eligibility
- Deterministic fallback behavior
- Timeout behavior
- Manual override paths
- Recovery behavior
- Scene sequencing
- Experience events
- Experience snapshots
- Experience validation
- Experiment hooks

## Out of Scope

- Visual component implementation
- Production AI prompting
- Backend orchestration
- Real-time multiplayer synchronization
- Server authority
- Analytics vendor integration

## Deliverables

- Experience state machine
- Today’s Arena transition map
- Domain actions
- Engine events
- Fallback policies
- Timeout policies
- Recovery policies
- Snapshot format
- Unit tests
- Debug inspector
- Deterministic replay support

## Dependencies

- Epic 00 — Product Experience Foundation
- Epic 01 — Frontend Architecture
- Epic 05 — Scene System

## Success Criteria

- The complete Arena can run from a deterministic script.
- Invalid transitions are impossible through public engine APIs.
- The same engine works with mock and future API repositories.
- Every AI-dependent step has a deterministic fallback.
- Experience state can be serialized and restored.
- Engine behavior is covered by unit tests.
- UI scenes react to engine state instead of deciding workflow rules themselves.

## Future Extensions

- New Arena grammars
- Branching experiences
- Group synchronization
- Facilitator plugins
- Experiment-driven rule variations
- Remote experience definitions

---

# Epic 07 — Mock Platform

## Objective

Simulate the complete Mind Arena frontend experience without backend services or live AI.

## Why It Matters

The mock platform makes experience design, implementation, validation, testing, demos, and product learning possible before backend commitments.

It must simulate realistic behavior, not merely return static success data.

## Scope

- Mock domain models
- Local JSON fixtures
- Mock repositories
- Mock users
- Mock identities
- Mock sessions
- Mock Arena catalogue
- Mock human perspectives
- Mock facilitation
- Mock reflection
- Mock Mind Shift summaries
- Artificial loading
- Artificial latency
- Error injection
- Timeout injection
- Offline simulation
- Empty-state simulation
- Corrupted-state simulation
- Feature variants
- Scenario selection
- Deterministic seeds
- Development controls

## Out of Scope

- Production user data
- Live AI calls
- Production authentication
- Real participant matching
- Production analytics
- Server simulation beyond frontend needs

## Deliverables

- Fixture schema
- Mock repository implementations
- Scenario library
- Mars Rescue complete script
- Mock control panel
- Delay, failure, timeout, and offline toggles
- Deterministic replay
- Development environment configuration
- Test fixtures
- Mock data documentation

## Dependencies

- Epic 01 — Frontend Architecture
- Epic 06 — Experience Engine
- Epic 11 — State Management
- Epic 12 — Assets System

## Success Criteria

- The entire application runs locally with no network access.
- Every repository contract has a mock implementation.
- Developers can reproduce specific failures.
- User testing can run without developer intervention.
- Mock content is clearly distinguishable from production data in development tooling.
- Scenario behavior is deterministic when required.
- Loading and error states are realistic enough to validate the experience.

## Future Extensions

- Scenario authoring tool
- Remote fixture loading
- Recorded-session replay
- Synthetic load simulation
- Multi-participant mock rooms
- Automatic fixture generation from contracts

---

# Epic 08 — Navigation System

## Objective

Create predictable application and scene navigation across all supported platforms.

## Why It Matters

The user should never feel lost inside a guided experience. Back behavior, deep links, interruptions, and re-entry must preserve the product’s emotional flow and state integrity.

Navigation must support both application destinations and scene progression without confusing the two.

## Scope

- Application router
- Scene navigation
- Entry points
- Deep links
- Route guards
- Navigation history
- Back behavior
- Resume behavior
- Protected flows
- Authentication gates
- Arena availability gates
- Modal navigation
- Web URL behavior
- Desktop navigation behavior
- Focus restoration
- Navigation analytics events
- Invalid-route recovery

## Out of Scope

- Experience state transition rules
- Backend authorization
- Production identity provider logic
- Final marketing website routing
- Server-driven deep-link generation

## Deliverables

- Route map
- Scene graph
- Navigation service
- Guard strategy
- Back-navigation policy
- Deep-link parser
- Recovery routes
- Platform-specific navigation rules
- Navigation tests
- URL strategy for web

## Dependencies

- Epic 01 — Frontend Architecture
- Epic 05 — Scene System
- Epic 11 — State Management

## Success Criteria

- Back navigation never corrupts Arena state.
- Deep links resolve to safe and valid entry states.
- Interrupted sessions can resume correctly.
- Navigation behavior is predictable across mobile, web, and desktop.
- Invalid or expired routes recover gracefully.
- Scene progression is not implemented through arbitrary route pushes.
- Focus is restored appropriately after navigation.

## Future Extensions

- Shared Arena invitation links
- Multiplayer entry links
- Campaign entry points
- Notification-driven routing
- Cross-device continuation

---

# Epic 11 — State Management

## Objective

Organize application and experience state so ownership, mutation, restoration, and observation remain clear.

## Why It Matters

Mind Arena contains multiple kinds of state with different lifetimes:

- global application state;
- user preference state;
- Arena session state;
- scene-local interaction state;
- animation state;
- cached content;
- offline synchronization state.

Treating all of these as one global store would create unnecessary coupling. Keeping everything local would make restoration and orchestration unreliable.

## Scope

- State ownership rules
- App state
- Session state
- Arena state
- Scene state
- Theme state
- Settings state
- Accessibility preference state
- Animation preference state
- Cache state
- Offline state
- Derived state
- Immutable state models
- Event and command patterns
- State persistence
- State restoration
- State inspection
- State test utilities

## Out of Scope

- Server-state architecture
- Backend caching
- Repository implementations
- Visual component state that does not escape a component
- Arbitrary global mutable singletons

## Deliverables

- State architecture decision
- Provider or state-management setup
- State ownership matrix
- Arena session state model
- Persistence boundaries
- Restoration strategy
- Debug state inspector
- State test helpers
- Examples for local, scene, session, and global state

## Dependencies

- Epic 01 — Frontend Architecture
- Epic 06 — Experience Engine

## Success Criteria

- Every state value has a clear owner and lifetime.
- Scene UI does not directly mutate domain state.
- Arena sessions can be restored after interruption.
- Derived state is not manually duplicated.
- State transitions are testable.
- Global state is limited to genuinely global concerns.
- Mock and future API repositories do not require different UI state models.

## Future Extensions

- Cross-device state continuation
- Collaborative state
- Event sourcing
- Remote state reconciliation
- Experiment-aware state models

---

# Epic 12 — Assets System

## Objective

Create a consistent, performant, accessible, and maintainable pipeline for all frontend assets.

## Why It Matters

Mind Arena depends on atmosphere, illustration, iconography, sound, motion, and visual storytelling. An unmanaged asset collection quickly creates duplication, inconsistent quality, oversized bundles, and licensing risk.

## Scope

- Fonts
- Icons
- SVG assets
- Raster images
- Illustrations
- Audio
- Lottie
- Particle definitions
- Localization assets
- Asset naming
- Asset registry
- Loading strategy
- Preloading
- Caching
- Compression
- Resolution variants
- Accessibility descriptions
- Licensing metadata
- Fallback assets
- Missing-asset behavior

## Out of Scope

- Final content production workflow
- External media hosting
- Backend asset APIs
- User-generated media uploads
- Marketing asset management

## Deliverables

- Asset directory convention
- Typed asset registry
- Asset loading utilities
- Preload strategy
- Optimization pipeline
- Licensing manifest
- Accessibility metadata
- Fallback asset set
- Bundle-size checks
- Asset contribution guide

## Dependencies

- Epic 01 — Frontend Architecture
- Epic 02 — Design System
- Epic 03 — Motion System

## Success Criteria

- Assets are referenced through a consistent registry.
- Missing assets fail gracefully.
- Large assets are optimized and loaded intentionally.
- Licensing and source information are recorded.
- Accessibility descriptions are available where needed.
- Scene startup is not blocked by unnecessary media.
- Platform-specific asset variants are supported.

## Future Extensions

- Remote asset packs
- Arena theme packs
- Dynamic illustration delivery
- Content-addressed caching
- Creator tooling

---

# Stage 3 — Product Experience

---

# Epic 09 — Core User Flows

## Objective

Connect the application into a complete, coherent, frontend-only user journey.

## Why It Matters

A collection of polished scenes is not yet a product. The user must be able to move through the entire application without dead ends, missing states, or implementation-only shortcuts.

This epic proves that Mind Arena works as a complete experience shell.

## Scope

- Splash
- First launch
- Onboarding
- Age eligibility
- Mock authentication
- Home
- Today’s Arena entry
- Arena session
- Reflection
- Mind Shift
- Completion
- Profile
- Settings
- Resume session
- Error recovery
- Offline entry behavior
- Empty and unavailable states
- Return-user flow
- End-of-day completed state

## Out of Scope

- Production identity integration
- Production account management
- Live social graph
- Real backend synchronization
- Real AI calls
- Future Arena types

## Deliverables

- End-to-end flow map
- Complete navigable application shell
- First-time-user flow
- Returning-user flow
- Completed-Arena flow
- Interrupted-session flow
- Error and recovery flow
- Cross-platform responsive behavior
- User-testing build

## Dependencies

- Epic 04 — Component Library
- Epic 05 — Scene System
- Epic 06 — Experience Engine
- Epic 07 — Mock Platform
- Epic 08 — Navigation System
- Epic 11 — State Management

## Success Criteria

- A user can complete all primary journeys without developer assistance.
- There are no placeholder navigation dead ends.
- Every asynchronous state has loading, success, failure, and retry behavior.
- Interrupted Arena sessions resume safely.
- The application communicates completed and unavailable states clearly.
- The full flow works with zero network dependency.

## Future Extensions

- Invitations
- Multiple daily Arenas
- Arena archive
- Social re-entry
- Team or organization entry flows
- Cross-device continuation

---

# Epic 10 — Today’s Arena

## Objective

Build the flagship three-minute Mind Arena experience using deterministic mock data.

## Why It Matters

Today’s Arena is the product proof.

It must demonstrate that structured human perspective exchange can feel meaningful, safe, emotionally engaging, and worth repeating.

This epic should receive the highest level of experience design, motion design, content design, and usability attention.

## Scope

### Arena introduction

- Situation framing
- Stakes
- Time expectation
- Safety framing
- Entry action

### Private Commitment

- Independent choice
- Optional confidence or reasoning prompt
- Confirmation
- Privacy reassurance
- Prevention of early perspective exposure

### Perspective Reveal

- Two contrasting real-human perspective formats
- Progressive reveal
- Attribution rules
- Pseudonymous presentation
- Reading progress
- Perspective comparison

### Structured Contribution

- Build
- Challenge
- Question
- Guided prompts
- Contribution boundaries
- Validation
- Submission simulation
- Deterministic moderation feedback
- Safe fallback behavior

### Reconsideration

- Original stance reminder
- Updated choice
- Change explanation
- No-change validation
- Reflection pacing

### Mind Shift

- Personal movement summary
- Group movement summary
- AI facilitator reflection from fixture data
- No intelligence or morality scoring
- Clear distinction between change, reinforcement, and uncertainty

### Completion

- Compact summary
- Return-tomorrow invitation
- Celebration
- Share-safe outcome where appropriate
- Home return

### Perspective Provenance

The central value proposition of Mind Arena is exposure to genuine human perspectives. Every perspective displayed in M1.5 must follow a strict provenance classification:

#### Provenance Source Types

1. **Consented Human Contribution:** Anonymized, consented text from actual human participants.
2. **Curated Public Quotation:** Verified historical or public commentary attributed to real sources.
3. **Expert-Reviewed Editorial Perspective:** Synthesized viewpoint developed and vetted by domain experts.
4. **Synthetic Test Fixture:** AI-generated text used *strictly* for internal developer testing.
5. **Deterministic Fallback:** Hardcoded safe content rendered when network or mock state fails.

#### Provenance Operational Rules for User Testing

- Prefer consented, anonymized human perspectives for all research builds.
- Record when, where, and how perspectives were collected.
- Preserve original meaning during any editorial editing.
- Remove all identifying personal details.
- Never fabricate demographic identities.
- **NEVER present synthetic text as a real participant to a user.**
- Clearly isolate internal development fixtures from user-facing research content.

### Arena Safety Review

Every Scenario used in Today’s Arena must pass a content-level safety audit prior to release:

- **Emotional Intensity:** Verify tone is engaging without provoking trauma or panic.
- **Sensitivity & Framing:** Audit for political/cultural sensitivity, stereotyping, and manipulative framing.
- **Factual Integrity & Balance:** Avoid false balance or unsupported factual assumptions.
- **Non-Judgmental Reflection:** Ensure reconsideration and Mind Shift summaries never shame or moralize.

#### Invariant Safety Control Rule

> [!CAUTION]
> The product must **never** imply: *"Changing your view is a success, and maintaining your original stance is a failure."*

#### Required User Safety Controls

- Ability to **leave** the Arena at any point;
- Ability to **skip** an uncomfortable scenario;
- Clear indicators of what information is private;
- Integrated **content reporting** controls;
- Ability to continue without submitting sensitive personal information.

### Return Loop

The 3-minute interaction must connect into a gentle, non-addictive daily return cycle that avoids anxiety-inducing gamification (e.g., streak penalties):

```text
Complete Today’s Arena
        ↓
Carry One Insight Away
        ↓
See Restrained Preview of Tomorrow
        ↓
Return from Natural Curiosity
```

- **Completion Promise:** Delivers a clear, non-judgmental summary of the participant's cognitive stance.
- **Home Screen State:** Displays a calm, completed badge and a quiet countdown to the next Arena.
- **Tomorrow Preview:** Shows a subtle topic teaser without spoiling the situation or choices.
- **Reflection History:** Provides access to past personal Mind Shift summaries.
- **Ethical Engagement:** Excludes streak counters, loss-aversion badges, or pushy notifications.

## Out of Scope

- Live participant matching
- Real-time discussion
- Unmoderated free text
- Production AI generation
- Production moderation
- Backend persistence
- Public leaderboards
- Winner selection
- Social popularity metrics

## Deliverables

- Mars Rescue production-quality prototype
- Complete scene sequence
- Arena domain model
- Arena fixture schema
- Perspective Provenance Register
- Content Safety Audit Checklist
- Return Loop Specification
- Build, Challenge, and Question interaction components
- Reconsideration flow
- Mind Shift card
- Completion experience
- All loading, error, timeout, and offline states
- User-testing script
- Experience replay mode

### Perspective Provenance Register Specification

Every fixture used in research builds must maintain a record with these required fields:

| Field | Description |
| :--- | :--- |
| **Perspective ID** | Unique UUID for the perspective item |
| **Arena ID** | Associated Arena scenario (e.g., `MARS_RESCUE_V1`) |
| **Source Type** | Consented Human / Curated Public / Expert Editorial / Synthetic / Fallback |
| **Consent Status** | Explicitly Consented / Public Domain / Editorial Approval / N/A |
| **Editing Performed** | Grammar cleanup / Anonymization / Truncation / None |
| **Identity Treatment** | Pseudonymous Tag (e.g., *Perspective A*) / Anonymized |
| **Sensitivity Classification** | Low / Medium / High (Requires Safety Lead Sign-Off) |
| **Review Status** | Pending / Approved / Rejected |
| **Approved Usage** | Internal Test Only / M1.5 User Research / Production |

## Dependencies

- All Stage 1 epics
- Epic 04 — Component Library
- Epic 05 — Scene System
- Epic 06 — Experience Engine
- Epic 07 — Mock Platform
- Epic 08 — Navigation System
- Epic 11 — State Management
- Epic 12 — Assets System

## Success Criteria

- The complete experience can be finished in approximately three minutes.
- Users understand why they must commit before seeing others.
- Every perspective displayed has a verified entry in the Provenance Register.
- Scenario passes the Content Safety Audit and guarantees user exit/skip controls.
- Users can distinguish Build, Challenge, and Question.
- Users recognize that perspectives come from humans.
- Users understand whether and how their thinking changed.
- The experience feels complete without live AI.
- Failure and fallback states do not break trust.
- User testing shows where hesitation, delight, confusion, and abandonment occur.
- The experience is compelling enough to validate before backend investment.

## Future Extensions

- Additional daily scenarios
- Multiple perspective counts
- Group-specific Arena variants
- Collaborative live Arenas
- Facilitated organization Arenas
- Arena history and comparison
- Richer Mind Shift visualizations

---

# Epic 13 — Audio & Haptics

## Objective

Add restrained sensory feedback that strengthens interaction meaning and emotional pacing.

## Why It Matters

Audio and haptics can make the experience feel alive, but they can also become distracting, inaccessible, or manipulative.

Mind Arena should use sensory feedback sparingly to reinforce transitions, confirmations, reflection, and completion.

## Scope

- Interaction sounds
- Transition sounds
- Ambient sounds
- Perspective reveal sound
- Reflection sound
- Success sound
- Completion sound
- Haptic feedback
- Platform capability detection
- Volume and mute preferences
- Haptic preferences
- Respect for system settings
- Audio interruption handling
- Accessibility alternatives
- Performance and loading strategy

## Out of Scope

- Continuous mandatory background music
- Startling sounds
- Manipulative reward loops
- Voice conversation
- Production AI narration
- User-uploaded audio

## Deliverables

- Sound philosophy
- Audio token map
- Haptic token map
- Audio manager
- Haptic manager
- Preference controls
- Platform fallbacks
- Accessible non-audio alternatives
- Asset optimization
- Sensory QA checklist

## Dependencies

- Epic 00 — Product Experience Foundation
- Epic 03 — Motion System
- Epic 12 — Assets System
- Epic 10 — Today’s Arena

## Success Criteria

- The complete experience remains understandable when muted.
- Sensory feedback respects user and system preferences.
- Sounds never block progression.
- Haptics degrade gracefully on unsupported devices.
- Audio does not noticeably delay scene readiness.
- Sensory cues are consistent and purposeful.

## Future Extensions

- Optional narrated Arenas
- Adaptive soundscapes
- Arena-specific audio themes
- Spatial audio experiments
- Accessibility-focused audio guidance

---

# Epic 14 — Accessibility

## Objective

Ensure that Mind Arena is usable across ability, input mode, platform, language, and user preference.

## Why It Matters

Accessibility is essential to the product mission. A platform intended to broaden human perspective cannot exclude people through preventable interaction or presentation barriers.

Accessibility must be built into the design system, components, scenes, and motion system.

## Scope

- Screen reader semantics
- Logical reading order
- Focus management
- Keyboard navigation
- Switch and alternative input support
- Dynamic text
- Text scaling
- High contrast
- Color accessibility
- Reduced motion
- Audio alternatives
- Haptic alternatives
- Error announcements
- Progress announcements
- Accessible dialogs
- Touch target sizing
- Orientation behavior
- Cognitive load
- Plain-language support
- Accessibility testing

## Out of Scope

- Certification for every global regulatory framework in M1.5
- Unsupported legacy platforms
- Backend content translation
- Medical accessibility claims
- Accessibility as a final audit-only activity

## Deliverables

- Accessibility standards
- Component accessibility contract
- Scene focus strategy
- Screen reader copy
- Reduced-motion mode
- High-contrast behavior
- Keyboard navigation map
- Automated accessibility checks
- Manual testing checklist
- Accessibility issue severity model

## Dependencies

- Epic 00 — Product Experience Foundation
- Epic 02 — Design System
- Epic 03 — Motion System
- Epic 04 — Component Library
- Epic 05 — Scene System

## Success Criteria

- Primary flows are operable without touch.
- Screen readers communicate scene purpose, state, progress, and actions.
- Text scaling does not break critical layouts.
- Reduced-motion mode is complete.
- Color is not the only signal.
- Focus never becomes trapped or lost.
- Error and success states are announced.
- Accessibility checks are included in completion criteria for every component and scene.

## Future Extensions

- Localization-driven accessibility
- Voice control
- Advanced cognitive accessibility modes
- Sign-language content support
- User-configurable reading complexity

---

# Stage 4 — Validation and Production Readiness

---

# Epic 15 — Offline Experience

## Objective

Allow the frontend to remain understandable, recoverable, and useful when connectivity is unavailable or unstable.

## Why It Matters

M1.5 must already run without network dependency. Later, when network services are introduced, the experience must not become more fragile.

Offline behavior should be designed as part of the product rather than represented only by a generic error banner.

## Scope

- Connectivity detection
- Local Arena availability
- Cached Arena content
- Local session persistence
- Pending actions
- Retry strategy
- Sync state presentation
- Conflict presentation
- Recovery flow
- Offline entry
- Mid-session disconnection
- Expired cached content
- Storage limits
- Cache invalidation policy
- Privacy of local data
- User controls

## Out of Scope

- Backend sync implementation
- Server conflict resolution algorithms
- Unlimited offline history
- Peer-to-peer synchronization
- Production encryption key infrastructure

## Deliverables

- Offline state model
- Cache policy
- Local session persistence
- Connectivity state components
- Retry and recovery flow
- Storage management strategy
- Mock sync simulation
- Offline QA matrix

## Dependencies

- Epic 07 — Mock Platform
- Epic 11 — State Management
- Epic 09 — Core User Flows
- Epic 10 — Today’s Arena

## Success Criteria

- A locally available Arena can be completed offline.
- Mid-session connectivity loss does not destroy progress.
- Users understand which actions are local, pending, or synchronized.
- Retry behavior is safe and idempotent from the frontend perspective.
- Expired or unavailable content is explained clearly.
- Local data follows privacy rules.

## Future Extensions

- Background synchronization
- Cross-device conflict resolution
- Downloadable Arena packs
- Offline group sessions
- Advanced storage management controls

---

# Epic 16 — Analytics & Telemetry

## Objective

Measure frontend experience quality, reliability, and performance while protecting user privacy.

## Why It Matters

User testing and production learning require evidence. The team needs to understand where users hesitate, abandon, retry, complete, or change direction.

However, Mind Arena handles reflective human contributions. Telemetry must never become a hidden collection channel for raw thought content.

## Scope

- Analytics architecture
- Event taxonomy
- Scene entry and exit
- Flow progression
- Completion
- Interaction choice type
- Timing
- Hesitation indicators
- Retry behavior
- Error events
- Performance metrics
- Crash reporting
- Privacy rules
- Redaction rules
- Consent behavior
- Development event inspector
- Analytics test mode
- Event versioning

## Out of Scope

- Raw contribution text
- Raw perspective text
- Private reasoning
- Sensitive free-text capture
- Advertising profiles
- Cross-product tracking
- Production vendor commitment in M1.5

## Deliverables

- Event taxonomy
- Privacy classification
- Redaction layer
- Analytics interface
- Mock analytics implementation
- Event inspector
- Performance event definitions
- Crash-report filtering rules
- Consent and preference model
- Analytics QA checklist

## Dependencies

- Epic 00 — Product Experience Foundation
- Epic 01 — Frontend Architecture
- Epic 05 — Scene System
- Epic 06 — Experience Engine
- Epic 09 — Core User Flows

## Success Criteria

- Raw user text cannot enter standard events or logs.
- Events are defined semantically, not tied to widget names.
- User journeys can be reconstructed at a structural level without exposing content.
- Analytics can be disabled or replaced.
- Crash reports redact sensitive state.
- Development builds can inspect emitted events.
- Event schemas are versioned and tested.

## Future Extensions

- Privacy-preserving cohort analysis
- Experiment analytics
- On-device aggregation
- Differential privacy
- Research-specific consented studies

---

# Epic 17 — Performance

## Objective

Ensure that Mind Arena feels immediate, smooth, and stable across supported devices and platforms.

## Why It Matters

A reflective experience depends on pacing. Jank, delayed interaction, asset popping, or slow startup breaks immersion and weakens trust.

Performance must be treated as an experience quality, not only a technical metric.

Epic 17 owns the formal performance program, but it does not defer performance work until Stage 4.
Every earlier component and scene must meet the current budgets and contribute measurements as it
is introduced. Performance regressions block completion of the slice that caused them.

## Scope

- Startup time
- First meaningful scene
- Frame performance
- Widget rebuilds
- Memory use
- Animation performance
- Image optimization
- Asset preloading
- Lazy loading
- State update efficiency
- List rendering
- Web bundle size
- Desktop resource behavior
- Battery awareness
- Profiling
- Performance budgets
- Low-end device testing

## Out of Scope

- Backend latency optimization
- Database performance
- Server rendering
- Network infrastructure
- Unsupported legacy devices

## Deliverables

- Performance budgets
- Profiling workflow
- Startup baseline
- Frame-performance baseline
- Memory baseline
- Asset-loading strategy
- Rebuild analysis
- Performance dashboard for development
- Low-end device test matrix
- Regression checks

## Dependencies

- Epic 03 — Motion System
- Epic 04 — Component Library
- Epic 09 — Core User Flows
- Epic 10 — Today’s Arena
- Epic 12 — Assets System

## Success Criteria

- Scene transitions meet frame targets on supported devices.
- Startup reaches useful content within the agreed budget.
- No critical memory growth occurs during repeated Arena runs.
- Large assets do not block interaction readiness.
- Performance regressions are detected before release.
- Compact, medium, and expanded compositions are profiled on representative mobile and desktop-class hardware.
- Resize, text scaling, keyboard interaction, and reduced motion do not introduce layout instability or sustained frame regressions.
- Reduced-motion mode does not hide performance problems in standard mode.

## Future Extensions

- Adaptive visual quality
- Device-tier-based particles
- Predictive asset loading
- Remote performance configuration
- Advanced web delivery optimization

---

# Epic 18 — Testing Strategy

## Objective

Protect the frontend experience, architecture, components, state transitions, and accessibility from regression.

## Why It Matters

Mind Arena contains choreography, state, narrative progression, recovery, and visual detail. Manual testing alone cannot reliably protect all paths.

Testing must validate both engineering correctness and experience integrity.

## Scope

- Unit testing
- Domain testing
- Experience-engine testing
- Repository contract testing
- State testing
- Widget testing
- Golden testing
- Scene testing
- Navigation testing
- Integration testing
- Mock scenario testing
- Accessibility testing
- Performance testing
- Manual QA
- Device matrix
- Regression strategy
- Deterministic test clocks
- Deterministic animation tests
- Fixture validation

## Out of Scope

- Backend contract testing before backend exists
- Production load testing
- Server security testing
- Testing every purely decorative frame
- Reliance on golden tests as the only quality signal

## Deliverables

- Test pyramid
- Test conventions
- Fixture strategy
- CI test pipeline
- Golden baseline
- Scene test harness
- Experience replay tests
- Accessibility test suite
- Manual QA checklist
- Release regression suite
- Flaky-test policy

## Dependencies

- Epic 01 — Frontend Architecture
- Epic 04 — Component Library
- Epic 05 — Scene System
- Epic 06 — Experience Engine
- Epic 07 — Mock Platform
- Epic 09 — Core User Flows

## Success Criteria

- Experience transitions are covered by deterministic tests.
- Critical components have interaction and accessibility tests.
- Repository implementations must pass shared contract tests.
- Golden tests protect major visual states.
- End-to-end tests complete Today’s Arena under success and failure scenarios.
- Test failures produce actionable information.
- The pipeline remains fast enough for normal development.

## Future Extensions

- Visual diff review tooling
- Automated device farms
- Property-based state-machine testing
- Recorded user-session replay
- AI-assisted test generation with human review

---

# Epic 19 — Frontend Integration Readiness

## Objective

Prepare the frontend to replace mock implementations with real services without changing the experience architecture or scene UI.

## Why It Matters

This epic does not build the backend.

It proves that the frontend has clear contracts, data boundaries, error handling, authentication seams, and feature switches so future services can be integrated as implementation replacements rather than product rewrites.

## Scope

- Repository contracts
- DTO boundary definitions
- Domain mapping rules
- Integration adapter interfaces
- Network-state model
- Authentication adapter interface
- Feature flags
- Timeout expectations
- Retry expectations
- Idempotency assumptions
- Pagination assumptions
- Cache assumptions
- Error taxonomy
- Contract fixtures
- API-repository skeletons without production endpoints
- AI-provider adapter interfaces without live calls
- Integration checklist

## Out of Scope

- Backend endpoint implementation
- Database design
- Server authentication
- Live AI calls
- Production API credentials
- WebSocket infrastructure
- Backend deployment
- Choosing a permanent AI provider
- Replacing mock repositories during M1.5

## Deliverables

- Stable repository contracts
- Domain-to-DTO mapping specification
- Integration adapter skeleton
- Network and authentication interfaces
- Feature-flag system
- Shared repository contract tests
- Error mapping table
- Contract fixtures
- Backend requirement document generated from validated frontend needs
- Live-integration readiness checklist

## Dependencies

- Epic 01 — Frontend Architecture
- Epic 06 — Experience Engine
- Epic 07 — Mock Platform
- Epic 09 — Core User Flows
- Epic 10 — Today’s Arena
- Epic 15 — Offline Experience
- Epic 18 — Testing Strategy

## Success Criteria

- The mock repository can be replaced through dependency injection.
- UI scenes contain no mock-specific assumptions.
- Data-source failures map into stable frontend error types.
- Repository contract tests can be reused by future API repositories.
- Authentication is represented behind an adapter.
- Live AI can later replace fixture responses through an explicit provider boundary.
- The frontend produces a precise list of service requirements based on the validated experience.

## Future Extensions

- Production API repository
- Live authentication adapter
- Live AI facilitator adapter
- Streaming response adapters
- Real-time collaboration transport
- Remote configuration service

---

# Epic 20 — Production Readiness

## Objective

Prepare the frontend application for a controlled public release after experience validation and integration.

## Why It Matters

A prototype can demonstrate product value, but a public release requires reliability, polish, privacy controls, platform compliance, observability, and repeatable release processes.

This epic ensures that the frontend does not depend on individual developer knowledge or last-minute manual checks.

## Scope

- UI polish
- UX polish
- Motion polish
- Content polish
- Accessibility audit
- Performance audit
- Privacy audit
- Cross-platform testing
- Device testing
- Error handling audit
- Offline audit
- Analytics audit
- Crash handling
- Build configuration
- Release flavors
- Signing readiness
- Store asset readiness
- Versioning
- Release checklist
- Rollback readiness
- Feature-flag readiness
- Support diagnostics

## Out of Scope

- Backend production operations
- Server incident response
- Marketing launch plan
- Customer support staffing
- Legal certification beyond the frontend checklist
- Unvalidated feature expansion

## Deliverables

- Release checklist
- Platform QA report
- Accessibility report
- Performance report
- Privacy review
- Error-state inventory
- Production build configuration
- Release notes template
- Rollback and kill-switch plan
- Support diagnostics screen
- Final M1.5-to-production gap report

## Dependencies

- Epic 14 — Accessibility
- Epic 15 — Offline Experience
- Epic 16 — Analytics & Telemetry
- Epic 17 — Performance
- Epic 18 — Testing Strategy
- Epic 19 — Frontend Integration Readiness

## Success Criteria

- No critical unresolved accessibility, privacy, performance, or stability defects.
- Release builds are reproducible.
- Feature flags can disable risky functionality.
- Crash and error diagnostics avoid sensitive content.
- Core flows pass the supported platform matrix.
- The app handles degraded service conditions safely.
- A release can be approved using documented evidence rather than intuition.

## Future Extensions

- Automated staged rollout
- Remote kill switches
- In-app release channels
- Beta cohorts
- Advanced diagnostics
- Continuous compliance checks

---

# Epic 21 — Future Foundation

## Objective

Prepare the frontend for future product expansion without introducing complexity before it is needed.

## Why It Matters

Mind Arena may later support live collaboration, multiple Arena grammars, plugins, new identity models, and different AI providers.

The frontend should preserve clean extension points while avoiding premature frameworks for unvalidated features.

## Scope

- Extension boundaries
- New Arena type contracts
- Scene composition extensibility
- Repository extensibility
- AI-provider abstraction
- Multiplayer-ready identifiers
- Collaboration-ready state boundaries
- Plugin boundary exploration
- Design evolution strategy
- Migration strategy
- Deprecation strategy
- Versioned experience definitions
- Compatibility principles

## Out of Scope

- Building multiplayer in V1
- Building live collaboration in V1
- Production plugin marketplace
- Multiple simultaneous AI providers
- Premature generic frameworks
- Abstracting systems without a demonstrated second use case

## Deliverables

- Future capability map
- Extension-point review
- Architecture constraints
- Versioning strategy
- Migration guidelines
- Deprecation policy
- New Arena type checklist
- AI-provider replacement checklist
- Technical debt register
- Explicit “not yet” list

## Dependencies

- Epic 01 — Frontend Architecture
- Epic 05 — Scene System
- Epic 06 — Experience Engine
- Epic 19 — Frontend Integration Readiness
- Epic 20 — Production Readiness

## Success Criteria

- Future directions have identified seams without active overengineering.
- V1 code does not hardcode Today’s Arena assumptions into every shared system.
- AI-provider-specific code is isolated.
- New Arena types can reuse core scene and engine infrastructure.
- Deferred features are documented clearly.
- The team can distinguish deliberate postponement from forgotten work.

## Future Extensions

- Multiplayer support
- Live collaboration
- Plugin architecture
- Arena authoring tools
- New Arena grammars
- Organization deployments
- AI-provider changes
- Cross-device group experiences

---

# 12. Recommended Execution Sequence

The roadmap should be executed in vertical experience slices, not by completing all infrastructure before showing a working product.

## Step 1 — Experience design and storyboarding (M1.4)

Complete enough of:

- Epic 00 — Product Experience Foundation
- Epic 02 — Mind Design System
- Epic 03 — Mind Experience System

to describe, storyboard, and prototype the emotional journey.

### Output

- Mind Design Bible
- Figma mood board
- Today’s Arena emotional timeline
- Scene storyboards for all Today’s Arena scenes
- Mars Rescue script
- Transition prototypes
- Mars Rescue experience video prototype

## Step 2 — Create the frontend skeleton

Complete the minimum viable foundations from:

- Epic 01 — Frontend Architecture
- Epic 04 — Component Library
- Epic 05 — Scene System
- Epic 11 — State Management
- Epic 12 — Assets System

### Output

- Running Flutter application
- Theme
- Core components
- Scene host
- State ownership model
- Asset registry

## Step 3 — Build one complete vertical slice

Implement:

```text
Home
  ↓
Arena Introduction
  ↓
Private Commitment
  ↓
Perspective Reveal
  ↓
Build / Challenge / Question
  ↓
Reconsideration
  ↓
Mind Shift
  ↓
Completion
```

Use:

- Epic 06 — Experience Engine
- Epic 07 — Mock Platform
- Epic 08 — Navigation System
- Epic 09 — Core User Flows
- Epic 10 — Today’s Arena

### Output

A fully playable Mars Rescue experience.

## Step 4 — Polish with the experience

Do not postpone these systems until the end:

- Epic 03 — Motion System
- Epic 13 — Audio & Haptics
- Epic 14 — Accessibility
- Epic 17 — Performance

They must be developed while scenes are being built.

### Output

A prototype that feels intentional rather than technically complete but emotionally unfinished.

## Step 5 — Validate with people

Run moderated and unmoderated tests.

Observe:

- where users hesitate;
- where they misunderstand;
- where they lose trust;
- where they smile;
- where they feel curiosity;
- whether Build, Challenge, and Question are clear;
- whether reconsideration feels safe;
- whether the Mind Shift summary feels meaningful;
- whether they would return tomorrow.

### Output

- Prioritized findings
- Revised interaction rules
- Revised content
- Revised pacing
- Revised component behavior
- Revised backend requirements

## Step 6 — Harden the frontend

Complete:

- Epic 15 — Offline Experience
- Epic 16 — Analytics & Telemetry
- Epic 18 — Testing Strategy
- Epic 20 — Production Readiness

### Output

A stable, measurable, testable frontend.

## Step 7 — Define integration from validated needs

Complete:

- Epic 19 — Frontend Integration Readiness
- Epic 21 — Future Foundation

### Output

A precise service contract based on a proven user experience.

No production backend implementation is part of this frontend roadmap.

---

# 13. Suggested M1.5 Delivery Increments

## Increment A — Experience language

- Product principles
- Emotional timeline
- AI facilitator voice
- UX writing samples
- Mars Rescue script
- Visual direction
- Motion direction

## Increment B — Design and motion playground

- Theme
- Typography
- Color
- Spacing
- Buttons
- Cards
- Perspective card
- Mind Shift card
- Core transitions
- Reduced-motion mode

## Increment C — Scene shell

- Scene host
- Navigation
- State model
- Mock repository
- Mock loading
- Error and offline controls

## Increment D — Arena vertical slice

- Arena introduction
- Private Commitment
- Perspective Reveal
- Structured Contribution
- Reconsideration
- Mind Shift
- Completion

## Increment E — Cross-platform experience

- Android
- iOS
- Web
- Desktop
- Responsive behavior
- Keyboard and focus behavior
- Platform-specific interaction review

## Increment F — User-testing build

- Debug controls hidden
- Deterministic test scenarios
- Session reset
- Observation events
- Consent-safe analytics
- Facilitator test guide
- Feedback capture process

## Increment G — M1.5 hardening

- Accessibility
- Performance
- Offline behavior
- Test coverage
- Error recovery
- Production-style polish
- Integration requirement extraction

---

# 14. Frontend Definition of Done

A frontend task is not complete only because the happy path renders.

## 14.1 Component completion

A component is complete when it has:

- documented purpose;
- semantic token usage;
- all interaction states;
- accessibility semantics;
- keyboard behavior where relevant;
- intentional compact, medium, and expanded behavior;
- touch, keyboard, and pointer behavior where applicable;
- text scaling without clipped content or hidden actions;
- state-preserving resize behavior where state is owned above the component;
- reduced-motion behavior where relevant;
- performance evidence when the component affects startup, animation, scrolling, or repeated rebuilds;
- widget tests;
- golden coverage for major states;
- no repository or feature business logic.

## 14.2 Scene completion

A scene is complete when it has:

- clear entry conditions;
- clear exit conditions;
- loading state;
- success state;
- error state;
- retry behavior;
- offline behavior where relevant;
- focus behavior;
- compact, medium, and expanded composition tests;
- touch, keyboard, and pointer-path checks;
- text-scaling and state-preserving resize checks;
- accessibility announcements;
- transition behavior;
- interruption behavior;
- restoration behavior;
- analytics events without sensitive content;
- scene tests.
- profile-mode performance evidence against the current startup, response, frame, and memory budgets.

## 14.3 Repository completion

A repository implementation is complete when it:

- implements the shared contract;
- maps failures into stable domain errors;
- supports cancellation or timeout expectations;
- passes repository contract tests;
- does not leak source-specific DTOs to scenes;
- supports deterministic testing.

## 14.4 Experience completion

An experience flow is complete when:

- every valid path works;
- invalid transitions are prevented;
- state can be restored;
- failures preserve user trust;
- the user understands progress;
- the user can recover;
- the flow is accessible;
- the flow meets performance budgets;
- the flow has been tested with real users.

## 14.5 Experience review gate

Every pull request that alters visual, motion, spatial, sound, pacing, or interaction behavior must undergo an **Experience Review** in addition to technical code review.

### Standard PR vs. Experience PR

- **Standard PR:** Validates correctness, state management, test coverage, code style, repository isolation, and performance.
- **Experience PR:** Evaluates fidelity to the Mind Design Bible, emotional pacing, transition smoothness, atmosphere alignment, and delight factor.

An Experience PR requires:

1. a recording or live visual demonstration of the scene;
2. verification against approved M1.4 storyboards;
3. check for reduced-motion compliance;
4. validation of waiting-state and fallback immersion;
5. explicit approval from the experience owner.

---

# 15. Frontend Decision Rules

Use these rules during implementation and review.

## Rule 1 — Experience before infrastructure

Do not build generic infrastructure without a validated experience need.

## Rule 2 — Mock the service, not the product

The product experience must be complete. Only the data source is mocked.

## Rule 3 — Scenes own pacing

Reusable components render and interact. Scenes control timing, readiness, entry, exit, and composition.

## Rule 4 — The engine owns workflow rules

Widgets do not decide which Arena step is valid next.

## Rule 5 — Repositories hide data sources

UI and engine code must not know whether data came from JSON, local storage, an API, or an AI provider.

## Rule 6 — AI must be replaceable

Every AI-shaped response must have:

- a contract;
- a mock fixture;
- a timeout;
- a deterministic fallback;
- a safe error state;
- a manual escape or retry path where appropriate.

## Rule 7 — Accessibility is a feature requirement

No component or scene is complete without accessibility behavior.

## Rule 8 — Motion must explain something

If an animation does not guide attention, communicate state, reinforce continuity, or provide feedback, remove it.

## Rule 9 — Do not log human thought content

Raw contribution and reflection content must not enter standard analytics, logs, or crash reports.

## Rule 10 — Avoid premature future architecture

Create extension seams only where the current product provides evidence that they are needed.

---

# 16. User-Testing & Research Protocol for M1.5

The M1.5 prototype must answer core product hypotheses, not only usability questions. High task completion alone will not be mistaken for product-market validation.

## 16.1 M1.5 Research Plan Specifications

- **Target Participant Profile:** Adults matching the Primary M1.5 User profile (curious adults seeking structured, thoughtful perspective exchange).
- **Recruitment Method:** Direct outreach and community sampling targeting diverse background perspectives.
- **Sample Size:** 12–15 participants for initial qualitative research cycle.
- **Session Formats:** 60% moderated 1-on-1 sessions (for deep observation); 40% unmoderated recorded test runs (for self-guided friction checks).
- **Consent & Recording:** Informed consent for UI screen capture and verbal feedback; no raw user thought content stored in unencrypted analytics.
- **Facilitator Protocol:** Neutral facilitator script; zero pre-explaining of product concepts; observe natural navigation.
- **Data-Retention & Privacy:** Anonymized observation notes; video recordings purged after synthesis; zero PII linked to perspective responses.
- **Severity Scale:**
  - *Critical (Blocker):* User fails to understand commitment privacy or loses trust.
  - *Major:* User misses perspective reveal or misunderstanding of Build/Challenge/Question grammar.
  - *Minor:* Visual/pacing friction during transition.

## 16.2 Evidence Separation Categories

Research evidence must be separated into four distinct buckets to prevent confusing usability polish with product value:

1. **Usability Evidence:** Can users operate the interface, navigate scenes, and complete actions without guidance?
2. **Experience Evidence:** Does the flow feel surprising, calm, safe, thoughtful, and memorable?
3. **Product-Value Evidence:** Did encountering contrasting human perspectives create meaningful reflection or position clarification?
4. **Retention Evidence:** Would users choose to return tomorrow out of genuine curiosity without streak mechanics or push prompts?

## 16.3 Strategic Evaluation Questions

### Understanding
- Did users understand what Mind Arena is?
- Did they understand why commitment happens before perspective reveal?
- Did they understand that the revealed perspectives represent humans?
- Did they understand Build, Challenge, and Question?
- Did they understand the Mind Shift result?

### Emotion
- Did the introduction create curiosity?
- Did the reveal feel surprising?
- Did contribution feel safe?
- Did reconsideration feel like reflection rather than correction?
- Did completion feel rewarding without feeling competitive?

### Pacing
- Did any scene feel rushed?
- Did any scene feel slow?
- Did users read both perspectives?
- Did motion help or delay understanding?
- Was the complete experience close to the intended three minutes?

### Trust
- Did users know what was private?
- Did users understand the role of AI?
- Did any result feel judgmental?
- Did any summary imply intelligence or moral scoring?
- Did the product feel manipulative or popularity-driven?

### Retention
- Would users return tomorrow?
- What made them want to continue?
- What would prevent them from returning?
- Did the final summary feel personally meaningful?

---

# 17. Explicitly Deferred From M1.5

The following items are not required for the frontend experience prototype:

- Production backend endpoints
- Production database
- Live AI integration
- Production authentication provider
- Real-time WebSockets
- Multiplayer synchronization
- Public profiles
- Direct messaging
- Follower graphs
- Production moderation service
- Real participant matching
- Push notifications
- Payment systems
- Organization administration
- Plugin marketplace
- Large-scale analytics vendor integration
- Microservices
- Permanent AI-provider selection

Interfaces may be prepared where necessary, but these systems must not distract from validating Today’s Arena.

---

# 18. M1.5 Exit Decision

At the end of M1.5, the team should make a deliberate decision.

Proceed to backend and live integration only when evidence shows that:

- users understand the experience;
- the three-minute loop is compelling;
- the structured contribution grammar works;
- the emotional pacing is effective;
- users trust the role of AI;
- users understand the Mind Shift;
- the experience has meaningful repeat potential;
- frontend requirements are stable enough to define service contracts.

If these conditions are not met, the correct action is to improve the experience prototype—not to compensate by adding backend complexity or a more powerful AI model.

---

# 19. Final Readiness Position

To ensure the repository proceeds in strict compliance with the Mind Arena Working Agreement, feature implementation is governed by explicit readiness gates:

### Ready Now (M1.4 Execution Phase)

You are cleared to begin work on:

- [x] Experience Manifesto
- [x] Primary-user definition
- [x] Mind Design Bible
- [x] Arena Content Bible
- [ ] Mars Rescue real-perspective collection
- [x] Emotional timeline
- [x] Scene storyboards (TA-01 through TA-07)
- [x] Research planning & protocol

### Approved Foundation (Incremental Flutter Implementation May Begin)

The nine foundational artifacts required before Flutter product implementation are approved:

| Artifact Gate | Approval Status |
| :--- | :---: |
| 1. Primary M1.5 User Definition | Approved |
| 2. Product Hypothesis & Thresholds | Approved |
| 3. Real Perspective Provenance Plan | Approved |
| 4. Arena Content Bible | Approved |
| 5. Mind Design Bible | Approved |
| 6. Seven Scene Storyboards (TA-01 to TA-07) | Approved |
| 7. M1.5 Research Protocol & Script | Approved |
| 8. Primary Platform Certification Decision | Approved |
| 9. M1.4 Timebox & Stop Rule Agreement | Approved |

Implementation proceeds one approved user-observable slice at a time. Slice 01 is governed by
`docs/implementation/m1.5-slice-01-invitation-and-situation.md`. Real-perspective collection remains
an operational requirement before human cards can be used in research; it does not authorize
fabricated fixtures or block TA-01 and TA-02 implementation.

---

# 20. Final Direction

Mind Arena should begin by asking:

> How should people feel during each of the 180 seconds they spend in Today’s Arena?

The frontend must answer that question before production infrastructure begins defining the product.

The immediate objective is therefore:

> Build a fully interactive, backend-free, live-AI-free version of Today’s Arena that feels production quality, runs across target platforms, supports realistic failure and offline states, and is ready for human validation.

Once that experience is proven, backend development becomes a focused engineering exercise: implement the repository contracts and service requirements already discovered through a working product.

Until then, the experience prototype is the product.
