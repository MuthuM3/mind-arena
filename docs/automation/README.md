# Agentflow Automation Runbook

Mind Arena uses Agentflow to coordinate:

- Codex for product/technical planning and final review;
- Antigravity for bounded implementation;
- deterministic project verification;
- persisted run state, evidence, correction rounds, and recovery.

The flow never commits, pushes, merges, deploys, reads credentials, or changes product authority.
Successful runs stop at `READY_FOR_COMMIT` for human inspection.

## Project configuration

- `.agentflow/project.json` defines commands, limits, protected paths, and approval boundaries.
- `.agentflow/knowledge/project-map.json` routes planning to product authority.
- `.agentflow/antigravity-settings.example.json` records the project security profile.
- `scripts/verify-docs.mjs` is the current deterministic documentation check.
- `scripts/agentflow` invokes the installed/sibling Agentflow binary with the correct project root.

When Flutter and Go are introduced, extend verification with focused test, lint, analysis, and build
commands. Do not remove documentation verification.

## Protected authority

Implementation runs cannot change:

- `AGENTS.md`;
- Agentflow configuration/security settings;
- product vision, V1 PRD, Arena Engine, and age-adaptive boundary;
- community safety and AI/privacy policy;
- active execution program;
- decision framework and ADRs;
- Git internals, environment files, secrets, and production deployment paths.

Changes to those files are product/governance work handled directly by the owner and Codex, outside
an implementation run.

## Before the first run

Agentflow requires a clean Git baseline. The owner must inspect and commit the product foundation
and automation configuration before running a task.

Doctor:

```bash
scripts/agentflow doctor
```

Verification:

```bash
node scripts/verify-docs.mjs
```

## Write one bounded task

Copy the template:

```bash
cp docs/automation/task-template.md .agent-task.md
```

One task should implement one coherent vertical slice. It must not ask the implementation agent to
redesign product strategy, moderation policy, privacy boundaries, or the whole application.

Good task:

> Create the static invitation and private-commitment prototype states from the approved storyboard,
> including reduced-motion behavior and component tests.

Bad task:

> Build Mind Arena.

## Run

```bash
scripts/agentflow run .agent-task.md
```

Agentflow will refuse a dirty worktree unless deliberate recovery uses `--allow-dirty`. Prefer a
clean task branch.

## Observe

```bash
scripts/agentflow status
scripts/agentflow watch
scripts/agentflow dashboard
```

The dashboard is read-only and binds to `127.0.0.1:7331`.

## Recover

```bash
scripts/agentflow last
scripts/agentflow resume
scripts/agentflow report
```

Resume only when the working tree still represents the run’s expected state. Agentflow fingerprints
the tree and rejects unsafe artifact reuse.

## Completion

At `READY_FOR_COMMIT`:

1. inspect the final report and actual diff;
2. run any device/browser/environment checks unavailable to the sandbox;
3. confirm no product-authority or protected path changed;
4. decide whether to commit;
5. publish or deploy only through a separately approved process.
