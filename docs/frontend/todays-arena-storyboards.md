# Today’s Arena Storyboards: Mars Rescue

**Status:** Approved interaction specification for M1.5

**Version:** 1.0

**Scenes:** TA-01 through TA-07

These storyboards define behavior and composition before Flutter implementation. They are not final
pixel mockups. The Mind Design Bible governs visual treatment; the Arena Content Bible and Mars
Rescue package govern wording and scenario truth.

## Shared frame

Every scene uses the same stable frame:

```text
Progress / scene title              Exit

┌────────────────────────────────────────┐
│                                        │
│            Active arena stage          │
│                                        │
└────────────────────────────────────────┘

Context or review action        Primary action
```

- Compact shows one active object and staged supporting context.
- Medium may show the stage beside a facts/progress rail.
- Expanded uses a persistent progress rail, constrained stage, and contextual panel.
- Semantic order stays identical across compositions.
- Resizing preserves scene, selection, draft, focus intent, and scroll intent.
- Every scene supports review facts, leave, reduced motion, 200% text, touch, keyboard, and pointer.

## TA-01 — Invitation

### Purpose

Create curiosity and communicate the truthful product contract before account or scenario effort.

### Participant sees

- `Today’s Arena`
- `Mars Rescue`
- “One shuttle. Three seats. Six lives and six responsibilities.”
- Approximately three minutes
- `Shared with real people · Not live`
- Adult-only research label
- `Enter arena`

No player count, percentile, streak, difficulty rating, countdown, or model brand appears.

### Composition

| Compact | Medium | Expanded |
|---|---|---|
| Atmospheric header, one premise card, trust labels, primary action | Premise stage plus short “How it works” rail | Progress/product rail, centered premise stage, trust/context panel |

```text
Compact                     Expanded
┌──────────────────┐        ┌────────┬────────────────────┬────────────┐
│ Today’s Arena    │        │ Today  │   Mars Rescue      │ How it     │
│                  │        │        │   premise          │ works      │
│  Mars Rescue     │        │        │                    │            │
│  one-line stakes │        │        │  3 min · not live  │ Adult only │
│                  │        │        │                    │            │
│  3 min · not live│        │        │ [ Enter arena ]    │ Privacy    │
│ [ Enter arena ]  │        └────────┴────────────────────┴────────────┘
└──────────────────┘
```

### System and AI

Deterministic approved copy only. No local or cloud model task.

### States

- Available local package
- Package unavailable
- Package expired
- Offline with valid package
- Research cohort unavailable

The screen explains unavailable states and never creates false activity to increase entry.

### Accessibility

Title → premise → duration/social truth → audience note → enter action. Decorative orbital art is
hidden from semantics. Focus begins on the scene heading, not the primary button.

### Acceptance

- A first-time participant can explain that this is a short asynchronous human-perspective
  experience.
- Entry works at all window classes and input modes.
- No private or social data is created before entry.

## TA-02 — Situation

### Purpose

Establish the fictional world, six roles, immutable facts, guardian relationship, and three-seat
constraint within 30 seconds.

### Participant sees

- Reactor failure and evacuation premise
- Exactly three available seats
- Six equal-weight role cards
- Coordinator–Young Dependent public guardian relationship
- Reviewable `Facts and rules`
- “There is no approved correct list.”
- `I understand the situation`

### Composition

| Compact | Medium | Expanded |
|---|---|---|
| Staged premise, constraint, 2-column or 1-column role list, facts sheet | Role grid with persistent constraint and collapsible facts rail | Progress rail, role stage, persistent facts/constraint panel |

Role order remains stable across layouts and carries no ranking meaning.

### System and AI

Scenario package supplies all facts. `arena.explain` uses deterministic definitions in M1.5. It may
clarify only approved public facts and must say when the package does not define an answer.

### States

- Normal reveal
- Reduced-motion immediate composition
- Facts panel open/closed
- Malformed or missing role data
- Interruption and resume

Malformed content blocks progression and offers safe exit; the UI never improvises missing facts.

### Accessibility

Role cards expose title, function, and public relationship. The three-seat constraint is included in
the heading and summary. Motion, sound, and visuals repeat the same facts rather than adding hidden
information.

### Acceptance

- Target users understand the choice in under 30 seconds.
- All facts remain reviewable from later scenes.
- No role receives visual or spoken preference.

## TA-03 — Private Choice and Consent

### Purpose

Capture an independent choice before social influence, then let the participant separately decide
whether the reason may help later research participants.

### Participant sees

- `Private choice · Select 3 of 6`
- Six role cards with selected count
- Concise reason field, target 10–50 words
- Optional uncertainty/confidence expression
- `Commit privately`
- After commitment: exact contribution preview and separate pool-consent choice

### Composition

| Compact | Medium | Expanded |
|---|---|---|
| Selected count pinned near heading; role cards; reason; scrolling primary action | Choice grid beside private-draft summary | Facts rail, choice stage, private summary/constraint panel |

At 200% text, the primary action scrolls naturally rather than covering the reason field.

### Interaction

1. Select exactly three roles.
2. Enter a reason or explicitly choose `I’m still uncertain` with a minimum useful explanation.
3. Commit privately.
4. Review the frozen contribution preview.
5. Choose `Allow this perspective in the adult research pool` or `Keep this private`.

Consent is never preselected and is not bundled into `Continue`.

### System and AI

Deterministic validation and guidance. Optional rewriting is not active in the first implementation.
The system does not recommend roles, reveal majority behavior, or score reasoning.

### States

- Empty, partially selected, valid, validation error
- Draft saved locally
- Draft restored after interruption
- Private commitment frozen
- Consent granted/declined
- Pending synchronization in a future connected milestone
- Leave with explicit keep/discard-draft choice

### Accessibility

Each role announces selected state and `n of 3 selected`. Error summary links to affected controls.
Keyboard selection uses standard activation; no drag interaction is required. Consent purpose,
audience, duration, and withdrawal are read before controls.

### Acceptance

- Other perspectives cannot be reached without an independent commitment.
- Declining pool consent still permits an explicitly limited/editorial path.
- Raw reason never enters analytics, logs, or crash reports.

## TA-04 — Other Minds

### Purpose

Reveal two eligible real human perspectives with meaningfully different reasoning and let the
participant choose one to engage.

### Participant sees

- `Two people considered this differently`
- Two cards labeled `Human perspective`
- Rotating arena alias, choice, and reason
- Optional `Wording assisted` provenance
- A short explanation of why the pair is useful when available
- Hide, report, skip, review facts, and select actions

### Composition

| Compact | Medium | Expanded |
|---|---|---|
| Cards arrive sequentially but both remain reviewable; select one | Side-by-side cards with equal weight | Own private choice rail, two-card comparison stage, facts/safety panel |

Compact sequence must not imply that the second card is newer or more important.

### System and AI

M1.5 uses a reviewed local research set or editorial demonstration set. Provenance validation and
selection are deterministic/manual. Editorial cards are unmistakably labeled and do not count as a
human exchange.

### States

- Two eligible human cards
- One card hidden or reported and safely replaced
- Insufficient human pool
- Editorial demonstration accepted/declined
- Cached package expired or provenance invalid
- No compatible language card

No eligible supply offers `Pause/leave` or `Continue with editor examples`; it never invents people.

### Accessibility

Cards expose provenance before alias and reason. Comparison order remains stable. Report and hide
are labeled secondary actions and do not require opening a hover-only menu.

### Acceptance

- Participants accurately distinguish human and editorial content.
- Selection uses reasoning contrast rather than extremity or protected traits.
- Report or hide never forces continued exposure.

## TA-05 — Structured Exchange and Consequence

### Purpose

Help the participant contribute to another person’s reasoning, then reveal one bounded fictional
trade-off connected to the initial choice and engaged perspective.

### Participant sees

- Selected perspective remains visible
- `Build`, `Challenge`, and `Question`
- One neutral prompt for the chosen action
- Response field
- Preview and `Add my response`
- Deterministic consequence object after response
- `Continue to reconsider`

### Composition

| Compact | Medium | Expanded |
|---|---|---|
| Perspective summary collapses but stays reviewable; action and response occupy stage | Perspective beside response composer; consequence replaces composer after commit | Own-choice rail, perspective/response stage, facts panel; consequence preserves lineage |

### System and AI

- `response.guide`: deterministic approved prompt.
- `response.rewrite`: inactive initially; future suggestion requires author approval.
- `consequence.resolve`: deterministic rule only; no model may alter outcome or scenario facts.

### States

- Action not selected
- Draft response
- Validation guidance
- Response committed
- Consequence revealing/revealed
- Unsafe wording redirection
- Leave while preserving private choice

### Accessibility

Action controls explain purpose, not merely labels. The selected perspective is referenced by a
stable heading. Consequence announcement occurs once and remains reviewable; sound and animation are
supplementary.

### Acceptance

- The response targets an idea, assumption, or consequence—not a person.
- All 20 role selections resolve through approved deterministic coverage.
- No response is silently rewritten or publicly sent in M1.5.

## TA-06 — Reconsideration

### Purpose

Let the participant keep, refine, or change the choice without rewarding movement for its own sake.

### Participant sees

- Initial choice
- Human/editorial perspective engaged with provenance
- Consequence considered
- `Keep`, `Refine`, and `Change`
- Final three-role selection and reason
- `Form my Mind Shift`

### Composition

| Compact | Medium | Expanded |
|---|---|---|
| Short lineage summary followed by final-choice controls | Initial lineage rail beside final choice | Persistent initial state, final-choice stage, consequence/context panel |

### System and AI

Deterministic comparison classifies observable selection/reason state as keep, refine, or change.
It does not infer openness, persuasion, emotion, or motive.

### States

- Keep selection and reason
- Refine reason only
- Change one to three roles
- Draft final reason
- Final choice committed
- Resume after interruption

### Accessibility

Initial and final objects have explicit labels. No red/green or success/failure semantics. Focus
moves to the final-choice heading, not automatically to `Change`.

### Acceptance

- All three outcomes have equal completion treatment.
- Final choice validation matches the original three-seat contract.
- Initial choice remains immutable and visible for lineage.

## TA-07 — Mind Shift and Completion

### Purpose

Provide a faithful, private reflection on what changed, became clearer, or remained unresolved, then
offer deliberate save or spoiler-safe sharing.

### Participant sees

- Initial and final choice
- Perspective provenance
- Response type
- Added consideration, if source-supported
- Convergence/divergence
- One unresolved question
- `Correct`, `Reject`, `Save privately`, and `Create result card`
- Contribution withdrawal access where relevant

### Composition

| Compact | Medium | Expanded |
|---|---|---|
| Vertical lineage with one field at a time and final actions | Lineage plus editable reflection panel | Full lineage stage with private-history/share context panel |

### System and AI

M1.5 uses a deterministic source-linked template. Future local or cloud drafting may improve
phrasing but cannot add unsupported claims. Generated wording remains labeled and correctable.

### States

- Complete human exchange
- Demonstration-only completion
- Keep/refine/change result
- Mind Shift accepted/corrected/rejected
- Saved privately
- Spoiler-safe result card preview
- Insufficient aggregate threshold
- Contribution withdrawn

### Accessibility

Lineage is an ordered list, not a purely spatial animation. Each field exposes source relationship.
Sharing is separate from saving and defaults off. Third-party raw text is excluded from the share
preview.

### Acceptance

- Every statement traces to approved session objects.
- No intelligence, empathy, morality, greed, openness, personality, or persuasion score appears.
- A demonstration session is clearly MPE-ineligible.
- Completion works without sharing, sound, motion, cloud AI, or network connectivity.

## Cross-scene transition map

```text
TA-01 Invitation
   ↓ enter
TA-02 Situation
   ↓ understands
TA-03 Private Choice + Consent
   ↓ independent commitment
TA-04 Other Minds
   ↓ selects one perspective
TA-05 Exchange + Consequence
   ↓ structured response
TA-06 Reconsideration
   ↓ final choice
TA-07 Mind Shift
```

Back navigation may review completed information but cannot reveal TA-04 before TA-03 commitment or
mutate frozen initial choice. Leaving always explains whether private draft, consented contribution,
or completed result remains.

## Storyboard review checklist

- [x] Seven stable scene IDs defined.
- [x] User purpose, content, actions, system role, states, and acceptance defined per scene.
- [x] Compact, medium, and expanded composition specified per scene.
- [x] Offline, empty, malformed, report, leave, and provenance paths included where relevant.
- [x] Touch, keyboard, pointer, semantics, text scaling, reduced motion, and resize covered.
- [x] Deterministic M1.5 behavior separated from future local/cloud AI.
- [ ] Comprehension and emotional pacing tested with target adults.
- [ ] Implemented transition and performance evidence recorded.

The final two checks are research and implementation evidence. They do not require the frontend to
invent additional scene behavior.
