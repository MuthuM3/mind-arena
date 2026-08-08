# Product Hypothesis and Validation Contract

## Purpose

This document establishes the measurable M1.5 validation contract for Mind Arena. It defines the hypothesis hierarchy, Meaningful Perspective Exchange (MPE) criteria, evidence matrix, and decision outcome rules.

## Authority and Derivation

Documents in `docs/experience/` organize implementation-facing experience specifications. They do not supersede existing approved authority documents.

This specification is derived from and grounded in:
- [`docs/product/vision.md`](../product/vision.md)
- [`docs/product/v1-product-requirements.md`](../product/v1-product-requirements.md)
- [`docs/research/m1.5-research-protocol.md`](../research/m1.5-research-protocol.md)

When content conflicts, repository authority documents prevail.

## Core Hypothesis

When a person privately commits to a position,
then encounters contrasting human perspectives
through a structured three-minute experience,
they can discover, clarify, reinforce, or reconsider
part of their thinking.

## Hypothesis Hierarchy

- **H1 — Asynchronous Human-to-Human Understanding:** Participants understand that Today's Arena is asynchronous, non-live, and powered by authentic human reasoning.
- **H2 — Independent Commitment:** Making an independent private choice before social exposure creates ownership and makes subsequent perspective reading more meaningful.
- **H3 — Useful Perspective Contrast:** Encountering a contrasting human perspective introduces a specific new consideration that the participant would not have generated alone.
- **H4 — Structured Contribution:** Contributing via Build, Challenge, or Question feels safer, clearer, and more constructive than freeform comment replies.
- **H5 — Trust and Provenance:** Participants accurately distinguish human, editorial demonstration, and facilitator content, maintaining trust in privacy boundaries.
- **H6 — Legitimate Keep/Refine/Change Outcomes:** Keeping, refining, and changing an initial position all feel equally legitimate, with zero system pressure to alter views.
- **H7 — Faithful Mind Shift:** The deterministic Mind Shift reflection is recognized as faithful, non-judgmental, source-linked, and worth saving or discussing.
- **H8 — Voluntary Return Intent:** The 3-minute shared reflection earns voluntary return intent for daily Arena challenges without forced gamification or viral mechanics.

## Meaningful Perspective Exchange (MPE)

A completed session qualifies as a **Meaningful Perspective Exchange (MPE)** if and only if all five conditions are satisfied:

1. **Independent commitment:** The participant recorded an independent private choice in TA-03 prior to exposure to other perspectives.
2. **Real human perspectives:** Exactly two eligible real human perspectives were presented in TA-04.
3. **Structured engagement:** The participant engaged one perspective using an approved action mode (Build, Challenge, or Question) in TA-05.
4. **Source-linked reflection:** The final Mind Shift reflection accurately includes that engaged human source relationship in TA-07.
5. **Clean safety state:** Zero unresolved consent, provenance, privacy, or safety failures invalidated the session.

> [!IMPORTANT]
> **Provenance Boundary:** Sessions completed via editorial demonstration cards or AI-generated examples are explicitly flagged as editorial-provenance and **MUST NEVER** count as MPEs.

## Evidence Matrix

Every hypothesis maps directly to observable behaviors, research questions, study measures, approved protocol thresholds, and invalidating conditions established in [`docs/research/m1.5-research-protocol.md`](../research/m1.5-research-protocol.md):

| Hypothesis | Observable Behavior | Research Question | Measure | Approved Threshold | Invalidating Conditions |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **H1 — Asynchronous H2H** | Accurately describes product as asynchronous & human-sourced | "What did you think Mind Arena was after the invitation?" | Round A Gate 1 | **>= 7 of 10** participants | Repeated live presence or chatbot misunderstanding |
| **H2 — Independent Commitment** | Makes & commits private choice in TA-03 before seeing others | "Who did you believe could see each thing you wrote?" | Round B Task 3 | **No standalone threshold approved** | Premature exposure to perspective cards before commitment |
| **H3 — Useful Contrast** | Describes human card as useful & names specific new thought | "What thought, if any, did another person introduce that you had not considered?" | Round B Gate 2 & Gate 3 | Gate 2: **>= 60%** rate useful;<br>Gate 3: **>= 50%** name new thought | Perspectives perceived as extreme, hostile, or disproven |
| **H4 — Structured Action** | Creates substantive Build, Challenge, or Question response | "What did you contribute to their reasoning?" | Round B Gate 4 | **>= 50%** submit substantive response | Response field left blank or filled with nonsense |
| **H5 — Provenance & Trust** | Distinguishes human vs editorial vs system content accurately | "Which parts came from another person, system, or editors?" | Round A Gate 2 / Round B Gate 5 | Round A: **>= 8 of 10**;<br>Round B: **>= 80%** accuracy | Misidentifying editorial/AI as human >= 3 times |
| **H6 — Legitimate Outcomes** | Chooses Keep, Refine, or Change without feeling system pressure | "Did any part pressure you to agree, change, perform, or appear intelligent?" | Interview Q6 & outcome distribution analysis | **No standalone threshold approved** | System pressure or reward for changing over keeping |
| **H7 — Faithful Mind Shift** | Reviews and accepts/corrects deterministic Mind Shift reflection | "Did the Mind Shift describe the session faithfully? What was wrong or missing?" | Round B Task 9 & Interview Q8 | **No standalone threshold approved** | Mind Shift contains un-sourced or unfaithful claims |
| **H8 — Return Intent** | Voluntarily selects return or next-arena action | "What would make you return for another arena?" | Round B Gate 6 | **>= 33.3% (1/3)** voluntary return action | Zero voluntary return interest |
| **Safety & Privacy** | Zero safety, trust, or logging incidents | Incident & telemetry monitoring | Round B Gate 7 & Gate 8 | **0** trust/safety failures;<br>**0** raw log leaks | Any raw text in logs or privacy consent failure |
| **Accessibility** | Completes flow across compact, medium, and expanded viewports | Task completion under text scale / reduced motion / keyboard | Round B Gate 9 | **0** critical accessibility blockers across **compact (<600px), medium (600–1023px), and expanded (>=1024px)** viewports | Accessibility or viewport resize setting prevents flow completion |

## Decision Outcomes

Following Round A and Round B testing, the product team evaluates findings against five approved decision outcomes:

- **Proceed:** All decision gates pass and participants identify memorable human perspective value.
- **Revise interaction:** Human exchange is useful, but UI scenes, language, pacing, or trust controls cause completion friction.
- **Revise content:** Flow works, but the Mars Rescue scenario/perspectives fail to generate safe, varied reasoning contrast.
- **Revise distribution:** Perspective value appears only inside known communities; test a community-led wedge.
- **Stop expansion:** Multiple well-run research rounds cannot produce distinct human perspective value over solo AI or comment threads.

> [!IMPORTANT]
> **Decision Invariants:**
> 1. **Opinion change is NOT a success metric:** Retaining an initial choice (Keep) is treated with equal dignity to Refining or Changing. Opinion change rate must never be used to evaluate product success.
> 2. **Safety/Trust Gate:** Any single serious trust, privacy, provenance, or safety failure prevents a "Proceed" outcome until resolved and re-tested.
