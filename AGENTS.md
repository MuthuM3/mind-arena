# Mind Arena Working Agreement

This file governs human and AI contributions to the repository.

## Authority order

When sources conflict, use this order:

1. The human product owner
2. `AGENTS.md`
3. `docs/product/vision.md`
4. `docs/product/v1-product-requirements.md`
5. `docs/status/product-execution-program.md`
6. Architecture, safety, design, and operating documents
7. Task-specific implementation packets

Record durable changes to product scope or architecture under `docs/decisions/`.

## Product invariants

- Mind Arena exists to improve human-to-human thinking.
- AI facilitates, structures, connects, and reflects; it does not replace participants.
- V1 is Today’s Arena: one asynchronous, story-driven, three-minute shared challenge.
- Perspective Sprint is the internal interaction grammar, not the consumer product.
- The daily emotional promise is surprising perspective: “I never thought about it that way.”
- AI runs the situation and facilitates; real people remain the source of social perspective.
- Every valuable V1 session contains perspectives from real people.
- Users commit independently before seeing others to reduce conformity.
- The product rewards curiosity, contribution, and revision—not winning or popularity.
- AI never assigns intelligence, personality, or moral-worth scores.
- Human perspectives remain human-authored and visibly attributed at the appropriate privacy level.
- The interface is structured around thought objects and turns, not a group-chat transcript.
- Product language sells better thinking together, never model brands.
- Live random matching, voice, public profiles, unrestricted user-generated scenarios, and a catalog
  of unrelated game mechanics are outside V1.
- V1 is adults-only; minor-capable modes require a separately approved safeguarding launch.
- Age eligibility controls social access; accessibility preferences never infer ability from age.
- Adult and minor social pools must remain structurally isolated.

## Safety and trust invariants

- V1 topics are curated and low-risk.
- Private-by-default identity is pseudonymous inside an arena.
- No direct messages, follower graph, location sharing, or contact discovery in V1.
- No participant can send unrestricted text directly to another without moderation and structure.
- Unknown or unverified eligibility cannot enter a social perspective pool.
- Blocking, reporting, leaving, and content removal are core-path behaviors.
- AI output is labeled, rejectable, and never presented as objective judgment.
- Privacy claims must match verified network, storage, and provider behavior.
- Raw contributions never enter analytics, crash reports, or ordinary logs.

## Delivery rules

- Work on one user-observable vertical slice at a time.
- Validate the human interaction before automating it with AI.
- Do not add a service, database, queue, model, or abstraction without a current milestone need.
- Prefer a modular monolith and explicit contracts over premature microservices.
- Every AI behavior requires a deterministic fallback, timeout, evaluation case, and user escape.
- Every social feature requires an abuse case, moderation path, and density/cold-start plan.
- Do not commit credentials, private contributions, moderation exports, or production data.
- Agents may not commit, push, deploy, migrate production data, change billing, or contact users
  without explicit human approval.

## Definition of done

A slice is done only when:

- acceptance criteria pass;
- loading, empty-pool, offline, timeout, abandonment, and error states are considered;
- abuse and privacy cases are tested;
- accessibility, focus, contrast, text scaling, and reduced motion are checked;
- analytics needed by the validation plan exist without raw content;
- performance is measured on representative devices;
- relevant authority documents and ADRs are updated;
- the owner can inspect and run the result locally.
