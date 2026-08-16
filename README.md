# Spectral Frequency

**A vanilla-native paranormal-investigation datapack for Minecraft Java 26.2.**

*Detect. Identify. Contain. Remember.*

> **Development status:** Spectral Frequency 1.0 is currently undergoing final stabilization, presentation cleanup, and release-quality auditing. It is not yet a public 1.0 release build.

[![Minecraft](https://img.shields.io/badge/Minecraft%20Java-26.2-5A9B45)](https://www.minecraft.net/)
[![Release](https://img.shields.io/badge/Release-1.0%20Unreleased-7A5CFF)](CHANGELOG.md)
[![License](https://img.shields.io/badge/License-MIT-blue)](LICENSE)

## Overview

Spectral Frequency turns a Minecraft world into a structured paranormal-investigation experience inspired by the tension and deduction of ghost-hunting games while building its own mechanics, mythology, progression, and finale.

Investigators receive field assignments, locate manifestations, collect evidence, survive Hunts, manage their Memory, contain hostile fragments, and reconstruct what Project UMBRA attempted to erase.

Spectral Frequency 1.0 is designed as a **datapack-only experience**. No custom resource pack is required.

## Current 1.0 feature set

- **12 standard ghost fragments**, each with distinct evidence and behavioral traits
- **The Forgotten**, a classified thirteenth manifestation tied to the finale
- **Six evidence types** used to identify active manifestations
- **Field Radio assignments** with persistent personal signals
- **Memory and coherence**, replacing the older sanity/exposure design
- **Hunts, containment, Taken states, and deliberate Remnant revival**
- **Fragment Reconstruction** with persistent individual progression
- **Attuned Bench fabrication** and controlled equipment recovery
- **Project UMBRA narrative content**, recovered documents, and branching endgame structure
- **Vanilla-native equipment presentation** with no required resource pack
- **Reload-safe persistence**, migration support, diagnostics, repair tools, and uninstall controls
- **Optional multiplayer architecture**, experimental in the 1.0 release

## Multiplayer status

Spectral Frequency contains participant-aware multiplayer architecture for investigations, shared case evidence, personal progression, Hunts, containment, Remnant revival, and other systems.

However, **multiplayer is considered experimental in Spectral Frequency 1.0**.

The primary release-certification target for 1.0 is single-player. Multiplayer can be played and feedback is welcome, but multiplayer-specific bugs and unusual edge cases may occur.

If you play in multiplayer:

- Keep a current backup of important worlds.
- Expect that some multiplayer-specific edge cases may not yet be fully tested.
- Report reproducible multiplayer problems through the GitHub issue tracker.
- Include player count, server software, reproduction steps, and whether a disconnect, reconnect, or `/reload` occurred.

A confirmed severe multiplayer defect may still be addressed urgently, but exhaustive multiplayer regression is not required for the 1.0 release.

## Vanilla-native presentation

Spectral Frequency 1.0 does **not** require a custom resource pack.

Custom equipment retains Spectral Frequency names, lore, identity data, and mechanics while using carefully selected vanilla Minecraft item models for presentation.

This keeps installation simple and allows the datapack to remain visually integrated with Minecraft's native style.

## Development target

| Component | Target |
|---|---|
| Minecraft | Java Edition 26.2 |
| Data-pack format | 107.1 |
| Namespace | `sf` |
| Public release | Spectral Frequency 1.0 |
| Resource pack | Not required |
| Primary certified mode | Single-player |
| Multiplayer | Experimental |

## Installation

There is no approved public 1.0 release package yet. Development builds should be used only for testing.

When the release candidate is approved, the ZIP will contain the datapack directly at archive root:

```text
pack.mcmeta
data/
```

Place the release ZIP inside the world's `datapacks` directory.

No separate resource pack installation is required.

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
- [CurseForge](https://www.curseforge.com/minecraft/data-packs/spectral-frequency)
- [Planet Minecraft](https://www.planetminecraft.com/data-pack/spectral-frequency/)
- [Discord](https://discord.gg/nexuslabs)

Bug reports and proposals should be filed through this repository's Issues page. Do not include unreleased Black Archive spoilers in public issue titles.

## License

Spectral Frequency is distributed under the [MIT License](LICENSE).

---

*The Veil is thinning. Something remembers you.*