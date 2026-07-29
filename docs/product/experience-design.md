# Experience and Design Language

## Design concept: The Living Arena

Mind Arena should feel like entering a compact interactive world—not opening a feed, survey, or
noisy chat room.

The interface is a stage where a situation unfolds, choices create tension, human perspectives
arrive, and the world responds. Motion and spatial design make story and thinking legible; they do
not simulate activity that is not real.

## Emotional arc

1. **Curiosity:** “What would I do?”
2. **Immersion:** “I understand the world and stakes.”
3. **Ownership:** “This is my independent choice.”
4. **Human presence:** “A real person chose differently.”
5. **Productive tension:** “Their reason changes what I need to consider.”
6. **Agency:** “I can respond and make my final choice.”
7. **Consequence:** “The world reacted to what we considered.”
8. **Reflection:** “This is what shifted—or became clearer.”
9. **Comparison:** “I want to know what my friend would do.”

## Interaction grammar

| Object | Meaning | Visual behavior |
|---|---|---|
| Situation | Shared world and stakes | Establishes the stage and atmosphere |
| Role | A person/function inside the world | Stable, legible decision object |
| Constraint | What makes the decision difficult | Remains visible throughout |
| Perspective | A human’s provisional view | Distinct seat/card with authorship |
| Reason | Why the view exists | Attached support, never detached quote bait |
| Build | Adds strength or possibility | Extends the targeted perspective |
| Challenge | Tests an assumption or trade-off | Creates visible tension, not a red attack |
| Question | Requests clarity/evidence | Opens space beside the target |
| Connect | Finds compatibility or shared cause | Draws a bridge |
| Consequence | Rule-derived change in the world | Emerges from relevant choices |
| Reconsideration | A participant’s private change | Shows lineage from initial to final view |
| Mind Shift | Reflection on group movement | Forms from participant-approved objects |

Red/green winner semantics are avoided. Opposition and change must remain emotionally safe.

## Three-minute pacing

The time target is a design constraint, not a countdown:

- situation and private commitment: about 45–60 seconds;
- perspective reveal and reading: about 30–45 seconds;
- structured contribution: about 60–90 seconds;
- consequence, final choice, and Mind Shift: about 30–45 seconds.

Users may take longer. The product does not force-submit or punish thoughtful pauses.

## Human presence without social pressure

V1 identity is intentionally light:

- generated arena alias;
- optional broad context voluntarily chosen for the arena when relevant;
- no avatar photo requirement;
- no follower count, biography, or popularity;
- visible “human perspective” authorship;
- asynchronous timing disclosed honestly.

The interface should convey that another person contributed without encouraging profile judgment.

## AI presence

The AI appears as a world operator and facilitation layer, not a hidden human seat:

- it frames the next move;
- highlights a relationship;
- requests a rewrite for respect;
- marks a possible assumption;
- drafts a synthesis.

AI content uses a consistent facilitator treatment and label. It never receives a human avatar or
alias.

In formats with fictional AI characters, every character is visibly fictional. Character dialogue
may enrich a future arena, but V1 does not depend on unrestricted character chat.

## Motion language

### Continuity

Perspectives do not disappear between stages. The camera or layout reveals relationships while
preserving each object’s origin.

### Productive tension

A Challenge should create subtle spatial tension between ideas, not flash danger. A Build adds
weight or reach. A Connect forms a visible bridge. Reconsideration morphs the participant’s own
position while retaining the starting point.

### Ambient motion

Ambient behavior can signal that the arena is alive, but V1 must not:

- show fake typing indicators;
- animate absent users as if present;
- imply a live audience;
- use fabricated activity;
- run expensive particles with no meaning.

### Reduced motion

- scene movement becomes immediate layout change plus focus emphasis;
- relationships have lines, labels, and semantic descriptions;
- pulsing, parallax, camera travel, and particle effects are disabled;
- the same sequence and content remain available.

## Visual direction

- calm contrast with topic-specific atmosphere;
- custom semantic tokens rather than raw Material styling;
- clear authorship and state above visual novelty;
- depth only to explain hierarchy or relationship;
- broad-script legibility;
- no glass-heavy, cyberpunk, or robot-assistant default;
- one coherent open icon family until custom icons are justified.

## Sound and haptics

Sound reinforces:

- entering the scenario and committing a choice;
- revealing human perspectives;
- revealing a bounded consequence;
- forming a connection;
- completing reflection.

No victory fanfare for “changing someone’s opinion.” Sound and haptics are optional and never carry
meaning alone.

## Writing style

Facilitator language is:

- concise;
- curious;
- neutral about stance;
- specific to the thought object;
- respectful without inflated praise;
- transparent about uncertainty.

Preferred: “Which assumption in this choice would you test first?”

Avoid: “Destroy this weak argument” or “Great job changing your mind!”

## Accessibility

The spatial arena must have an equivalent ordered representation:

1. situation, roles, and constraints;
2. own initial choice;
3. other human choice and reason;
4. relationship/action;
5. consequence;
6. own final choice;
7. Mind Shift.

Every object includes type, author class, relationship, state, and actions in its accessible label.
Color, motion, and position are never the only indicators.

## Performance budgets

Before implementation, define measurable budgets for:

- first usable frame;
- input response;
- frame time on representative mid-range devices;
- transition interruption;
- perspective-fetch latency;
- moderation wait;
- draft recovery;
- memory and package size.

If atmosphere competes with trust, legibility, or responsiveness, atmosphere loses.

## Design review questions

1. Is every displayed human actually human?
2. Can the participant tell what is private, pooled, or shared?
3. Does the interaction improve human contribution or merely decorate it?
4. Is disagreement framed around ideas rather than people?
5. Can a person keep their view without feeling punished?
6. Does the result show evolution without inventing consensus?
7. Does the experience work without motion, sound, color, or AI?
8. What can be removed while preserving the useful exchange?
