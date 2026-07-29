# Arena Engine and Product Formats

## Purpose

Mind Arena should feel capable of becoming a broad interactive world without implementing a
different product architecture for every scenario.

The **Arena Engine** is the durable domain model. V1 implements only the subset required by Today’s
Arena.

## Arena package

Every arena version defines:

- title, premise, and atmosphere;
- duration and release window;
- roles;
- world state;
- public and private information;
- constraints;
- allowed participant actions;
- stage sequence;
- perspective contribution schema;
- AI/editorial/human actor provenance;
- consequence rules;
- facilitation moves;
- completion conditions;
- Mind Shift rules;
- share-card fields;
- content and safety policy;
- audience classification and social-mode eligibility;
- reading complexity, decision complexity, and adaptive presentation assets;
- jurisdiction/cohort restrictions;
- locale and accessibility content;
- version and review owner.

## Engine concepts

### Scenario

The authored situation and its immutable version.

### World state

Facts that can change through actions. V1 uses bounded, deterministic state rather than an open
generative simulation.

### Actor

One of:

- real participant;
- clearly fictional AI character;
- facilitator;
- editorial source;
- system.

Actor provenance is mandatory and visible.

### Audience Profile

The arena declares approved eligibility classes, content intensity, complexity, social mode, and
adaptive assets. Participant eligibility is evaluated before the arena or perspective pool is
served. Adult and minor pools cannot share participants or contributions.

### Role

The participant’s decision position or fictional function inside the scenario. Roles constrain
available information and actions in later formats.

### Stage

A state such as reveal, private choice, other minds, contribution, consequence, final choice, or
Mind Shift.

### Action

A typed event such as Select, Build, Challenge, Question, Connect, Negotiate, Accuse, Allocate, or
Decide. V1 implements only the small approved subset.

### Consequence

A rule-derived or clearly labeled simulated change to world state.

### Replay

A source-linked record of decisions, contributions, consequences, and change. Mind Shift is the
short V1 replay.

## Product formats

### Today’s Arena

- same scenario for everyone;
- asynchronous;
- approximately three minutes;
- private commitment;
- two real human perspectives;
- one structured response;
- bounded consequence;
- final choice and shareable Mind Shift.

### Friend Arena

- shared arena invitation;
- independent hidden commitment;
- reveal after both finish;
- comparison and optional response;
- no live scheduling required.

### Live Arena

- three to five simultaneous participants;
- multiple turns;
- authoritative room state;
- AI facilitation and world operation;
- dropout/reconnect;
- longer replay.

### Purpose Arena

- invited group;
- host-selected template;
- brainstorming, decisions, learning, or negotiation;
- private workspace boundaries;
- shared synthesis;
- organization-specific retention.

### Solo Story Arena

AI characters and world simulation may later create a solo experience. It is an expansion and
content-discovery surface—not a substitute for the core human-perspective network.

## Scenario families

All families must reuse the engine:

- dilemmas and resource allocation;
- mysteries and evidence;
- negotiation;
- survival and crisis simulation;
- creative brainstorming;
- strategy and leadership;
- learning and historical counterfactuals.

A proposed format is rejected if it requires an unrelated scoring, identity, or interaction system
without advancing the durable product loop.

## V1 implementation boundary

Build now:

- versioned scenario package;
- roles and constraints;
- stage state machine;
- typed choices;
- Perspective Sprint;
- deterministic consequence;
- Mind Shift/replay;
- share-card schema.
- adult/unknown eligibility enforcement and audience metadata.

Design for but do not build:

- real-time transport;
- voice;
- hidden role information;
- freeform AI character chat;
- generative world mutation;
- complex inventories or maps;
- branching campaigns;
- organization tenancy.
- minor registration, guardian controls, and teen/child social pools.

## Engine decision rule

We preserve future compatibility through domain concepts and versioned events, not speculative
infrastructure. Every abstraction must serve a current V1 behavior or a clearly recorded evolution
boundary.
