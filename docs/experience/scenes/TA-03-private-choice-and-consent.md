# TA-03 — Private Choice and Consent

## Purpose

Capture an independent private choice before social exposure, then provide a distinct pool-consent step allowing the participant to decide separately whether their perspective may enter the adult research pool.

> [!IMPORTANT]
> **Critical Invariant 1:** No perspective may be revealed before private commitment.
> **Critical Safety/Privacy Invariant 2:** Contribution consent is explicit, unbundled, and optional. Declining pool consent allows the user to continue the full Arena experience.

## User State Before Entry

Has reviewed the scenario, roles, and constraints in TA-02 Situation.

## Intended Emotion on Entry

Ownership, useful tension, and independent commitment.

## Intended Emotion on Exit

Confidence in recorded choice and clarity regarding contribution privacy boundaries.

## Core User Question

"What is my independent stance, and do I consent to share my reasoning with the adult perspective pool?"

## Primary Action

1. `Commit privately` (Step 1: Private Choice)
2. `Allow this perspective in the adult research pool` OR `Keep this private` (Step 2: Pool Consent)

## Secondary Actions

- `I’m still uncertain` (reason helper option)
- `Review facts sheet`
- `Leave arena` (with draft preserve/discard options)

## Information Hierarchy

1. Choice Header ("Private choice · Select 3 of 6")
2. Six Role Cards with selection state (`n of 3 selected`)
3. Private Reason Field (10–50 words) or Uncertainty Selection
4. Private Commitment Action (`Commit privately`)
5. *Post-Commitment Stage*: Frozen Contribution Preview & Separate Pool Consent Controls

## Eye Flow

Role selection cards → Reason field → Commit action → Frozen preview review → Pool consent selection → Continue action.

## Content

Selection counter (`Select 3 of 6`), reason field prompt (10–50 words), contribution preview, consent disclosure copy (purpose, audience, duration, withdrawal method).

## AI Presence

Deterministic guidance. No model recommendations, role preference cues, or reasoning scores.

## Human Perspective Presence

Zero human perspectives visible. Complete isolation from social influence.

## Interaction Sequence

1. Select exactly three of six roles.
2. Enter a short reason (10–50 words) or select `I’m still uncertain` with concise explanation.
3. Select `Commit privately`.
4. Review the frozen contribution preview card.
5. Read consent disclosure (purpose: research pool; audience: verified adults; duration: active study cohort; removal: available anytime in TA-07).
6. Select either `Allow this perspective in the adult research pool` or `Keep this private`.
7. Continue to TA-04 Other Minds.

## Scene States

### Initial
Empty selection; reason field blank.

### Active
3 roles selected; reason field active.

### Loading
Local draft saving.

### Success
Private commitment frozen; consent step revealed.

### Error
Validation error (e.g., fewer than 3 roles selected).

### Offline
Local simulation mode supported.

### Restored
Restores private draft state after interruption.

## Motion Intent

Control feedback 100–160 ms; card selection 180–240 ms. Smooth transition from choice inputs to frozen contribution preview and consent controls.

## Sound Intent

OPEN

## Haptic Intent

OPEN

## Accessibility

- Each role card announces title, function, and selection state (`n of 3 selected`).
- Consent disclosures, audience, duration, and removal terms read before controls.
- Keyboard selection supported; no drag interactions required.

## Reduced Motion

Selection and state transitions occur immediately without directional slide animations.

## Exit Condition

Private choice committed AND contribution consent choice selected (`Allow` or `Keep private`).

## Next Scene

[TA-04 — Other Minds](./TA-04-other-minds.md)

## Safety Considerations

- Consent is never preselected and never bundled into `Continue`.
- Declining pool consent transitions the participant to an explicitly limited/editorial demonstration branch. The user continues the full Arena flow, but the session is unmistakably flagged as editorial-provenance and MPE-ineligible.
- Raw text never enters analytics, server logs, or crash reports.

## Analytics Without User Text

- `scene_entered`: `TA-03`
- `choice_committed`: `TA-03` (role indices, excludes text)
- `pool_consent_given`: true | false

## Storyboard

See [Approved Storyboard: TA-03 Private Choice and Consent](../../frontend/todays-arena-storyboards.md#ta-03--private-choice-and-consent)

## Wireframe

TBD

## Open Questions

- [ ] OPEN: UI layout of consent confirmation badge on compact screens.

## Experience Review Checklist

- [x] Zero perspectives revealed prior to private commitment.
- [x] Unbundled pool consent step with explicit option to decline.
- [x] Declining consent does not block completion of the Arena experience.
