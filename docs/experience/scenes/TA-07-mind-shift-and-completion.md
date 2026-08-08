# TA-07 — Mind Shift and Completion

## Purpose

Provide a faithful, private reflection on what changed, became clearer, or remained unresolved using a deterministic source-linked template, then offer deliberate private saving, spoiler-safe result card sharing, and contribution withdrawal without forced viral mechanics or game fanfare.

## User State Before Entry

Has completed final reconsideration in TA-06.

## Intended Emotion on Entry

Recognition, mental clarity, and quiet satisfaction.

## Intended Emotion on Exit

Sense of time well spent and calm return to daily activities with intent to return tomorrow.

## Core User Question

"What did I learn about my own thinking, and how do I save or complete today's session?"

## Primary Action

`Done` (completes session; does NOT automatically save to local history)

## Secondary Actions

- `Correct summary` (modify deterministic reflection wording)
- `Reject summary` (remove reflection summary while keeping private session record)
- `Save privately` (explicit optional action to save to local journal)
- `Create result card` (generate spoiler-safe shareable card)
- `Withdraw contribution` (remove contributed reason from research pool)

## Information Hierarchy

1. Mind Shift Summary Card (Initial stance → Encountered perspective → Reflection insight → Final stance; labeled with explicit provenance, and marked `MPE-ineligible` if completed via editorial demonstration path)
2. Summary Review Controls (`Correct`, `Reject`)
3. Completion Acknowledgment ("Arena Complete")
4. Session Actions (`Save privately`, `Create result card`)
5. Privacy Control (`Withdraw contribution`)
6. Primary Action (`Done`)

## Eye Flow

Heading → Mind Shift reflection card → Correct/Reject controls → Save/Share options → Contribution withdrawal link → Done button.

## Content

M1.5 uses a deterministic source-linked template (NOT AI-generated phrasing) mapping initial choice, perspective contrast, and final stance. Spoiler-safe share template excludes scenario spoilers and third-party raw text. Demonstration-only completion is unmistakably labeled `MPE-ineligible`.

## AI Presence

Deterministic template mapping only. No AI model generation or cloud model calls. Deterministic summary is strictly rejectable and correctable by the user. If rejected or corrected, the reflection summary is cleared/updated without forcing acceptance or blocking session completion. AI never assigns personality, intelligence, or moral scores.

## Human Perspective Presence

Summary preserves and references engaged perspective provenance (`Human perspective` or `Editorial demonstration`). Demonstration-only completion is explicitly flagged as MPE-ineligible. Third-party raw text is strictly excluded from generated share cards.

## Interaction Sequence

1. Read the rendered deterministic Mind Shift reflection card.
2. Optionally select `Correct summary` to refine phrasing, or `Reject summary` to discard the reflection summary.
3. Optionally select `Save privately` to explicitly save the session lineage to the local journal (selecting `Done` without saving leaves the session unsaved).
4. Optionally select `Create result card` to export a spoiler-safe share image/text.
5. Select `Done` to finalize and exit the session.

## Scene States

### Initial
Mind Shift summary rendered via deterministic template; review controls active.

### Active (Accepted / Corrected / Rejected)
- **Accepted:** Mind Shift summary confirmed.
- **Corrected:** Mind Shift wording updated by user.
- **Rejected:** Reflection summary cleared; private choice lineage retained without text summary.

### Loading
Export image/text preview rendering.

### Success
Session finalized and exited.

### Error
Export preview error fallback.

### Offline
Fully supported offline via local deterministic package.

### Restored
Restores completion state upon resume.

## Motion Intent

Scene transition 280–420 ms; calm visual arrival without victory fanfare, star bursts, or confetti.

## Sound Intent

OPEN

## Haptic Intent

OPEN

## Accessibility

- Mind Shift summary rendered as an ordered list of clear text blocks with provenance tags.
- Correction, rejection, saving, sharing, and withdrawal controls fully accessible via keyboard and screen reader.
- Saving and sharing are explicitly optional and default to off.

## Reduced Motion

Static completion composition without celebratory particle or motion animations.

## Exit Condition

Participant selects `Done`.

## Next Scene

None (Return to home stage / app exit).

## Safety Considerations

- Third-party raw text and private user text strictly excluded from generated result cards.
- Participant may withdraw their contributed reason from the research pool at any time from this screen via `Withdraw contribution`.
- Demonstration-only completion explicitly flagged as MPE-ineligible.

## Analytics Without User Text

- `scene_entered`: `TA-07`
- `mind_shift_action`: `Accepted` | `Corrected` | `Rejected`
- `provenance_type`: `human` | `editorial`
- `mpe_eligible`: true | false
- `session_completed`: `Today's Arena`
- `saved_privately`: true | false
- `share_card_created`: true | false
- `contribution_withdrawn`: true | false

## Storyboard

See [Approved Storyboard: TA-07 Mind Shift and Completion](../../frontend/todays-arena-storyboards.md#ta-07--mind-shift-and-completion)

## Wireframe

TBD

## Open Questions

- [ ] OPEN: Visual design layout of spoiler-safe shareable result card.

## Experience Review Checklist

- [x] Deterministic source-linked template used (not AI-generated text).
- [x] Done action does NOT automatically save to local history; saving is explicit and optional.
- [x] Demonstration-only completion explicitly flagged as MPE-ineligible.
- [x] Rejecting or correcting summary updates/removes text without blocking completion.
- [x] Every statement traces directly to approved session objects.
- [x] Zero personality, moral, or intelligence scoring.
- [x] Sharing is explicitly optional and defaults to off.
- [x] Contribution withdrawal link clearly accessible.
