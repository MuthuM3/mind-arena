# ADR-0005: Today’s Arena and the Arena Engine

**Status:** Accepted

**Date:** 2026-07-29

## Context

The collaboration-first thesis and asynchronous Perspective Sprint correctly identified real human
perspective as the durable value. The product still risked presenting itself as an abstract
discussion tool. Separately, the original AI-game vision offered emotion and immersion but risked
becoming a difficult-to-explain catalog of unrelated experiences.

The product needs one consumer surface that creates daily curiosity and one durable engine that can
support future formats without building them now.

## Decision

The consumer product is **Today’s Arena**: one shared, story-driven, approximately three-minute
scenario.

The flagship arena is **Mars Rescue**.

The daily emotional promise is surprising perspective:

> “I never thought about it that way.”

Perspective Sprint remains the internal interaction grammar:

1. enter a situation;
2. commit independently;
3. encounter real human difference;
4. Build, Challenge, or Question;
5. reveal a bounded consequence;
6. make a final choice;
7. receive a Mind Shift.

The long-term domain model is the **Arena Engine**, consisting of scenario, roles, world state,
actors with explicit provenance, stages, typed actions, consequences, and replay.

Product expansion follows:

1. Today’s Arena;
2. Friend Arena;
3. Live Arena;
4. Purpose Arena.

## Consequences

Positive:

- gives users concrete software to open every day;
- combines entertainment, human connection, and thinking value;
- produces an understandable “What would you do?” invitation;
- supports spoiler-safe comparison and sharing;
- aligns future mysteries, negotiation, survival, and collaboration around one engine;
- preserves the real-human differentiator.

Costs and risks:

- scenario craft becomes a core competency;
- fictional dilemmas require careful moral and cultural review;
- consequence rules can be mistaken for judgment;
- visual/story ambition can overwhelm the three-minute interaction;
- the engine could become speculative if future features are implemented too early.

## Guardrails

- Story earns attention; human perspective supplies the social insight.
- AI characters are always identified as fictional.
- V1 consequences are bounded and versioned, not open generative simulation.
- The product does not assign intelligence, personality, morality, empathy, greed, or
  trustworthiness scores.
- No fabricated players, activity, percentiles, or comparison data.
- Every new format must reuse the Arena Engine and durable interaction loop.

## Alternatives rejected

- **Abstract daily policy question:** clear reasoning value but insufficient consumer emotion.
- **Netflix of unrelated AI games:** high novelty with weak product identity and costly content
  fragmentation.
- **Live Mind Duel first:** comparison and energy, but cold-start, safety, and winner incentives are
  premature.
- **Solo AI story first:** compelling entertainment but fails to validate the human-perspective
  advantage.

## Review trigger

Review after manual Mars Rescue tests if the story creates curiosity but real human perspective does
not add a distinct remembered benefit, or if the three-minute experience cannot contain situation,
exchange, consequence, and reflection without feeling rushed.

