# Shared testing support

Owns reusable deterministic clocks, fakes, fixture builders, and accessibility or viewport test
helpers that must be importable by multiple test suites. Product behavior and test-only secrets do
not belong here. Prefer the `test/` tree when production-library visibility is unnecessary.
