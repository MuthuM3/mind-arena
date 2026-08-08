# TA-06 — Reconsideration

## Purpose

Let the participant keep, refine, or change their choice after considering contrasting human or editorial reasoning and world consequences, granting equal visual and textual dignity to all three outcomes.

## User State Before Entry

Has recorded a private choice, engaged a human or editorial perspective, contributed a structured response, and reviewed the scenario consequence.

## Intended Emotion on Entry

Permission to clarify, unhurried reflection, and agency.

## Intended Emotion on Exit

Resolution and confidence in one's final deliberate position.

## Core User Question

"Having considered another view and the consequence, do I keep, refine, or change my stance?"

## Primary Action

`Form my Mind Shift`

## Secondary Actions

- `Keep` (maintain initial 3 roles and rationale)
- `Refine` (maintain 3 roles, clarify/expand rationale)
- `Change` (alter 1 to 3 role selections and rationale)
- `Review session lineage`

## Information Hierarchy

1. Session Lineage Summary (Initial choice → Engaged perspective with visible provenance label → Consequence)
2. Reflection Selector (`Keep`, `Refine`, `Change`)
3. Final Role Selection Grid & Rationale Input Field
4. Primary Action ("Form my Mind Shift")

## Eye Flow

Lineage summary → Keep/Refine/Change selector → Final choice controls → Mind Shift action.

## Content

Session lineage summary, final role selection grid, final rationale input. Engaged perspective retains visible provenance label (`Human perspective` vs `Editorial demonstration`).

## AI Presence

Deterministic comparison classifies observable selection/reason state as keep, refine, or change. AI does not infer openness, persuasion, emotion, or motive, and does not reward changing over keeping.

## Perspective Presence

Engaged human or editorial perspective remains reviewable in the lineage summary, explicitly preserving its visible provenance label (`Human perspective` vs `Editorial demonstration`).

## Interaction Sequence

1. Review session lineage.
2. Select reflection mode: `Keep`, `Refine`, or `Change`.
3. Confirm or adjust 3-seat role selection and final rationale.
4. Select `Form my Mind Shift`.

## Scene States

### Initial
Lineage summary loaded with visible provenance label; reflection selector active.

### Active
Final choice / rationale field open.

### Loading
Processing final stance commitment.

### Success
Final choice committed; transition to TA-07 — Mind Shift and Completion.

### Error
Validation error (e.g., incomplete 3-seat selection).

### Offline
Local validation.

### Restored
Restores active reconsideration selection.

## Motion Intent

Control feedback 100–160 ms; equal visual animation for Keep, Refine, and Change buttons. Focus moves to final-choice heading, not automatically to `Change`.

## Sound Intent

OPEN

## Haptic Intent

OPEN

## Accessibility

- All three outcomes (Keep, Refine, Change) receive equal visual hierarchy, contrast, and screen reader dignity.
- Initial and final choices explicitly labeled to preserve lineage legibility.

## Reduced Motion

Selection transitions present statically without directional animation.

## Exit Condition

Final choice committed via `Form my Mind Shift`.

## Next Scene

[TA-07 — Mind Shift and Completion](./TA-07-mind-shift-and-completion.md)

## Safety Considerations

Zero social comparison, percentile stats, majority badges, or "correct answer" indicators introduced.

## Analytics Without User Text

- `scene_entered`: `TA-06`
- `reconsideration_outcome`: `Keep` | `Refine` | `Change` (preserves human/editorial provenance)

## Storyboard

See [Approved Storyboard: TA-06 Reconsideration](../../frontend/todays-arena-storyboards.md#ta-06--reconsideration)

## Wireframe

TBD

## Open Questions

- [ ] OPEN: Lineage rail composition on compact viewports.

## Experience Review Checklist

- [x] Equal visual dignity for Keep, Refine, and Change outcomes.
- [x] Human vs editorial provenance preserved in Purpose, User State, and Lineage.
- [x] Initial private choice remains immutable and visible for lineage.
- [x] Zero social pressure applied.
