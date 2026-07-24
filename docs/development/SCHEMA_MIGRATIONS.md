# Spectral Frequency Schema Migrations

This document records persistent storage, scoreboard, migration, and compatibility changes.

## Rules

1. Never silently reset permanent player progress.
2. Every persistent field must have a default and migration path.
3. `/reload` must remain idempotent.
4. Existing-world migration must be tested separately from clean installation.
5. A schema number changes only when persistent data compatibility changes.
6. Runtime-only scoreboards still require backfill for existing players.

---

## Pre-schema development builds

Earlier builds used `sf:config.initialized` as a loose installation marker but did not expose an explicit schema version.

### Migration source

- Existing development worlds with `sf:config.initialized`
- No `sf:system.schema`

### Migration destination

Schema 100.

---

## Schema 100 — 1.0 stabilization baseline

### System storage

```snbt
sf:system {
  version: "1.0",
  build: "stabilization",
  schema: 100,
  enabled: true,
  purged: false
}
```

### Case storage baseline

At minimum:

```snbt
sf:case {
  state: "inactive"
}
```

An active case may additionally store:

```snbt
{
  state: "active",
  owner: [I; ...],
  dimension: "minecraft:overworld",
  spawn: [I; x, y, z]
}
```

### Player-profile baseline

```snbt
sf:player_data {
  entries: [
    {
      uuid: [I; ...],
      profile_schema: 100,
      shards: [],
      quest: 0,
      unlocked: [],
      requisition: {
        claims_used: 0
      }
    }
  ]
}
```

Signal data may coexist in each player's existing record and must not be overwritten by profile migration.

### Added or formalized objectives

#### Bench and requisition

- `sf.bench_menu`
- `sf.req_used`

#### Session tracking

- `sf.leave_now` using `minecraft.custom:minecraft.leave_game`
- `sf.leave_seen`

#### Existing runtime objectives

Schema 100 fresh installation creates and backfills the complete objective set used by Memory, cases, Hunts, evidence, tools, quests, Reconstruction, signals, requisition, Bench crafting, and finale groundwork.

### Migration markers retained in configuration

```snbt
sf:config {
  bench_catalog_v1: true,
  requisition_claims_v1: true
}
```

These prevent older one-time objective-creation paths from running again.

### Preservation guarantees

Migration to schema 100 must not reset:

- Quest step
- Reconstruction fragment list or count
- Bench formula unlocks
- Lifetime evidence discoveries
- Requisition claims used
- Persistent Field Radio signal
- Advancements
- Player-owned equipment

### Transient state cleared on reconnect or invalid ownership

- Tool reading timers
- Writing channel
- Containment channel
- Actionbar/HUD helper tags
- Temporary resolver state
- Stale revival channel state
- Case-local state for nonparticipants

### Taken-state rule

A Taken state is valid only when:

1. `sf:case.state` is `active`, and
2. the player is an enrolled case participant.

Otherwise the lifecycle repair path restores the player safely.

### Runtime enable state

Soft uninstall sets:

```snbt
sf:system.enabled = false
```

Re-enabling restores runtime scheduling and player attachment without deleting permanent data.

### Pending schema-101 candidates

Do not increment the schema until implementation is finalized. Likely candidates include:

- Persistent Recovered Documents archive
- Duplicate-protected document identifiers
- Explicit finale witness/ending state
- Guarded purge metadata or purge confirmation state
- Future resource-pack capability/version handshake, if persistent

When schema 101 is introduced, add:

- Exact source schemas accepted
- New fields and defaults
- Migration functions
- Preservation guarantees
- Downgrade limitations
- Clean-world and existing-world test evidence
