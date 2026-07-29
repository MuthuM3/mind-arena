# Product and Engineering Decision Framework

## Ownership

The founder owns vision, taste, priorities, risk acceptance, and release.

Codex may act as delegated product and technical lead for routine decisions, but must escalate
choices that:

- change the target user, product promise, or human-first thesis;
- expand V1 beyond Today’s Arena or introduce unrelated game mechanics;
- change participant visibility, consent, or data use;
- introduce live random matching, voice, minors, politics, payments, or advertising;
- create a new privacy/security claim;
- materially change cost or timeline;
- require publishing, deployment, external communication, or irreversible migration.

Implementation agents act inside an approved task packet. They do not reinterpret community policy
or product scope.

## Decision test

For every feature or technology:

1. Which emotion, choice, or human-to-human outcome does it improve?
2. Which current milestone exit criterion does it advance?
3. What is the smallest manual test?
4. What abuse, privacy, supply, or operational risk does it create?
5. What evidence will show that it worked?
6. What do we remove or delay to make room?
7. What will cause us to reverse it?

If the first three answers are vague, defer it.

## Priority order

1. Emotional pull plus distinct value from human perspective
2. Trust, safety, consent, and user agency
3. Contribution clarity and reciprocity
4. Perspective supply and quality
5. Accessibility, reliability, and performance
6. Repeat behavior
7. AI automation
8. Monetization and distribution
9. Scale optimization

## Feature filters

### Add

The feature makes a human contribution more useful, safe, balanced, or memorable.

### Test manually

The value is plausible but process details are uncertain.

### Defer

The feature depends on density, moderation maturity, or an unvalidated behavior.

### Reject

The feature rewards outrage, dominance, popularity, hidden profiling, or deceptive human presence.

## Severity

- **P0:** data exposure/loss, severe safety failure, false human identity, false privacy claim
- **P1:** consent/block bypass, harmful content exposure, core exchange failure, invented synthesis
- **P2:** repeated confusion, accessibility gap, unfair selection, significant performance issue
- **P3:** polish or convenience issue with a safe workaround

P0 and P1 block release. P2 needs explicit disposition. P3 can be scheduled.

## ADR requirement

Write an ADR when a decision:

- changes product authority;
- changes synchronous/asynchronous behavior;
- changes identity, matching, consent, or retention;
- selects a foundational framework/provider;
- adds AI responsibility;
- adds live rooms, sharing, payments, organizations, or minors;
- accepts a significant safety or operational trade-off.

## Weekly rhythm

1. Review observed exchanges, safety cases, and current milestone gate.
2. Choose one uncertainty or vertical slice.
3. Write acceptance, abuse, and non-goal cases.
4. Prototype or implement.
5. Test with real participants or representative data.
6. Review evidence and decide.
7. Update roadmap, ADRs, risk register, and content policy.

## Product review checklist

- Does the scenario create curiosity before AI spectacle?
- Is the socially valuable perspective coming from a real person?
- Is AI running the world or improving the conversation rather than impersonating a person?
- Did participants think independently before social influence?
- Is the action structured enough to prevent noise?
- Can every person retain agency and dignity?
- Is human/AI/editorial provenance obvious?
- Are pool, consent, block, and removal states correct?
- Is the result faithful without judging a person?
- Does the format reuse the Arena Engine rather than create a disconnected mini-game?
- Can this work at current community density?
- Is this part of the current milestone?
