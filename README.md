# Mind Arena

Mind Arena is an interactive social thinking game where AI creates situations and real people create
the perspectives, choices, and insight.

AI does not replace the conversation. It creates the conditions for a better human conversation.

## Product thesis

Most AI products optimize the path from one person to one answer:

```text
person → AI → answer
```

Mind Arena optimizes the path from a shared situation to collective insight:

```text
interactive situation
   ↓
people with different perspectives
   ↓
AI-guided exchange
   ↓
clearer individual and shared thinking
```

The story creates curiosity. The game mechanics create focus, pace, and comparison. The durable
value is learning to think, communicate, and collaborate better with other people.

## V1

The first product is **Today’s Arena**: one shared three-minute scenario for everyone.

1. Enter a story-driven dilemma and commit before seeing anyone else’s choice.
2. Encounter two contrasting real human perspectives.
3. Build on, challenge, or question one perspective.
4. Reconsider your view.
5. See a compact Mind Shift showing what changed across the group.

V1 is asynchronous, curated, and private-beta first. “Perspective Sprint” is the internal interaction
grammar, not the consumer product name. This preserves human value while avoiding empty live rooms,
unsafe random matching, and real-time infrastructure before the interaction is proven.

## Current phase

The future-aligned product foundation is complete. The next milestone is an experience proof: script
and test the first story-driven Today’s Arena before production implementation begins.

Start with:

1. [Product vision](docs/product/vision.md)
2. [V1 product requirements](docs/product/v1-product-requirements.md)
3. [Market and positioning](docs/product/market-and-positioning.md)
4. [Product execution program](docs/status/product-execution-program.md)
5. [System architecture](docs/architecture/system-architecture.md)
6. [Validation plan](docs/research/validation-plan.md)
7. [Age-adaptive foundation](docs/product/age-adaptive-experience.md)

## Frontend workspace

The setup-only Flutter client lives in [`apps/mind_arena`](apps/mind_arena/README.md). It targets
Android, iOS, web, macOS, Linux, and Windows from one project. Product scenes remain gated by the
M1.4 approvals in the
[frontend architecture guide](docs/frontend/mind_arena_frontend_architecture_implementation_guide.md).
The current technical and experience gates are tracked in the
[implementation readiness ledger](docs/status/implementation-readiness.md).
