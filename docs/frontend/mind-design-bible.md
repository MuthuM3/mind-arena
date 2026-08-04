# Mind Design Bible

**Status:** Approved direction for the M1.5 Mars Rescue prototype

**Version:** 1.0

**Design direction:** Quiet Orbit

## Experience promise

Mind Arena should feel like entering a calm, responsive thinking space where a difficult situation
becomes clear and another person’s reasoning becomes tangible. It must not feel like a survey,
social feed, debate stage, chatbot, casino, or science-fiction control panel.

The visual system serves three priorities in order:

1. Trust: authorship, privacy, state, and consequences are unambiguous.
2. Thought: the active decision and reasoning remain visually dominant.
3. Atmosphere: story, motion, sound, and depth make the interaction memorable without competing
   with comprehension or performance.

## Emotional timeline

| Scene | Intended feeling | Avoid |
|---|---|---|
| TA-01 Invitation | Quiet curiosity | Urgency, popularity pressure, fake activity |
| TA-02 Situation | Immersion and clarity | Dense exposition, cinematic confusion |
| TA-03 Private choice | Ownership and useful tension | Correct-answer cues, rushed countdown |
| TA-04 Other minds | Human presence and surprise | Social comparison, profile judgment |
| TA-05 Exchange | Constructive tension and agency | Combat language, red-versus-green debate |
| TA-06 Reconsideration | Permission to clarify | Pressure to change or agree |
| TA-07 Mind Shift | Recognition and completion | Scoring personality, victory fanfare |

## Visual direction: Quiet Orbit

The arena is a dark, calm spatial field with warm readable surfaces and restrained orbital cues.
Thought objects have stable positions and lineage. A subtle horizon or arc suggests a shared world;
it never becomes a decorative dashboard.

### Design characteristics

- Deep neutral background rather than pure black.
- Warm-white text with high contrast.
- Cyan for participant action and focus.
- Violet for clearly human-authored perspective objects.
- Amber for fictional consequence and caution, never moral failure.
- Coral only for destructive, safety, or blocking actions.
- Soft elevation and borders; no glass-heavy blur.
- Rounded geometry that feels deliberate rather than playful or toy-like.
- Sparse line work showing relationships between thought objects.
- No robot mascot, chat bubbles, neon cyberpunk, leaderboards, or winner badges.

## Color tokens

Token names describe meaning, not a particular scene.

| Token | Initial value | Use |
|---|---|---|
| `canvas.base` | `#07111F` | Primary background |
| `canvas.raised` | `#0D1A2B` | Navigation and secondary stage |
| `surface.default` | `#142338` | Thought cards and controls |
| `surface.emphasis` | `#1B2E48` | Active decision object |
| `border.quiet` | `#36506F` | Structure and inactive boundaries |
| `text.primary` | `#F5F7FA` | Primary copy |
| `text.secondary` | `#C0CAD8` | Supporting copy |
| `text.muted` | `#94A4B8` | Metadata that remains readable |
| `action.primary` | `#62D7CD` | Primary action and participant focus |
| `human.primary` | `#B8A7FF` | Real human perspective provenance |
| `world.consequence` | `#F0BE72` | Fictional consequence and world change |
| `safety.critical` | `#FF8F8F` | Report, destructive warnings, critical errors |
| `focus.visible` | `#8DDEFF` | Keyboard focus ring |

No component uses raw color values outside the token definition. State is always communicated with
label, shape, icon, or position as well as color. Contrast must be measured in the implemented
composition before a token is accepted.

## Typography

M1.5 uses a two-family system after asset-license and rendering verification:

- **Display and scene headings:** Manrope, variable weight 500–700.
- **Reading and controls:** Inter, variable weight 400–700.
- **Fallback:** platform system sans-serif stack.

Both selected families require recorded Open Font License provenance before bundling. If font
loading, locale coverage, package size, or rendering performance fails, the system stack is the
approved fallback; implementation does not wait for branding.

### Type roles

| Role | Compact size | Expanded size | Guidance |
|---|---:|---:|---|
| Display | 32 | 44 | One short line where possible |
| Scene title | 24 | 32 | Current stage and question |
| Card title | 18 | 20 | Object identity |
| Body | 16 | 17 | Primary reading content |
| Supporting | 14 | 15 | Provenance and context |
| Label | 13 | 14 | Controls and state labels |

Line height remains at least 1.4 for body copy. Text containers use a readable maximum line length
of approximately 45–75 characters. System scaling to 200% takes priority over fixed scene height.

## Spacing and geometry

- Base spacing unit: 4 logical pixels.
- Approved steps: 4, 8, 12, 16, 24, 32, 48, and 64.
- Minimum touch target: 48 × 48 logical pixels.
- Compact page edge: 16; medium: 24; expanded: 32–48.
- Thought card radius: 20 compact, 24 medium/expanded.
- Control radius: 14; compact pill radius only for short status labels.
- Focus ring: 3 logical pixels with 2-pixel separation from the component boundary.

Fixed heights are prohibited for text-bearing cards unless maximum text scaling and localization
have been proven. Cards grow vertically and layouts reflow rather than clip.

## Adaptive composition

### Compact: below 600

- One active task per viewport.
- Primary action remains reachable near the bottom but participates in scrolling when text grows.
- Supporting facts use staged disclosure with a persistent “Review facts” action.
- No horizontal scrolling for the core journey.
- Landscape reduces decoration before reducing reading space.

### Medium: 600–1023

- Arena stage uses the primary two-thirds of available width.
- A supporting facts or progress rail may appear when it improves continuity.
- Tablet split view can collapse to compact without changing state.
- Touch remains first-class while hover and keyboard are fully supported.

### Expanded: 1024 and above

- Navigation/progress rail, centered stage, and contextual panel may coexist.
- Main reading measure remains constrained; content never stretches edge to edge.
- Pointer hover is supplementary; visible focus and keyboard order remain primary.
- Window resize across all classes preserves stage, selection, draft, focus intent, and scroll
  intent.

All compositions share one semantic order and domain state. Layout is selected from local
constraints, never operating-system or device-name checks.

## Core thought objects

### Situation panel

Owns world premise, immutable facts, constraint, and review action. It uses world styling and never
looks like a participant message.

### Role card

Shows role title, functional responsibility, selection state, and any public relationship. Role
cards have equal visual weight; selection does not imply human worth.

### Private-choice object

Uses participant-action styling and an explicit `Private` label. It remains visually distinct from
anything eligible for the perspective pool.

### Human-perspective card

Always contains:

- `Human perspective` provenance label;
- rotating arena alias;
- selected roles or choice;
- reason as the primary content;
- hide, report, and accessibility actions;
- optional `Wording assisted` label when author-approved.

It never contains a photograph, follower count, biography, inferred trait, or popularity score.

### Facilitator cue

The facilitator is represented by a small guiding constellation: three restrained points connected
by a line or arc. It has no face, avatar, speech persona, or human alias. The cue appears only when
the system is framing, clarifying, or reflecting.

### Consequence object

Uses amber world styling, a stable rule label, and clear simulated-world framing. It never uses
success/failure colors or declares a morally correct choice.

### Mind Shift

Shows lineage from initial choice through encountered perspective and response to final choice.
Keep, Refine, and Change receive equal visual dignity. Correct, reject, save, and share remain
separate explicit actions.

## Motion language

Motion explains continuity rather than adding spectacle.

| Motion | Duration | Purpose |
|---|---:|---|
| Control feedback | 100–160 ms | Confirm input immediately |
| Card state change | 180–240 ms | Preserve object identity |
| Scene transition | 280–420 ms | Show progression without delay |
| Consequence reveal | 360–520 ms | Make world response legible |
| Mind Shift assembly | at most 700 ms total | Reveal lineage in two or three bounded steps |

- Prefer opacity and transform.
- No perpetual animation, fake typing, simulated audience activity, or unbounded particles.
- Every transition can be interrupted by navigation without losing state.
- Background decoration pauses when hidden or the application is inactive.

### Reduced motion

Reduced motion replaces spatial travel with immediate composition, short opacity change, visible
focus movement, and textual relationship labels. It preserves order, information, and timing
control. Sound and haptics never replace missing motion meaning.

## Sound and haptics

M1.5 may include a restrained optional sound map after performance and accessibility review:

- Enter arena: low, brief spatial tone.
- Commit private choice: soft tactile confirmation.
- Reveal human perspective: two distinct gentle arrivals, not message notifications.
- Consequence: low tonal shift without alarm.
- Complete Mind Shift: resolved texture without victory fanfare.

Sound defaults follow platform expectations, respects system settings, and has one global mute.
Haptics are mobile enhancement only. The complete journey works with both disabled.

## Interaction states

Every interactive component defines default, hover where relevant, focused, pressed, selected,
disabled, loading, error, and destructive-confirmation states. Disabled controls explain what is
missing when that information is useful. Loading never erases the previous stable state.

Primary actions use clear verbs: `Enter arena`, `Commit privately`, `Continue`, `Build`, `Challenge`,
`Question`, `Keep`, `Refine`, `Change`, and `View my Mind Shift`.

Avoid generic `Submit`, gamified `Win`, or coercive `Agree` language.

## Trust presentation

- `Private`, `Shared with this pool`, `Pending`, `Human perspective`, `From the editors`, and
  `Facilitator` are visually consistent system labels.
- Consent is never hidden inside a primary action.
- Participant counts appear only when truthful and useful.
- Offline, cached, stale, and pending-sync states are distinct.
- AI-assisted wording is disclosed at the object where it appears.
- Report, hide, leave, correct, reject, withdraw, and delete remain reachable from their relevant
  objects.

## Accessibility contract

- Semantic order follows situation → own choice → human perspectives → response → consequence →
  final choice → Mind Shift.
- Each thought object exposes type, provenance, state, relationship, and available actions.
- Headings form a logical hierarchy.
- Focus never moves merely because the layout class changes.
- Errors are announced and linked to the affected field.
- Selected roles expose count and identity without relying on color.
- Keyboard users can complete every action without drag gestures.
- Escape closes dismissible overlays without discarding a draft.
- Text at 200% does not clip, overlap, or hide actions.
- High-contrast and forced-color environments retain boundaries and focus.
- Reading instructions can be reviewed and are not time-limited.

## Performance and asset discipline

- Meet the budgets in
  [Adaptive Client and Performance](../architecture/adaptive-client-and-performance.md) from the
  first scene.
- No design effect is accepted based on debug-mode smoothness.
- Raster assets are decoded near display size.
- Fonts are subset only after language scope is known; required license files ship with assets.
- Animation assets require size, CPU/GPU, memory, reduced-motion, and web fallback evidence.
- Atmosphere is removed before responsiveness, legibility, input latency, or battery is compromised.

## M1.5 asset direction

The prototype may use code-rendered gradients, arcs, stars, and schematic role glyphs. It does not
require character portraits or photorealistic Mars art. This reduces asset cost, cultural coding,
download size, and visual inconsistency while preserving atmosphere.

Before bundling any external asset, record source, creator, license, modification permission,
attribution requirement, file size, supported density, and fallback.

## Design acceptance checklist

- [x] One primary visual direction selected: Quiet Orbit.
- [x] Compact, medium, and expanded composition rules defined.
- [x] Color, typography, spacing, shape, motion, sound, and facilitator language defined.
- [x] Human, editorial, facilitator, private, consequence, and safety objects remain distinguishable.
- [x] Reduced motion, keyboard, text scaling, focus, and semantic-order rules defined.
- [x] Performance and asset rules defined.
- [ ] Implemented color contrast measured in every component state.
- [ ] Final font files and licenses verified before bundling.
- [ ] Storyboard comprehension reviewed with target participants.

The unchecked items are implementation/research evidence, not missing design direction. They block
component completion where applicable, not creation of the first bounded implementation packet.
