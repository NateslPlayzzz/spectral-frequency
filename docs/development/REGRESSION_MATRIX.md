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
| REG-001 | Fresh install initializes exactly once | ☑ | ☐ | N/A | ☑ | ☐ | Clean single-player installation and reload passed |
| REG-002 | Existing profile migrates without progress loss | N/A | N/A | ☑ | ☑ | ☑ | Existing development profiles remained intact through schema 102, reload, and reconnect |
| REG-003 | New player onboarding occurs once | ☑ | ☐ | N/A | ☑ | ☐ | Clean onboarding and nonrepetition passed |
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
| REG-014 | Negative evidence never grants lifetime discovery | ☐ | ☐ | ☐ | ☐ | ☐ | Spirit Box negative path passed; remaining evidence types pending |
| REG-015 | Outsider evidence tools are rejected | N/A | ☐ | ☐ | ☐ | ☐ | Needs formal multiplayer pass |
| REG-016 | Writing channel breaks when item is switched | ☐ | ☐ | ☐ | N/A | N/A | Pending |
| REG-017 | Writing channel clears on case end/disconnect | ☐ | ☐ | ☐ | ☐ | ☐ | Pending |
| REG-018 | Journal never shows stale case evidence | ☐ | ☐ | ☐ | ☐ | ☐ | Pending |
| REG-019 | Tutorial containment costs exactly seven Memory | ☑ | ☐ | N/A | ☑ | ☐ | Clean-world tutorial pass completed |
| REG-020 | Standard containment remains possible for all fragments | ☐ | ☐ | ☐ | ☐ | ☐ | Normal and aggressive fixtures tested; full twelve-fragment pass pending |
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
| REG-043 | Schema 102 initializes on a clean world | ☑ | ☐ | N/A | ☑ | ☐ | Clean schema-102 initialization and reload passed |
| REG-044 | Pre-schema-to-100-to-101-to-102 migration chain runs once | N/A | N/A | ☐ | ☐ | ☐ | 101-to-102 tested; complete fixture pending |
| REG-045 | Fast loop heartbeat remains current | ☐ | ☐ | ☐ | ☐ | ☐ | Tested |
| REG-046 | One-second loop heartbeat remains current | ☐ | ☐ | ☐ | ☐ | ☐ | Tested |
| REG-047 | Five-second loop heartbeat remains current | ☐ | ☐ | ☐ | ☐ | ☐ | Tested |
| REG-048 | Thirty-second loop self-reschedules indefinitely | ☐ | ☐ | ☐ | ☐ | ☐ | Tested after wrapper fix |
| REG-049 | Soft uninstall preserves progression and equipment | ☐ | ☐ | ☐ | ☐ | ☐ | Previously tested |
| REG-050 | Re-enable restores runtime exactly once | ☐ | ☐ | ☐ | ☐ | ☐ | Previously tested |
| REG-051 | Health report detects stale runtime state | ☐ | ☐ | ☐ | ☐ | ☐ | Standard, containment, and finale diagnostics tested |
| REG-052 | Recovered Document duplicate protection | ☐ | ☐ | ☐ | ☐ | ☐ | Shallow classification tested; restricted and deep pools pending |
| REG-053 | Recovered Document archive persists | ☐ | ☐ | ☐ | ☐ | ☐ | Single-player reload persistence tested |
| REG-054 | Finale affects intended witnesses only | ☐ | ☐ | ☐ | ☐ | ☐ | UUID authority implemented; multiplayer branch pending |
| REG-055 | Every finale branch cleans up safely | ☑ | ☐ | ☑ | ☑ | ☑ | Protocol and Vigil completed with stable cleanup in single-player |
| REG-056 | Guarded full purge removes only explicitly selected data | ☑ | ☐ | N/A | ☑ | N/A | Destructive single-player purge and tombstone cycle passed |
| REG-057 | Clean reinstall rebuilds schema 102 exactly once | ☑ | ☐ | N/A | ☑ | ☐ | Explicit reinstall and reload idempotence passed |
| REG-058 | Optional purge gear removal handles online and returning offline players | ☐ | ☐ | ☐ | ☐ | ☐ | Implemented; explicit gear-removal and offline-return paths pending |
| REG-059 | Individual player repair preserves permanent progression | ☐ | ☐ | ☐ | ☐ | ☐ | Tested in single-player |
| REG-060 | Online-player bulk repair preserves independent profiles | N/A | ☐ | ☐ | ☐ | ☐ | Single-player path tested; multiplayer pending |
| REG-061 | Memory bossbar repair restores ownership, visibility, and value | ☐ | ☐ | ☐ | ☐ | ☐ | Tested after visibility fix |
| REG-062 | Scheduler repair permanently restores all recurring loops | ☐ | ☐ | ☐ | ☐ | ☐ | Thirty-second failure and recovery tested |
| REG-063 | Standard-case repair safely closes an active investigation | ☐ | ☐ | ☐ | ☐ | ☐ | Inactive-case path tested; active case pending |
| REG-064 | Standard-case repair refuses during authoritative finale state | ☐ | ☐ | ☐ | ☐ | ☐ | Storage-authority refusal implemented |
| REG-065 | Physical document copies retain stable custom-data identities | ☐ | ☐ | ☐ | ☐ | ☐ | Documents 1 and 4 tested |
| REG-066 | Lost physical documents can be reissued without changing archive ownership | ☐ | ☐ | ☐ | ☐ | ☐ | Tested in single-player |
| REG-067 | Locked archive triggers cannot bypass ownership | ☐ | ☐ | ☐ | ☐ | ☐ | Tested in single-player |
| REG-068 | Restricted and Black Archive progression gates prevent early spoilers | ☐ | ☐ | ☐ | ☐ | ☐ | Implemented; staged progression pending |
| REG-069 | Finale activation requires deliberate Guidebook confirmation | ☑ | ☐ | ☑ | ☑ | ☑ | Deliberate activation and nonautomatic startup passed |
| REG-070 | Finale authority permits only one stored UUID witness | N/A | ☐ | ☐ | ☐ | ☐ | Stale-tag cleanup tested; multiplayer pending |
| REG-071 | Active finale locks cases, tutorials, Radio assignments, and offers | ☐ | ☐ | ☐ | ☐ | ☐ | `repair_required` lock path tested |
| REG-072 | Pull and threshold remain bound to recorded dimension and location | ☑ | ☐ | ☑ | ☑ | ☑ | Full single-player traversal completed successfully |
| REG-073 | Manifest and Vigil pause safely outside the required area | ☐ | ☐ | ☐ | ☐ | ☐ | Implemented; live phase pending |
| REG-074 | Final choice requires actual view ray and sustained intent | ☑ | ☐ | ☑ | ☑ | ☑ | Actual final-choice interaction passed in both branches |
| REG-075 | Protocol outcome persists only for its witness | ☑ | ☐ | ☑ | ☑ | ☑ | Protocol completed and persisted in the authoritative single-player profile |
| REG-076 | Vigil outcome persists only for its witness | ☑ | ☐ | ☑ | ☑ | ☑ | Vigil completed and persisted in the authoritative single-player profile |
| REG-077 | Finale epilogue survives reload and reconnect | ☑ | ☐ | ☑ | ☑ | ☑ | Completed branch state remained stable through ordinary reload and reconnect use |
| REG-078 | Ending-document ownership and replacement are enforced | ☐ | ☐ | ☐ | ☐ | ☐ | Initial Protocol and Vigil delivery passed; deliberate post-loss replacement remains unverified |
| REG-079 | Finale repair preserves completed outcomes | ☐ | ☐ | ☐ | ☐ | ☐ | Unresolved repair tested; completed outcome pending |
| REG-080 | Finale diagnostics detect repair-required and idle artifacts | ☐ | ☐ | ☐ | ☐ | ☐ | `repair_required` detection tested |
| REG-081 | Finale nonparticipants receive no branch effects or advancements | N/A | ☐ | ☐ | ☐ | ☐ | Architecturally isolated; multiplayer pending |
| REG-082 | Containment verification returns to the activating Investigator | ☐ | ☐ | ☐ | ☐ | ☐ | Single-player path tested; multiplayer ownership pending |
| REG-083 | Only one containment operator and target may exist | ☐ | ☐ | ☐ | ☐ | ☐ | Single-player authority tested; two-player contention pending |
| REG-084 | Incorrect evidence creates no containment authority | ☐ | ☐ | ☐ | ☐ | ☐ | Tested |
| REG-085 | Tutorial containment costs exactly seven Memory after authority rewrite | ☑ | ☐ | N/A | ☑ | ☐ | Post-authority clean-world tutorial pass completed |
| REG-086 | Normal containment has a viable Memory cost | ☐ | ☐ | ☐ | ☐ | ☐ | Tested with Shadow fixture |
| REG-087 | Aggressive containment has a viable Memory cost | ☐ | ☐ | ☐ | ☐ | ☐ | Tested with Banshee fixture |
| REG-088 | Warning or Hunt state blocks and interrupts containment | ☐ | ☐ | ☐ | ☐ | ☐ | Active Hunt interruption tested |
| REG-089 | Item, range, participant, Taken, and zero-Memory conditions interrupt containment | ☐ | ☐ | ☐ | ☐ | ☐ | Implemented; complete condition pass pending |
| REG-090 | Reload cancels containment without closing the active case | ☐ | ☐ | ☐ | ☐ | N/A | Tested |
| REG-091 | Reconnect cancels stale containment authority safely | ☐ | ☐ | ☐ | N/A | ☐ | Implemented; reconnect test pending |
| REG-092 | Every case exit removes containment authority | ☐ | ☐ | ☐ | ☐ | ☐ | Success and manual closure tested; failure and repair pending |
| REG-093 | Containment diagnostics detect stale operators and targets | ☐ | ☐ | ☐ | ☐ | ☐ | Synthetic corruption tested |
| REG-094 | Containment repair preserves the active investigation and progression | ☐ | ☐ | ☐ | ☐ | ☐ | Synthetic repair tested |
| REG-095 | Successful containment resolves only the selected target | ☐ | ☐ | ☐ | ☐ | ☐ | Standard single-target case tested |
| REG-096 | Containment sound and particle feedback avoids hot-loop spam | ☐ | ☐ | ☐ | ☐ | ☐ | Observational single-player pass completed |
| REG-097 | Spirit Box scans only valid nearby manifestations in darkness | ☑ | ☐ | ☐ | ☑ | ☐ | Tutorial response, out-of-range silence, and negative-discovery protection passed |
| REG-098 | Spirit Box silence grants no case or lifetime evidence | ☑ | ☐ | ☐ | ☑ | ☐ | Clean single-player negative path passed |
| REG-099 | Schema-zero purge tombstone blocks automatic reinstall | ☑ | ☐ | N/A | ☑ | N/A | Tombstone survived reload with no runtime reconstruction |
| REG-100 | Default full purge preserves player-owned SF equipment | ☑ | ☐ | N/A | ☑ | N/A | Controlled equipment count remained unchanged |
| REG-101 | Reinstall refuses when the installation is not purged | ☑ | ☐ | N/A | ☑ | N/A | Second reinstall attempt rejected correctly |
| REG-102 | Existing current-development profile survives migration, reload, and reconnect | ☑ | N/A | ☑ | ☑ | ☑ | Repeated ordinary development-world continuity passed |
| REG-103 | Protocol completes from activation through epilogue | ☑ | ☐ | ☑ | ☑ | ☑ | Complete single-player branch passed |
| REG-104 | Vigil completes from activation through epilogue | ☑ | ☐ | ☑ | ☑ | ☑ | Complete single-player branch passed |
| REG-105 | Finale completion removes transient entities, tags, and phase state | ☑ | ☐ | ☑ | ☑ | ☑ | Post-branch cleanup remained healthy |

## Release-candidate test worlds

Keep disposable fixtures for:

1. Fresh single-player installation
2. Fresh two-player server installation
3. Existing Beta or pre-schema migration
4. Mid-progression 1.0 profile migration
5. Twelve-fragment/finale testing
6. Soft-uninstall and full-purge testing

Never run destructive purge or forced finale tests in the primary development world.
