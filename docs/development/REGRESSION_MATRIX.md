# Spectral Frequency 1.0 Regression Matrix

Use this matrix for release-candidate testing. A parser success is not a gameplay pass.

## Environment columns

- **SP** — clean single-player world
- **MP** — clean multiplayer server
- **Upgrade** — existing pre-schema or earlier 1.0 development world
- **Reload** — repeated `/reload`
- **Reconnect** — disconnect and rejoin

| ID | Workflow | SP | MP | Upgrade | Reload | Reconnect | Current status |
|---|---|---:|---:|---:|---:|---:|---|
| REG-001 | Fresh install initializes exactly once | ☐ | ☐ | N/A | ☐ | ☐ | Pending formal pass |
| REG-002 | Existing profile migrates without progress loss | N/A | N/A | ☐ | ☐ | ☐ | Pending formal pass |
| REG-003 | New player onboarding occurs once | ☐ | ☐ | N/A | ☐ | ☐ | Pending formal pass |
| REG-004 | Memory bossbar allocation remains unique | ☐ | ☐ | ☐ | ☐ | ☐ | Previously tested |
| REG-005 | Field Radio requests and stores an assignment | ☐ | ☐ | ☐ | ☐ | ☐ | Previously tested |
| REG-006 | Two players retain independent pending signals | N/A | ☐ | ☐ | ☐ | ☐ | Previously tested |
| REG-007 | Pending signal suspends during another live case | ☐ | ☐ | ☐ | ☐ | ☐ | Previously tested |
| REG-008 | Tutorial queues instead of replacing a live case | ☐ | ☐ | ☐ | ☐ | ☐ | Previously tested |
| REG-009 | Standard case enrolls only eligible investigators | N/A | ☐ | ☐ | ☐ | ☐ | Needs formal multiplayer pass |
| REG-010 | Outsider is excluded from Hunt targeting | N/A | ☐ | ☐ | ☐ | ☐ | Needs formal multiplayer pass |
| REG-011 | Hunt survival credit goes only to participants | N/A | ☐ | ☐ | ☐ | ☐ | Needs formal multiplayer pass |
| REG-012 | Positive evidence is shared across participants | N/A | ☐ | ☐ | ☐ | ☐ | Needs formal multiplayer pass |
| REG-013 | Lifetime evidence remains personal | N/A | ☐ | ☐ | ☐ | ☐ | Needs formal multiplayer pass |
| REG-014 | Negative evidence never grants lifetime discovery | ☐ | ☐ | ☐ | ☐ | ☐ | Needs full evidence pass |
| REG-015 | Outsider evidence tools are rejected | N/A | ☐ | ☐ | ☐ | ☐ | Needs formal multiplayer pass |
| REG-016 | Writing channel breaks when item is switched | ☐ | ☐ | ☐ | N/A | N/A | Pending |
| REG-017 | Writing channel clears on case end/disconnect | ☐ | ☐ | ☐ | ☐ | ☐ | Pending |
| REG-018 | Journal never shows stale case evidence | ☐ | ☐ | ☐ | ☐ | ☐ | Pending |
| REG-019 | Tutorial containment costs exactly seven Memory | ☐ | ☐ | ☐ | ☐ | ☐ | Previously tested |
| REG-020 | Standard containment remains possible for all fragments | ☐ | ☐ | ☐ | ☐ | ☐ | Balance audit pending |
| REG-021 | Unique Reconstruction fragment increments once | ☐ | ☐ | ☐ | ☐ | ☐ | Previously tested |
| REG-022 | Duplicate Reconstruction fragment does not increment | ☐ | ☐ | ☐ | ☐ | ☐ | Previously tested |
| REG-023 | Three-fragment Totem milestone grants once | ☐ | ☐ | ☐ | ☐ | ☐ | Previously tested |
| REG-024 | Twelve-fragment completion activates safely | ☐ | ☐ | ☐ | ☐ | ☐ | Do not test in primary world |
| REG-025 | Taken player leaves one authoritative Remnant | ☐ | ☐ | ☐ | ☐ | ☐ | Previously tested |
| REG-026 | Correct owner is restored by Remnant ritual | N/A | ☐ | ☐ | ☐ | ☐ | Previously tested |
| REG-027 | Revival interruption resets progress | N/A | ☐ | ☐ | N/A | ☐ | Previously tested |
| REG-028 | Revival cannot reduce rescuer Memory to zero | N/A | ☐ | ☐ | ☐ | ☐ | Previously tested |
| REG-029 | Offline owner preserves Remnant | N/A | ☐ | ☐ | ☐ | ☐ | Previously tested |
| REG-030 | Taken participant reconnects while case remains active | N/A | ☐ | ☐ | ☐ | ☐ | Lifecycle pass required |
| REG-031 | Stale Taken player restores after case closes | ☐ | ☐ | ☐ | ☐ | ☐ | Lifecycle pass required |
| REG-032 | Bench crafts selected recipe only | ☐ | ☐ | ☐ | ☐ | N/A | Previously tested |
| REG-033 | Bench counts combined and split stacks correctly | ☐ | ☐ | ☐ | ☐ | N/A | Previously tested |
| REG-034 | Bench never consumes player-inventory materials | ☐ | ☐ | ☐ | ☐ | N/A | Previously tested |
| REG-035 | Bench preserves unrelated barrel contents | ☐ | ☐ | ☐ | ☐ | N/A | Previously tested |
| REG-036 | Plain Amethyst and Veil Shard remain distinct | ☐ | ☐ | ☐ | ☐ | N/A | Previously tested |
| REG-037 | Restricted Bench formulas enforce authorization | ☐ | ☐ | ☐ | ☐ | ☐ | Previously tested |
| REG-038 | Formula unlock records remain unique | ☐ | ☐ | ☐ | ☐ | ☐ | Previously tested |
| REG-039 | First emergency recovery consumes one claim | ☐ | ☐ | ☐ | ☐ | ☐ | Previously tested |
| REG-040 | Complete kit consumes no claim and creates no duplicates | ☐ | ☐ | ☐ | ☐ | ☐ | Previously tested |
| REG-041 | Access equipment reissues without claim consumption | ☐ | ☐ | ☐ | ☐ | ☐ | Previously tested |
| REG-042 | Requisition claims remain exhausted after reload/reconnect | ☐ | ☐ | ☐ | ☐ | ☐ | Previously tested |
| REG-043 | Schema 100 initializes on a clean world | ☐ | ☐ | N/A | ☐ | ☐ | Pending clean-world pass |
| REG-044 | Legacy-to-100 migration runs once | N/A | N/A | ☐ | ☐ | ☐ | Pending migration fixture |
| REG-045 | Fast loop heartbeat remains current | ☐ | ☐ | ☐ | ☐ | ☐ | Tested |
| REG-046 | One-second loop heartbeat remains current | ☐ | ☐ | ☐ | ☐ | ☐ | Tested |
| REG-047 | Five-second loop heartbeat remains current | ☐ | ☐ | ☐ | ☐ | ☐ | Tested |
| REG-048 | Thirty-second loop self-reschedules indefinitely | ☐ | ☐ | ☐ | ☐ | ☐ | Tested after wrapper fix |
| REG-049 | Soft uninstall preserves progression and equipment | ☐ | ☐ | ☐ | ☐ | ☐ | Previously tested |
| REG-050 | Re-enable restores runtime exactly once | ☐ | ☐ | ☐ | ☐ | ☐ | Previously tested |
| REG-051 | Health report detects stale runtime state | ☐ | ☐ | ☐ | ☐ | ☐ | Tested |
| REG-052 | Recovered Document duplicate protection | ☐ | ☐ | ☐ | ☐ | ☐ | Not implemented |
| REG-053 | Recovered Document archive persists | ☐ | ☐ | ☐ | ☐ | ☐ | Not implemented |
| REG-054 | Finale affects intended witnesses only | ☐ | ☐ | ☐ | ☐ | ☐ | Not stabilized |
| REG-055 | Every finale branch cleans up safely | ☐ | ☐ | ☐ | ☐ | ☐ | Not stabilized |
| REG-056 | Guarded full purge removes only explicitly selected data | ☐ | ☐ | ☐ | ☐ | ☐ | Not implemented |

## Release-candidate test worlds

Keep disposable fixtures for:

1. Fresh single-player installation
2. Fresh two-player server installation
3. Existing Beta or pre-schema migration
4. Mid-progression 1.0 profile migration
5. Twelve-fragment/finale testing
6. Soft-uninstall and full-purge testing

Never run destructive purge or forced finale tests in the primary development world.
