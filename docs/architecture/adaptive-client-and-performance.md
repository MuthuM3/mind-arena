# Adaptive Client and Performance Foundation

**Status:** Architecture authority for all client implementation

## Decision

Mind Arena is one adaptive Flutter product for phones, tablets, and desktop-class windows. The
domain model, arena state machine, validation, persistence, and API contracts are shared. Each
window class receives a deliberate composition suited to its available space and input methods.

Responsive does not mean scaling a phone layout. It means preserving the same task and state while
changing navigation, information density, placement, and interaction affordances.

## Window classes

Layout decisions use the current window's logical width, not a device label or orientation alone.
The initial tokens are:

| Class | Logical width | Primary composition |
|---|---:|---|
| Compact | below 600 | One focused column, bottom actions, staged disclosure |
| Medium | 600–1023 | Wider stage, optional supporting rail, two-pane reveal where useful |
| Expanded | 1024 and above | Persistent navigation/rail, centered arena stage, contextual side panel |

These are design tokens, not scattered numeric checks. A component may use its own constraints
when embedded in a narrower region. No feature branches on operating-system names to choose a
layout.

The product must remain usable in:

- compact and large phones in portrait and landscape;
- small and large tablets in portrait, landscape, and split view;
- resizable desktop windows, including widths that cross all three classes;
- browser-sized desktop surfaces if Flutter web is enabled later.

## Shared architecture

```text
presentation
├── adaptive shell and navigation
├── feature pages and responsive compositions
├── reusable arena components
└── platform input adapters
        │
application
├── arena session controller
├── commands and queries
├── state transitions
└── orchestration policies
        │
domain
├── arena package, role, constraint, stage, and action
├── choice, perspective, consequence, and Mind Shift
└── pure validation and transition rules
        │
infrastructure
├── local fixture/content repository
├── persistence
├── API adapters
└── telemetry adapters
```

Dependencies point inward. Widgets never own business rules. Domain and application layers do not
import Flutter. Roles, stages, prompts, and consequences are versioned data, not hardcoded screen
branches. The first prototype reads local fixtures through the same repository interfaces later
used by authenticated APIs.

## Adaptive composition rules

- Preserve one semantic reading and focus order across layouts.
- Keep the active decision and primary action visually dominant.
- Compact layouts reveal one stage at a time and keep actions thumb reachable.
- Medium layouts may place the arena and supporting context side by side.
- Expanded layouts may keep constraints or reflection visible without forcing modal navigation.
- Constrain text line length; do not let content stretch edge to edge.
- Components respond to their local constraints and avoid fixed screen dimensions.
- Resizing preserves the active stage, selection, draft, focus intent, and scroll intent.
- No horizontal scrolling is required for the core journey.
- System text scaling through at least 200% must not clip, overlap, or hide an action.
- Safe areas, display cutouts, virtual keyboards, and desktop window chrome are respected.

## Input and platform behavior

All primary actions work with touch, mouse, trackpad, and keyboard:

- visible focus and predictable tab order;
- Enter/Space activation where semantically appropriate;
- Escape closes dismissible overlays without losing a draft;
- pointer hover is enhancement only, never the sole source of information;
- touch targets are at least 48 logical pixels;
- keyboard shortcuts are discoverable and never replace accessible controls;
- drag gestures always have button or keyboard alternatives;
- back navigation is platform-correct and cannot silently discard work.

## Motion and rendering

- Prefer transform and opacity animation over repeated layout or expensive clipping.
- Isolate complex painting with repaint boundaries only after profiling confirms value.
- Avoid unbounded particle systems, perpetual tickers, and offscreen animation.
- Pause nonessential animation when the app is backgrounded or the surface is not visible.
- Reduced-motion mode replaces spatial travel with immediate state changes and focus emphasis.
- Large imagery is decoded near its display size and preloaded only when the next stage needs it.
- Long or dynamic collections use lazy construction and stable keys.

## Initial performance budgets

Budgets are measured in profile/release mode on representative hardware; debug-mode timings do not
count as evidence.

| Signal | Initial budget |
|---|---:|
| First usable arena from warm start | at most 1.0 s |
| First usable arena from cold start on representative mid-range phone | at most 2.5 s |
| Local tap/keyboard visual response | at most 100 ms |
| Draft persistence after a change | at most 250 ms without blocking UI |
| Animation frame budget at 60 Hz | 16.7 ms; at least 99% of journey frames within budget |
| Unexpected layout shift during a stage | none |
| Memory growth over 10 repeated local-fixture sessions | no sustained growth after settling |

Network-dependent states get separate service-level targets and must never freeze navigation,
typing, or draft recovery. Budgets may change from measured evidence, but may not disappear.

## Verification matrix

Every user-observable client slice includes:

1. unit tests for pure domain and application rules;
2. widget tests for compact, medium, and expanded compositions;
3. golden tests at representative sizes and at enlarged text;
4. keyboard and focus tests for desktop behavior;
5. semantics tests for labels, order, and actions;
6. reduced-motion coverage;
7. resize/state-preservation coverage;
8. profile-mode performance evidence for the affected journey.

Initial golden viewports:

- 390 × 844 for compact phone;
- 844 × 390 for compact landscape pressure;
- 768 × 1024 for medium tablet portrait;
- 1024 × 768 for expanded tablet/desktop boundary;
- 1440 × 900 for expanded desktop.

Golden tests catch visual regressions; they do not replace behavior, semantics, or real-device
checks.

## Service-boundary compatibility

The backend remains a modular monolith in the first implemented milestones. Identity, Arena,
Perspective, Moderation, Facilitation, and Exchange are explicit bounded contexts with owned domain
logic, storage access, and versioned contracts. Cross-context calls go through application
interfaces rather than another context's tables or internals.

This makes later service extraction possible without paying distributed-system costs on day one.
A context is extracted only when measured scale, security isolation, availability, deployment
cadence, or team ownership justifies it. Network boundaries, queues, and duplicated data are not
introduced merely to resemble microservices.

## Pull-request evidence

A client change is not responsive because it compiles at multiple targets. Review must show:

- the three window-class behaviors;
- input behavior relevant to touch and desktop;
- text scaling and reduced-motion behavior;
- no duplicated business logic between compositions;
- performance impact or an explicit statement that the change is outside a measured hot path.

