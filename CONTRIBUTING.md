# Contributing to Spectral Frequency

Spectral Frequency 1.0 is under active stabilization. Contributions should preserve its established mechanics, terminology, lore boundaries, and compatibility target.

## Branch model

- `main` — release-approved public source
- `develop/1.0-stabilization` — current integration branch
- `archive/beta-13` — preserved historical Beta source
- Focused branches — individual features, fixes, balance passes, or documentation updates

Create branches from the current integration branch unless a maintainer specifies otherwise.

Examples:

```text
fix/evidence-negative-discovery
feature/document-archive
balance/containment-aggressive-fragments
docs/1.0-release-audit
resource-pack/tool-models
```

## Commit messages

Use focused, descriptive commits:

```text
fix(hunts): isolate sight checks to case participants
feat(bench): add transactional barrel crafting
docs(ledger): record scheduler hardening
balance(memory): reduce ambient pressure cadence
```

Avoid messages such as `updates`, `stuff`, `final fix`, or `maintenance`.

## Pull requests

A pull request should explain:

- Purpose
- Player-facing changes
- Technical changes
- Persistent-data or migration impact
- Tests completed
- Known follow-ups
- Documentation impact

Do not combine unrelated systems into one pull request unless they form one atomic migration.

## Compatibility

The current development target is:

- Minecraft Java 26.2
- Data-pack format 107.1
- Namespace `sf`

Do not introduce syntax from a later Minecraft version without an approved target-change decision.

## Persistent data

Changes to scoreboards or storage must:

1. Provide defaults
2. Backfill existing players safely
3. Preserve permanent progression
4. Remain idempotent across `/reload`
5. Update `docs/development/SCHEMA_MIGRATIONS.md`
6. Add or update regression tests

## Testing expectations

At minimum, relevant work should be tested for:

- Parser/load errors
- Clean installation
- Existing-world migration when applicable
- Repeated `/reload`
- Reconnect behavior
- Single-player behavior
- Multiplayer behavior when the system can affect multiple players
- Case teardown and failure recovery

A parsing success alone is not an in-game test.

## Documentation tracking

Every meaningful implementation batch should update:

- `docs/development/1.0_STABILIZATION_LEDGER.md`
- `docs/development/REGRESSION_MATRIX.md`
- `docs/development/KNOWN_ISSUES.md` when applicable
- `docs/development/DECISION_LOG.md` for architectural decisions
- `docs/development/SCHEMA_MIGRATIONS.md` for persistent-data changes
- `CHANGELOG.md` for player-facing changes

## Lore and spoilers

Project UMBRA is fictional; Nexus Labs is the developer.

Do not expose Black Archive material casually in issue titles, pull-request titles, screenshots, or public summaries. The Forgotten and finale truths follow the project's established spoiler tiers.

## Generated and packaged files

Do not commit:

- World saves
- Server logs
- Crash reports
- Test-output folders
- Release ZIPs inside the source tree
- Obsolete embedded datapack archives
- IDE-specific temporary files

The release package must open directly to `pack.mcmeta` and `data/`.
