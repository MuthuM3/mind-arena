# TA-04 — Other Minds

## Purpose

Reveal two eligible perspectives with your choice of contrasting reasoning and let the participant choose one card to engage.

## User State Before Entry

Has committed privately to a choice and resolved contribution consent in TA-03.

## Intended Emotion on Entry

Human presence, curiosity, and surprise.

## Intended Emotion on Exit

Interest in engaging a specific contrasting viewpoint.

## Core User Question

"How did another perspective see this dilemma differently?"

## Primary Action

`Engage this perspective`

## Secondary Actions

- `Hide perspective`
- `Report perspective`
- `Block contributor` (core-path safety action)
- `Skip pair`
- `Review facts sheet`

## Information Hierarchy

1. Header ("Two perspectives considered this differently" for human pair, OR "Editorial demonstration set" for limited branch)
2. Two Side-by-Side / Sequentially Revealed Cards labeled `Human perspective` (for human pool) OR `Editorial demonstration` (for limited/fallback branch)
3. Pseudonymous Arena Alias, Role Choices, and Reason (20–70 words)
4. Optional `Wording assisted` provenance label (when author-approved on human cards)
5. Core Safety & Selection Controls (`Engage`, `Hide`, `Report`, `Block contributor`)

## Eye Flow

Heading → Perspective Card 1 vs Card 2 comparison → Provenance labels → Primary Engage action / Core safety actions.

## Content

Perspective content, arena aliases, role choices, and reasons (target 20–70 words per card). No photos, follower counts, biographies, or popularity scores. Editorial examples must NOT be called "two people" or labeled `Human perspective`. Editorial cards are unmistakably labeled `Editorial demonstration` and do not count as a human exchange.

## AI Presence

M1.5 uses reviewed local research set or editorial demonstration set. AI provides neutral framing of reasoning contrast without rating or ranking cards.

## Human Perspective Presence

High for human pool branch (`Human perspective` provenance). For limited/fallback branch, cards are explicitly labeled `Editorial demonstration` and human perspective count is 0.

## Interaction Sequence

1. Read two contrasting perspective cards (verifying human vs. editorial demonstration provenance).
2. Review own private choice rail if needed.
3. Select one perspective card to engage (or use `Hide`, `Report`, or `Block contributor`).

## Scene States

### Initial
Two perspective cards revealed.

### Active
Perspective cards active for selection or core-path safety actions.

### Loading
Fetching eligible perspective pair.

### Success
Selected perspective stored with provenance tag (`human` or `editorial`); transition to TA-05.

### Error
Insufficient human pool / fallback to editorial demonstration cards (unmistakably labeled `Editorial demonstration`).

### Offline
Supported via local research package.

### Restored
Restores selected perspective state.

## Motion Intent

Cards arrive smoothly; card state change 180–240 ms, scene transition 280–420 ms. Compact sequential arrival must not imply order preference.

## Sound Intent

OPEN

## Haptic Intent

OPEN

## Accessibility

- Cards expose provenance label (`Human perspective` or `Editorial demonstration`) before alias and reason text.
- Core-path safety actions (`Hide`, `Report`, `Block contributor`) are labeled secondary actions available without hover.
- Keyboard navigation supports direct focus and activation.

## Reduced Motion

Both perspective cards appear simultaneously without slide or fade transitions.

## Exit Condition

Participant selects one perspective card to engage.

## Next Scene

[TA-05 — Structured Exchange and Consequence](./TA-05-structured-exchange-and-consequence.md)

## Safety Considerations

- `Hide`, `Report`, and `Block contributor` are core-path behaviors accessible directly on the card without nested menus.
- Hiding, reporting, or blocking immediately removes/replaces the perspective and triggers safety/moderation review. Blocking isolates the participant from that contributor's alias across all future Arenas.
- Pseudonymous aliases rotate per Arena; no persistent social graphs exist.

## Analytics Without User Text

- `scene_entered`: `TA-04`
- `perspective_selected`: `TA-04` (tracks card ID and provenance, excludes text)
- `contributor_blocked`: true | false

## Storyboard

See [Approved Storyboard: TA-04 Other Minds](../../frontend/todays-arena-storyboards.md#ta-04--other-minds)

## Wireframe

TBD

## Open Questions

- [ ] OPEN: Algorithmic contrast metrics for research pool selection.

## Experience Review Checklist

- [x] Clear provenance labeling (`Human perspective` vs `Editorial demonstration`).
- [x] Editorial examples are never called "two people" or labeled human.
- [x] Core-path blocking, reporting, and hiding controls present.
- [x] Zero social metrics, follower counts, or photos.
