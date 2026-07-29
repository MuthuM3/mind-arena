# ADR-0004: Asynchronous Perspective Sprint for V1

**Status:** Accepted as the internal V1 interaction grammar; consumer framing refined by ADR-0005

**Date:** 2026-07-29

## Context

Live small-group rooms express the long-term vision but require simultaneous density, waiting,
dropout handling, real-time moderation, and substantial infrastructure. A solo experience would
avoid those problems but fail to test the collaboration thesis.

## Decision

V1 is an asynchronous three-minute Perspective Sprint:

1. commit privately;
2. consent a perspective to a bounded pool;
3. encounter two contrasting eligible human perspectives;
4. Build, Challenge, or Question one;
5. reconsider;
6. view a Mind Shift.

Perspective supply is seeded through invited cohorts. Editorial or AI fallbacks are labeled and do
not count as human exchange.

## Consequences

Positive:

- validates real human value without simultaneous attendance;
- allows pre-publication moderation;
- lets one contribution help multiple bounded exchanges;
- builds the content/perspective network needed for live rooms;
- permits simpler HTTPS architecture.

Trade-offs:

- reciprocity is delayed;
- it may feel less emotionally alive than synchronous conversation;
- consent and retention are more complex because contributions persist;
- notification quality matters;
- careful copy is required to avoid implying live presence.

## Alternatives rejected

- **Random live rooms:** cold-start and safety risk too high for V1.
- **Invite-only live rooms as the whole V1:** scheduling undermines the daily habit.
- **AI-generated participant pool:** deceptive and contradicts the product thesis.
- **Public comment thread:** loses structured turns and bounded exposure.

## Review trigger

After repeated concierge cohorts, review if asynchronous exchanges are useful but consistently fail
to create a sense of reciprocity or human connection. Test concierge live rooms before changing
technical architecture.
