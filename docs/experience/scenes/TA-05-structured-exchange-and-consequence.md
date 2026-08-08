# TA-05 — Structured Exchange and Consequence

## Purpose

Enable the participant to contribute to an engaged human or editorial perspective using structured interaction grammar (Build, Challenge, Question), then reveal one bounded fictional trade-off connected to their initial choice and engaged perspective.

## User State Before Entry

Has selected one human or editorial perspective to engage from TA-04 Other Minds.

## Intended Emotion on Entry

Constructive tension, agency, and intellectual focus.

## Intended Emotion on Exit

Insight into fictional trade-offs and readiness for reconsideration.

## Core User Question

"How can I build on, challenge, or question this reasoning, and what consequence follows?"

## Primary Action

`Add my response` (Step 1) → `Continue to reconsider` (Step 2, after consequence reveal)

## Secondary Actions

- `Build` (action mode)
- `Challenge` (action mode)
- `Question` (action mode)
- `Review engaged perspective`

## Information Hierarchy

1. Engaged Perspective Summary Card (pinned, displaying visible provenance label `Human perspective` or `Editorial demonstration`)
2. Action Mode Selector (`Build`, `Challenge`, `Question`)
3. Neutral System Prompt (target 10–80 words for response)
4. Response Input Field
5. Consequence Card (at most 70 words, revealed after response)
6. Primary Action ("Continue to reconsider")

## Eye Flow

Engaged perspective → Action mode buttons → Response field → Commit response → Consequence card reveal → Continue action.

## Content

Engaged perspective copy, neutral guidance prompts for selected action mode, deterministic world consequence object copy (at most 70 words). Visible provenance label (`Human perspective` or `Editorial demonstration`) is retained on the engaged card.

## AI Presence

- `response.guide`: approved neutral guidance prompt.
- `consequence.resolve`: deterministic scenario rule; no model alters outcome or scenario facts. AI never grades response.

## Perspective Presence

Engaged human or editorial perspective remains visible throughout response composition, explicitly preserving its visible provenance label (`Human perspective` vs `Editorial demonstration`).

## Interaction Sequence

1. Select action mode: `Build`, `Challenge`, or `Question`.
2. Read neutral guidance prompt.
3. Write a short structured response (target 10–80 words) targeting an idea or assumption.
4. Select `Add my response`.
5. View deterministic consequence object reveal.
6. Select `Continue to reconsider`.

## Scene States

### Initial
Engaged perspective pinned with visible provenance label; action mode unselected.

### Active
Action mode selected, response input active.

### Loading
Resolving consequence rule.

### Success
Consequence object revealed (360–520 ms transition).

### Error
Validation error or redirection for unsafe content.

### Offline
Consequence resolved via local scenario package rules.

### Restored
Restores draft response state.

## Motion Intent

Composer panel transitions smoothly into consequence object reveal. Consequence reveal duration: 360–520 ms.

## Sound Intent

OPEN

## Haptic Intent

OPEN

## Accessibility

- Action mode buttons clearly describe purpose and state.
- Consequence announcement occurs once for screen readers upon reveal.
- Line length constrained; 200% text scaling supported.

## Reduced Motion

Consequence card replaces composer immediately without animation.

## Exit Condition

Consequence reviewed and `Continue to reconsider` selected.

## Next Scene

[TA-06 — Reconsideration](./TA-06-reconsideration.md)

## Safety Considerations

- Response grammar targets ideas, assumptions, or trade-offs—never personal attack.
- Unsafe wording redirection prevents abusive submissions.

## Analytics Without User Text

- `scene_entered`: `TA-05`
- `action_mode_selected`: `Build` | `Challenge` | `Question`
- `response_submitted`: `TA-05` (excludes raw text, preserves human/editorial provenance)

## Storyboard

See [Approved Storyboard: TA-05 Structured Exchange and Consequence](../../frontend/todays-arena-storyboards.md#ta-05--structured-exchange-and-consequence)

## Wireframe

TBD

## Open Questions

- [ ] OPEN: Optional rewriting assistance parameter design.

## Experience Review Checklist

- [x] Three action modes (Build, Challenge, Question) supported.
- [x] Visible provenance label (`Human perspective` vs `Editorial demonstration`) preserved.
- [x] Consequence resolution is deterministic and rule-bound.
- [x] Response targets ideas, not personal attributes.
