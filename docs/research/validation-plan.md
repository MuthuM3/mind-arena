# Product Validation Plan

## Objective

Prove that a short shared scenario plus real human perspective creates more emotion, insight, and
return intent than a solo AI story, solo answer, or unstructured comments before investing in
automated facilitation, live rooms, or a scenario catalog.

## Riskiest assumptions

1. A story-driven dilemma creates stronger curiosity than an abstract discussion prompt.
2. People want real human perspective enough to accept asynchronous participation.
3. Independent commitment plus structured response feels better than comments or chat.
4. Three minutes is enough for situation, human surprise, final choice, and Mind Shift.
5. People will contribute to a pool for the benefit of someone they may never meet.
6. A bounded consequence improves immersion without being mistaken for moral judgment.
7. AI facilitation improves selection and reflection without making the exchange feel synthetic.
8. Pseudonymity and moderation create safety without removing human warmth.
9. Today’s Arena creates repeat use beyond novelty.
10. The product can maintain perspective supply and quality in a small network.

## Research stages

### Stage 0: proposition and language

**Artifact:** storyboard for Mars Rescue as Today’s Arena

**Participants:** 8–10 target users

Test:

- Do people understand that perspectives are from real humans?
- Does asynchronous still feel like “thinking together”?
- Do “Today’s Arena,” “Mind Shift,” and the Mars Rescue premise help or confuse?
- Is “Perspective Sprint” correctly invisible to consumers?
- Does the experience sound like debate, social media, or a survey?
- Is the outcome desirable enough to contribute?

Pass evidence:

- at least 7 of 10 accurately describe the human-to-human value;
- at least 6 of 10 want to complete the actual exchange;
- no repeated critical trust misunderstanding remains;
- language is revised until users do not expect a winner or live chat.

### Stage 1: manual Today’s Arena

**Artifact:** simple form/cards with human editorial matching and facilitation

**Participants:** 12–20 from one or two trusted communities

Process:

1. participants answer privately;
2. the researcher moderates and groups perspectives;
3. participants receive contrasting perspectives;
4. they submit one structured contribution;
5. they receive a bounded consequence, make a final choice, and receive a manual Mind Shift.

Observe:

- completion without explanation;
- time and friction;
- quality of initial reasons;
- usefulness of selected difference;
- willingness to let the perspective help someone later;
- reactions to receiving a response;
- safety and identity concerns.

Directional gate:

- at least 70% complete the exchange;
- at least 60% rate the human perspective as useful;
- at least half produce a substantive Build, Challenge, or Question;
- at least half report a specific consideration they would not have generated alone;
- serious trust/safety failures are zero;
- at least one-third voluntarily opt into the next question.

Thresholds are decisions for a small study, not market claims.

### Stage 2: asynchronous concierge prototype

**Artifact:** tappable experience plus manual backend/admin operations

**Participants:** 25–50 in controlled cohorts over two to three questions

Test:

- contribution-first empty-pool state;
- pseudonymous identity;
- consent and withdrawal;
- response notification;
- pool freshness;
- repeat behavior;
- editorial workload;
- differences between communities.

Gate:

- the second-question return rate demonstrates behavior beyond novelty;
- safe eligible supply exists before each reveal;
- manual selection/review time is measurable and sustainable for the next cohort;
- the Mind Shift is faithful and valued;
- no feature requires fabricated activity or forced live scheduling.

### Stage 3: functional alpha

**Artifact:** mobile client, Go modular monolith, PostgreSQL, reviewer tools, deterministic
selection/facilitation

**Participants:** 50–100 invited adults

Test:

- full state and consent lifecycle;
- automated eligibility rules with human review;
- block/report/delete;
- fair exposure;
- interruption and draft recovery;
- accessibility;
- privacy-safe analytics.

Gate:

- Meaningful Perspective Exchange completion is stable;
- moderation and selection are operationally controllable;
- false-positive/negative samples meet the pre-agreed safety threshold;
- block and withdrawal behavior passes end-to-end tests;
- no raw content appears in ordinary telemetry;
- at least two cohorts show voluntary repeat use.

### Stage 4: AI-assisted private beta

**Artifact:** AI support for moderation triage, reasoning representation, facilitation, and Mind Shift
drafts behind existing contracts

**Participants:** 100–300 with staged rollout

Run controlled comparisons:

- manual/deterministic selection vs AI-assisted selection;
- template reflection vs AI draft;
- no rewrite suggestion vs optional rewrite;
- different facilitation moves.

AI passes only if it improves human outcomes, safety, or operating cost without reducing trust.

Gate:

- usefulness improves or manual workload decreases materially;
- provenance errors are zero in audited samples;
- Mind Shift faithfulness meets human-review threshold;
- AI does not increase harmful exposure or extreme matching;
- cost per Meaningful Perspective Exchange is bounded;
- rollback to deterministic/manual operation works.

### Stage 5: live-room discovery

**Artifact:** concierge live sessions first, not production real-time infrastructure

Test:

- whether synchronous presence creates meaningfully more value;
- ideal group size and duration;
- turn structure and dropout;
- domination and safety;
- willingness to schedule or wait;
- whether voice adds value.

Build a live technical prototype only after the concierge live format consistently outperforms the
asynchronous alternative for a specific use case.

## Comparative baseline

The core research should compare:

1. solo AI answer;
2. unstructured human comments;
3. story-driven Today’s Arena with structured human perspective;
4. Today’s Arena with AI assistance.

The product thesis is supported only if structure plus real human perspective adds a distinct,
remembered benefit.

## Interview guide

- What did you expect before starting?
- Which thought came from another person rather than the system?
- What did you add to someone else’s thinking?
- What changed, became clearer, or stayed unresolved?
- Did any part feel judged, manipulated, or synthetic?
- Who did you believe could see your words?
- When would you choose this over AI chat or social media?
- What would make you return tomorrow?
- What would make you unwilling to contribute?
- What, exactly, would you tell a friend?

Avoid relying on “Would you use this?” without observed behavior.

## Instrumentation taxonomy

Events may include:

- `arena_viewed`
- `situation_revealed`
- `commitment_started`
- `commitment_recorded`
- `pool_consent_granted`
- `pool_consent_declined`
- `perspective_submitted`
- `perspective_made_eligible`
- `perspectives_revealed`
- `perspective_hidden`
- `contribution_started`
- `contribution_submitted`
- `consequence_revealed`
- `final_choice_recorded`
- `reconsideration_recorded`
- `mind_shift_viewed`
- `result_card_created`
- `friend_invited`
- `mind_shift_edited`
- `exchange_completed`
- `content_reported`
- `participant_blocked`
- `perspective_withdrawn`
- `response_notification_opened`

Allowed properties include versions, state, action type, timing bucket, eligibility/result code,
fallback, cohort, and non-content identifiers. Raw text is prohibited.

## Continue, iterate, pivot, stop

### Continue

People identify a valuable human contribution, complete the structured response, and return for a
new question.

### Iterate interaction

People value the exchange but struggle with timing, terminology, contribution types, or reflection.

### Pivot distribution

The interaction works only inside known communities or invite groups. Focus on community-hosted
arenas before a global consumer network.

### Pivot use case

Story-driven daily arenas feel trivial, but invited groups find strong value in purposeful
brainstorming or decisions. Validate a Purpose Arena wedge without claiming broad consumer
validation.

### Stop expansion

If multiple well-run cohorts prefer solo AI or unstructured conversation and cannot name a distinct
human insight, do not compensate with more models, animation, gamification, or scale.
