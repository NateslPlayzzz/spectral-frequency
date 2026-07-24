# Spectral Frequency

**A paranormal-investigation datapack for Minecraft Java 26.2.**

*Detect. Identify. Contain. Remember.*

> **Development status:** Spectral Frequency 1.0 is currently undergoing stabilization and release-quality auditing. The `develop/1.0-stabilization` branch is not yet a public release build.

[![Minecraft](https://img.shields.io/badge/Minecraft%20Java-26.2-5A9B45)](https://www.minecraft.net/)
[![Release](https://img.shields.io/badge/Release-1.0%20Unreleased-7A5CFF)](CHANGELOG.md)
[![License](https://img.shields.io/badge/License-MIT-blue)](LICENSE)

## Overview

Spectral Frequency turns a Minecraft world into a structured paranormal-investigation experience inspired by the tension and deduction of ghost-hunting games while building its own mechanics, mythology, progression, and finale.

Investigators receive field assignments, locate manifestations, collect evidence, survive Hunts, manage their Memory, contain hostile fragments, and reconstruct what Project UMBRA attempted to erase.

## Current 1.0 feature set

- **12 standard ghost fragments**, each with distinct evidence and behavioral traits
- **The Forgotten**, a classified thirteenth manifestation tied to the finale
- **Six evidence types** used to identify active manifestations
- **Field Radio assignments** with persistent per-player signals
- **Memory and coherence**, replacing the older sanity/exposure design
- **Participant-aware multiplayer investigations**
- **Hunts, containment, Taken states, and deliberate Remnant revival**
- **Fragment Reconstruction** with persistent individual progression
- **Attuned Bench fabrication** and controlled equipment recovery
- **Project UMBRA narrative content**, recovered documents, and branching endgame structure
- **Reload-safe persistence**, migration support, diagnostics, and soft uninstall controls

## Development target

| Component | Target |
|---|---|
| Minecraft | Java Edition 26.2 |
| Data-pack format | 107.1 |
| Namespace | `sf` |
| Public release | Spectral Frequency 1.0 |

## Installation

There is no approved public 1.0 release package yet. Development builds should be used only for testing.

When a release candidate is approved, its ZIP will contain the datapack directly at archive root:

```text
pack.mcmeta
data/
```

The release ZIP will be placed in a world's `datapacks` directory and loaded by restarting the world or running `/reload`.

## Repository branches

- `main` — historical public Beta baseline until 1.0 is release-approved
- `archive/beta-13` — preserved final Beta-era source
- `develop/1.0-stabilization` — authoritative 1.0 development integration branch

Feature and repair work should use focused branches and merge into the development branch only after testing.

## Development documentation

Internal release tracking lives under [`docs/development`](docs/development/):

- [1.0 Stabilization Ledger](docs/development/1.0_STABILIZATION_LEDGER.md)
- [Regression Matrix](docs/development/REGRESSION_MATRIX.md)
- [Decision Log](docs/development/DECISION_LOG.md)
- [Schema Migrations](docs/development/SCHEMA_MIGRATIONS.md)
- [Known Issues](docs/development/KNOWN_ISSUES.md)
- [1.0 Release Checklist](docs/development/RELEASE_CHECKLIST_1.0.md)

## Administrative diagnostics

Development builds include:

```mcfunction
/function sf:dev/health
```

This reports runtime versioning, schema state, scheduled-loop heartbeats, active-case consistency, loaded manifestations, Remnants, Bench markers, pending signals, and suspicious stale state.

## Documentation and community

- [Spectral Frequency Wiki](https://spectral-frequency.fandom.com/)
- [Modrinth](https://modrinth.com/datapack/spectral-frequency)
- [CurseForge](https://www.curseforge.com/minecraft/data-packs/spectral-frequency)
- [Planet Minecraft](https://www.planetminecraft.com/data-pack/spectral-frequency/)
- [Discord](https://discord.gg/nexuslabs)

Bug reports and proposals should be filed through this repository's Issues page. Do not include unreleased Black Archive spoilers in public issue titles.

## License

Spectral Frequency is distributed under the [MIT License](LICENSE).

---

*The Veil is thinning. Something remembers you.*
