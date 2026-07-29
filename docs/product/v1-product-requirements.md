# V1 Product Requirements: Today’s Arena

**Status:** Product authority

**Release target:** Curated, invite-only private beta

**Primary surface:** Mobile

**Active interaction target:** Approximately three minutes

**Eligibility:** Adults only

## V1 outcome

A first-time participant enters one story-driven dilemma, makes a private choice, encounters two
meaningfully different choices written by real people, responds constructively to one, makes a final
choice, and receives a comparable Mind Shift.

## Product statement

> One shared situation. Different minds. One surprising shift.

## Emotional contract

The arena should create:

- immediate curiosity about the situation;
- ownership of a meaningful choice;
- surprise from another human’s reasoning;
- safe reconsideration;
- a result worth comparing with a friend.

The intended final thought is:

> “I never thought about it that way.”

## Why asynchronous first

The experience must include real human perspective, but V1 must not require several strangers to
arrive simultaneously. Asynchronous participation avoids empty rooms, live waiting, unsafe matching
pressure, dropout, and premature real-time infrastructure.

Participants contribute now; their consented perspective can help later participants in the same
arena version. Nothing is represented as live when it is not.

## Flagship arena: Mars Rescue

### Premise

> A damaged Mars colony has one shuttle with three available seats. Six people remain. A reactor
> failure will make the colony uninhabitable. You must choose who leaves.

### Design purpose

The scenario creates meaningful trade-offs without requiring private disclosure or specialist
knowledge. Roles should represent competing mission needs and human obligations without mapping
cleanly to protected classes or implying that some lives are inherently worth more.

The final role set, wording, consequences, and safety framing require editorial and participant
testing.

### Provisional roles

- reactor engineer;
- physician;
- pilot;
- agricultural scientist;
- young dependent with a guardian relationship represented in the scenario;
- colony coordinator.

Roles are fictional scenario functions, not character-worth scores.

## Core journey

### 1. Today’s Arena

The home screen shows:

- arena title and visual premise;
- one-line stakes;
- approximately three-minute duration;
- shared-release status;
- truthful participation count only when available;
- one Enter Arena action.

Acceptance:

- A new participant understands this is an interactive situation shared with real people.
- The screen does not promise live presence.
- No fabricated count, percentile, difficulty, or activity appears.
- The value is clear before authentication.

### 2. Situation reveal

The arena introduces the world, roles, constraints, and decision through a short staged scene.

Acceptance:

- The decision can be understood in under 30 seconds.
- Facts and rules remain reviewable.
- Motion, sound, and text tell the same story.
- Reduced-motion users receive equivalent information.
- AI characters, if any, are clearly fictional.

### 3. Private choice

The participant selects three roles and gives one concise reason before seeing other people’s
choices.

Acceptance:

- Initial choice, reason, and optional confidence are distinct.
- The participant may express uncertainty.
- The response remains private until contribution consent.
- The system does not suggest a “correct” group.

### 4. Contribution consent

The participant previews the perspective and chooses whether it may enter the pseudonymous pool for
this arena version.

Acceptance:

- Purpose, audience, duration, and removal behavior are understandable.
- Declining still permits a clearly labeled limited/editorial flow.
- Arena aliases are used by default.
- Withdrawal prevents future selection promptly.

### 5. Other minds

The facilitator reveals two eligible human choices with meaningfully different reasoning.

Selection considers:

- distinct reasoning, not only different role selection;
- safety and moderation;
- fair contributor exposure;
- language compatibility;
- block state;
- avoiding duplication;
- no sensitive-trait inference.

Acceptance:

- Human, editorial, fictional-character, and AI content are visually distinct.
- A participant can hide, report, or skip a perspective.
- No AI-generated perspective is represented as a player.
- Insufficient supply produces an honest fallback state.

### 6. Structured response

The participant responds to one perspective:

- **Build:** improve or extend its reasoning;
- **Challenge:** test an assumption or consequence;
- **Question:** ask for missing information;
- **Connect:** identify a shared principle or compatible choice.

V1 can initially ship Build, Challenge, and Question.

Acceptance:

- The action targets an idea, choice, or reason—not the person.
- Safety guidance offers an optional author-approved rewrite.
- No text is silently changed.
- The participant can exit without losing the private choice.

### 7. Consequence

The arena reveals one bounded consequence related to the participant’s initial choice and the
perspective engaged.

Acceptance:

- The consequence follows scenario rules or labeled simulation.
- It does not declare moral correctness.
- It adds decision pressure without inventing factual certainty.
- The same arena version remains comparable across participants.

### 8. Final choice

The participant keeps, refines, or changes the selected roles and records a short reason.

Acceptance:

- Every outcome is legitimate.
- Initial and final choices remain visible.
- The interface does not credit another participant with “changing your mind.”
- No change is required to complete.

### 9. Mind Shift

The result shows:

- initial and final choice;
- human perspective engaged;
- contribution type;
- one added consideration;
- genuine convergence/divergence;
- aggregate choice distribution above privacy thresholds;
- rare consideration only when transparently measurable;
- one unresolved question.

Acceptance:

- Claims trace to scenario actions and source objects.
- AI-authored synthesis is labeled and editable where it describes the participant.
- No empathy, logic, greed, trustworthiness, openness, personality, or intelligence score.
- Another participant’s raw words never enter a public share without compatible consent.

### 10. Compare, invite, return

The participant can:

- save a private Mind Shift;
- create a spoiler-safe result card;
- invite a friend to the same arena;
- opt into notification for the next arena or response.

Acceptance:

- Sharing is deliberate and excludes private third-party content.
- Friend comparison reveals only after both commit in the future Friend Arena flow.
- No manipulative countdown or loss-framed streak.
- The participant can review and delete active contributions.

## Must have

- Today’s Arena home state
- One fully curated Mars Rescue scenario version
- Scenario roles, constraints, consequence rules, and state
- Pseudonymous account identity
- Adult eligibility state and denial for unknown/ineligible social access
- Arena audience classification
- Independent choice and reason
- Explicit perspective-pool consent
- Moderation before eligibility
- Selection with human override
- Build, Challenge, and Question
- Bounded consequence
- Final choice and Mind Shift
- Truthful aggregate calculations with minimum thresholds
- Spoiler-safe result card
- Report, hide, block, withdraw, delete, and leave
- Local draft recovery
- Private result history
- Admin/editorial/moderation tools
- Privacy-safe analytics
- Accessibility and reduced motion
- Adaptive presentation tokens for reading detail, pacing, density, text, motion, and sound

## Should have after the loop passes

- Three to five story-driven arenas using the same grammar
- Connect action
- Response notification to original contributor
- Friend Arena invite and delayed comparison
- Language-aware perspective pools
- Private observable-behavior coaching

## Not in V1

- Live random matching
- Freeform group chat
- Voice/video
- Direct messages
- Public profiles or followers
- User-created public arenas
- Global feed
- Public leaderboards
- Winner or debate judging
- Psychological, personality, moral, or intelligence scores
- Unrelated mini-game mechanics per scenario
- Fully generative world simulation
- Payments
- Children’s accounts
- Teen/child pools, guardian controls, or school administration
- Politics/current-event arenas
- Workplace performance dashboards

## Empty-pool behavior

1. Seed each arena with a moderated invited cohort.
2. Show contribution-first state while the pool forms.
3. Use explicitly labeled editorial perspectives as fallback.
4. Never fabricate players, choices, counts, or responses.
5. Delay the reveal or arena opening when safe contrast is insufficient.

An AI “possible perspective” can demonstrate a mechanic but does not count as human exchange.

## Age and adaptive-interface boundary

- V1 accepts only adult-eligible accounts into the perspective pool.
- Exact birthdate or age is not shown to other participants, used in matching, sent to AI, or placed
  in analytics.
- `unknown` eligibility fails closed for social access.
- Arena metadata declares its approved audience class.
- Text scaling, reduced motion, pacing, contrast, and instruction detail remain user-controlled and
  are not treated as evidence of age or ability.
- The domain foundation must allow future isolated audience modes without implementing minor
  registration in V1.

## Scoring and comparison

Allowed:

- initial/final choices;
- transparent group choice distribution;
- action completed;
- consideration frequency above privacy thresholds;
- scenario outcome defined by rules;
- completion time shown privately if meaningful.

Disallowed:

- intelligence, empathy, greed, trustworthiness, morality, openness, or personality scores;
- opaque AI percentiles;
- rewarding the number of people persuaded;
- popularity ranking;
- presenting simulation outcome as proof of moral correctness.

## North star

**Meaningful Perspective Exchange (MPE):**

1. enter and understand the shared situation;
2. commit independently;
3. encounter distinct eligible human reasoning;
4. submit a structured contribution or substantive private response;
5. make and record a final choice.

## Product measures

- first MPE completion;
- remembered human insight;
- “I never thought of it that way” response;
- voluntary next-arena return;
- friend invitation;
- result-card creation/share;
- response received/viewed;
- safe perspective-pool depth;
- contribution exposure fairness;
- report/hide rates;
- Mind Shift rejection/edit rate.

Research establishes baselines and gates. Vanity counts and AI token usage do not define success.
