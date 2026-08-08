# TA-02 — Situation

## Purpose

Establish the fictional world, six equal-weight roles, immutable facts, guardian relationship (Coordinator–Young Dependent), and three-seat constraint within 30 seconds.

## User State Before Entry

Has completed TA-01 Invitation and entered Today's Arena.

## Intended Emotion on Entry

Immersion, clarity, and focus on the core dilemma.

## Intended Emotion on Exit

Comprehension of constraints and readiness to choose.

## Core User Question

"What is the dilemma, what are the constraints, and what are my options?"

## Primary Action

`I understand the situation`

## Secondary Actions

- `Review facts and rules`
- `Leave arena`

## Information Hierarchy

1. Scenario Premise (Reactor failure, evacuation imperative)
2. Constraint Banner ("Exactly 3 seats out of 6 roles")
3. Six Equal-weight Role Cards
4. Guardian Relationship Disclosure ("Coordinator — Young Dependent")
5. Primary Action ("I understand the situation")

## Eye Flow

Premise heading → 3-seat constraint banner → Role cards grid → Facts drawer action → Primary Action.

## Content

Immutable scenario facts and 6 role descriptions. Stated rule: "There is no approved correct list." Reading budget <= 90 words for core situation, <= 30 words per role summary.

## AI Presence

Facilitator framing cue. `arena.explain` uses deterministic package definitions only. No AI recommendation or role scoring.

## Human Perspective Presence

None. Zero human perspectives visible.

## Interaction Sequence

1. Read scenario premise and 3-seat constraint.
2. Review six equal-weight role cards and public facts.
3. Select `I understand the situation`.

## Scene States

### Initial
Premise and roles presented.

### Active
Facts drawer reviewable; primary action active.

### Loading
Scenario package rendering.

### Success
Transition to TA-03 — Private Choice and Consent.

### Error
Malformed scenario package error fallback.

### Offline
Supported locally via cached package.

### Restored
Restores situation state upon resume.

## Motion Intent

Staged reveal of situation cards; control feedback 100–160 ms, card state change 180–240 ms.

## Sound Intent

OPEN

## Haptic Intent

OPEN

## Accessibility

- Role cards expose title, function, and public relationship.
- 3-seat constraint included in heading and semantics.
- Line length constrained (45–75 chars); up to 200% text scaling supported.

## Reduced Motion

Immediate layout display without entrance transitions.

## Exit Condition

Participant selects `I understand the situation`.

## Next Scene

[TA-03 — Private Choice and Consent](./TA-03-private-choice-and-consent.md)

## Safety Considerations

Low-risk curated scenario facts; no graphic violence or sensitive topic violations.

## Analytics Without User Text

- `scene_entered`: `TA-02`
- `scene_completed`: `TA-02`

## Storyboard

See [Approved Storyboard: TA-02 Situation](../../frontend/todays-arena-storyboards.md#ta-02--situation)

## Wireframe

TBD

## Open Questions

- [ ] OPEN: Sound cues during facts drawer expansion.

## Experience Review Checklist

- [x] Scenario facts and 3-seat constraint clear within 30 seconds.
- [x] Equal visual weight across all 6 roles.
- [x] Facts reviewable throughout subsequent scenes.
