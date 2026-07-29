# ADR-0002: Solo-First Staged Hybrid Architecture

**Status:** Superseded by ADR-0003 and ADR-0004

**Original date:** 2026-07-29

## Original decision

Prototype a solo experience with curated facilitation, then cloud AI, local AI, and finally
multiplayer.

## Why it was superseded

Collaboration is now the core value rather than a later expansion. The product must validate real
human perspective in its first interaction.

This changes technical staging:

- identity, consent, moderation, and a server-owned perspective pool enter earlier;
- live synchronous transport remains later;
- local AI becomes an optional privacy/latency capability rather than the product foundation.

## Preserved learning

- Validate experience before model sophistication.
- Use bounded facilitator contracts and deterministic fallbacks.
- Avoid model-branded positioning.
- Avoid microservices and live infrastructure before evidence.

