# Changelog

All notable changes to Spectral Frequency will be documented in this file.
## [Beta 13.0] - February 5, 2026
### "Foundation"

#### Added
- **Complete File Restructure** — Entire datapack reorganized from flat files into hierarchical folders
  - `ghost/` — Behavior, spawning, hunts, containment, events
  - `tool/` — Each tool in its own folder
  - `player/` — Sanity, hiding, death, on-join
  - `core/` — Load, tick, scheduled loops, uninstall
  - `evidence/` — Evidence detection systems
  - `world/` — Environmental effects, Veil Tears
  - `ui/` — Help system, player messages
  - `lore/` — Strange Signal messages, narrative content
  - `util/` — Shared utility functions
  - `debug/` — Debug toggle, info display
- **Tiered Performance Loops** — Game logic moved off main tick
  - 1-second loop: Tool detection, evidence checking, sanity updates
  - 5-second loop: Ambient effects, environmental checks
  - 30-second loop: Veil Tear spawning, entity cleanup
  - Tick: Ghost movement, immediate player checks only
- **Research Notes** — 12 unique written books, one per ghost
  - Drops on first containment of each ghost type
  - Pieces together the story of UMBRA and Dr. Silas Thorne
  - Each note is a fragment from a different research case file
- **Corrupted Note** — Mysterious fragment with a chance to drop on any containment
  - Obfuscated text, dark styling
  - Content is... difficult to read
- **Containment Specialist** — Challenge advancement for containing all 12 ghost types
- **Watching Event** — Ghosts observe nearby investigators
  - Unique particles and sound
  - Respects distance and cooldown
- **Debug Mode** — `/function spectral:debug/toggle`
  - Real-time ghost count, hunt status, breach status
  - Player sanity state, exposure, hiding status
  - Active Veil Tears, UV marks, totems
- **Debug Info** — `/function spectral:debug/info` for full game state snapshot
- **Clean Uninstall** — `/function spectral:core/uninstall`
  - Removes all scoreboards, storage, entities, scheduled functions
  - Complete cleanup, no orphaned data

#### Changed
- All 334 functions reorganized across 11 top-level folders
- Tick logic distributed to scheduled intervals (1s/5s/30s)
- Ghost behavior dispatch uses early-return routing
- Evidence checking moved from per-tick to 1-second loop

#### Technical
- 428 total files (functions, advancements, recipes, predicates, loot tables)
- 3 scheduled loops via `schedule function` (self-rescheduling)
- `schedule clear` on load prevents duplicate loops
- Ghost dispatch uses `return run` for efficient tag-based routing
 ---
## Beta 12.0 — "Field Guide" (February 3, 2026)
### Added
- **Investigator's Guidebook** — 25-page comprehensive guide to paranormal investigation (crafted with Book + Amethyst Shard)
- 8 new advancements:
  - Field Guide — Craft the Investigator's Guidebook
  - Motion Detected — Detect a ghost with the Motion Sensor
  - Blink — Witness a Specter teleport
  - Thrown Around — Have items thrown by a Poltergeist
  - Empty Inside — Encounter a Hollow in complete darkness
  - Wail — Hear a Banshee's scream
  - Stare Into the Abyss — Survive an encounter with The Dread (hidden)
  - Afraid of the Dark — Encounter a Mare in darkness

### Fixed
- **CRITICAL:** The Dread now gives correct evidence (EMF, Spirit Box, Freezing) — was incorrectly giving Ghost Writing + UV since Beta 10
- Mare ghost: Fixed missing Marker tag causing visible hitbox, added CustomName, removed erroneous UV evidence tag
- Help menu evidence table completely rebuilt with correct evidence for all 12 ghosts
- Help menu now correctly shows "12 Ghosts · 12 Tools"
- Guidebook recipe corrected in help text (Book + Amethyst Shard)
- All help page numbers corrected to /6

### Changed
- Version strings updated throughout
  
---

## [Beta 11.0] - February 1, 2026
### "Nightmares"

#### Added
- **The Mare** — New HIGH threat ghost
  - Evidence: Spirit Box, Ghost Writing, Freezing
  - Darkness-dependent behavior: speed 20 in dark, speed 8 in light
  - Event chances scale with light level (40% dark / 25% light)
  - Nightmare whispers and dark mist particle effects
  - 16 second containment time with 10% slip chance
- Nightmare system groundwork (ARG — Thorne whispers phase)
- Strange Signals integration

#### Fixed
- **Sanity slot collision** — Multiple players could be assigned the same sanity bossbar slot, causing overlapping tracking and broken sanity display

#### Changed
- Sanity bossbar pool expanded from 8 to 12 slots
- Balance pass across ghost behaviors

#### Technical
- Added Mare ghost files (spawn, hunt, behavior, containment, ambient, events)
- Added Mare evidence tags (spectral.spirit_box_source, spectral.writing_source, spectral.freezing_source)
- Expanded sanity pool: bossbars sanity_9 through sanity_12, display_slot_9-12.mcfunction
- Updated slot assignment logic to prevent collision

---

## [Beta 10.0] - January 26, 2026
### "Veil Torn"

#### Added
- **The Dread** — New EXTREME threat ghost
  - Evidence: EMF, Spirit Box, Freezing
  - Skips breach warning — hunts IMMEDIATELY
  - 28 second containment time with 25% slip chance
  - Loud, thundering footsteps during hunts
- **Motion Sensor** — New detection tool
  - Base item: Tripwire Hook
  - Detects ghost movement in 8-16 block range
  - Color-coded alerts: Green → Yellow → Orange → Red
- **Veil Tears** — Natural ghost spawning system
  - Spontaneous tears appear in Deep Dark biomes
  - 15-second warning sequence before ghost emerges
  - Can spawn ANY ghost, including The Dread
  - Treat as immediate breach situation
- **Death Messages** — Unique messages for each ghost type
  - Color-coded ghost names in death messages
  - 11 unique messages reflecting each ghost's personality

#### Changed
- **Hiding System Overhaul**
  - Now uses sneak_time statistic (crouch to hide)
  - Must be under solid block (2-block ceiling)
  - Removed darkness requirement
  - Shows "👁 Hidden" or "⚠ EXPOSED" during hunts
  - 3-second detection cooldown prevents spam
- Flashlight flicker fixed — 5% chance with 3-second cooldown
- Exposure now properly initializes on player join

#### Fixed
- Hiding detection no longer spams messages
- Ghost spawn ground correction improved
- Flashlight flicker no longer triggers constantly

#### Technical
- Added `sf.sneak_time` scoreboard (custom:sneak_time)
- Added `sf.was_sneaking`, `sf.was_hiding`, `sf.detect_cd` scoreboards
- Updated version display to 10.0

---

## [Beta 9.0] - January 15, 2026
### "Strength in Numbers"

#### Added
- **Multiplayer Overhaul** — Up to 8 concurrent investigators
  - Individual sanity tracking per player via bossbar pool
  - Per-player bossbar slot assignment system
  - Crossing streams protection — only one player can contain at a time
  - Multiplayer respawn system — dead players enter spectator mode during hunts
- **Banshee** — New HIGH threat ghost
  - Evidence: EMF, Freezing, Spirit Box
  - Locks onto ONE player in multiplayer — ignores everyone else
  - Target persists until death or containment
  - Solo players: you're always the target
- Lore Page 3 — First contact
- Strange Signals 13-15

#### Fixed
- Lore page distribution (one per containment)
- Help menu updated with all 10 ghosts
- Various stability improvements

#### Technical
- Added bossbar pool system (sanity_1 through sanity_8)
- Added `sf.sanity_slot` scoreboard for per-player assignment
- Added display_slot_1-8.mcfunction files
- Added multiplayer respawn and spectator mode functions

---

## [Beta 8.0] - January 10, 2026
### "Don't Trust Your Senses"

#### Added
- **Sanity System** — 5 escalating stages
  - Clear, Mild, Unsettled, Unstable, Critical
  - Bossbar displays current sanity level
  - Passive exposure gain when near ghosts (distance-based)
  - Stage-based decay: higher stages recover slower
  - Flashlight and Warding Totem aid recovery
- **Hallucinations** — Sanity distorts your evidence
  - EMF can show false signals at high sanity loss
  - Thermometer can show fake freezing
  - Spirit Box can give fake responses (even without a ghost nearby)
  - Reality becomes unreliable
- **Revenant** — New HIGH threat ghost
  - Evidence: EMF, Freezing, Ghost Writing
  - Fast when observed, slow when hidden
  - 25 second containment time (hardest yet)
- **Photo Camera** — New investigation tool
  - Capture ghost photos as proof of encounter
  - Aim at ghost and use to photograph
  - Collect photos of each ghost type
  - Recipe: Glass Pane + Echo Shard + Iron Ingots
- Lore Page 2 — Dr. Vance discovers the portal structure
- Strange Signals 10-12

#### Added — Advancements
- **Snapshot** — Capture your first ghost photo
- **Can't Catch Me** — Survive a Revenant hunt
- **Losing It** — Reach critical sanity

#### Technical
- Added sanity stage tags (spectral.sanity_clear, mild, unsettled, unstable, critical)
- Added hallucination functions for EMF, Thermometer, Spirit Box
- Added Photo Camera detection and capture functions
- Updated version display to 8.0

<!--
AUTOMATED LOG — SITE 7B MONITORING SYSTEM
STATUS: ACTIVE
FREQUENCY: 7.83 Hz
SUBJECT: E.V.
LAST TRANSMISSION: ...find me...

pastebin.com/EnzDDYzh

THE VEIL IS THIN
THE FORGOTTEN REMEMBERS
⟟⏁ ⍙⏃⟟⏁⌇

DO NOT RESPOND TO UNKNOWN SIGNALS
-->

---

## [Beta 7.0] - January 7, 2026
### "Ghost Identity"

#### Added
- **Warding Totem** — Place to create a 6-block protective zone for 45 seconds
- **Soul Incense** — Emergency escape tool, repels ghost 10 blocks + speed boost
- **Ghost Behaviors** — Every ghost now has unique hunt behavior
  - Whisper — Stops chasing when players stay silent
  - Shadow — Kills flashlights within 5 blocks
  - Wraith — Phases through walls, completely silent
  - Phantom — Vanishes when you look directly at it
  - Shade — Won't hunt if 2+ players nearby
  - Specter — Leaves UV trail during hunts
  - Poltergeist — Knocks players back during chase
  - Hollow — Events trigger twice
- **Spirit Box Hints** — Ghosts occasionally hint at their weaknesses
- Lore Page 1 — Dr. E. Vance's Field Notes, Day 1

#### Added — Advancements
- **Hold the Line** — Use a Warding Totem
- **Emergency Exit** — Use Soul Incense
- **Researcher** — Find your first research notes
- **Silent Treatment** — Stop a Whisper by staying silent
- **Strength in Numbers** — Prevent a Shade hunt with teamwork
- **Lights Out** — Have your flashlight killed by Shadow
- **Through the Wall** — Witness a Wraith phase through walls
- **Now You See Me** — Make a Phantom vanish by looking at it

#### Fixed
- Flashlight no longer gives night vision (preserves darkness)
- Ghosts now stay grounded during hunts (gravity + step up)
- All give commands updated to match recipe format
- Help menu now includes Defense Tools page

---

## [Beta 6.0] - January 2, 2026
### "Manifestation Update"

#### Added
- **Manifestation System** — Ghosts can now hunt and kill players
  - Breach warning gives 40 seconds to prepare
  - Three escalating stages of tension
  - Ghost actively chases during manifestation
  - Different ghosts have different hunt speeds
- **Breach Warning Stages**
  - Stage 1: Heartbeat... something stirs
  - Stage 2: "It's getting angry..." — find a hiding spot!
  - Stage 3: Countdown — 5... 4... 3... 2... 1...
- **Hiding Mechanic** — Crouch under solid blocks to survive
- **Death System** — Ghost escapes, +100 exposure, teleported away
- **Survival Rewards** — -100 exposure on surviving manifestation
- **Contained Ghost Potions** — Collectible trophies with unique colors per ghost
- **Flashlight Flicker** — Flashlight flickers during breach and manifestation
- **UV Ghost Reveal** — UV Flashlight reveals ghost during manifestation (glowing + particles)

#### Changed
- Ghost hunt speeds vary by type:
  - Slow: Whisper (6), Shade (8)
  - Medium: Shadow, Phantom, Specter, Poltergeist, Hollow (12)
  - Fast: Wraith (18)
- Load message updated with organized formatting
- Join message updated with atmospheric title

#### Technical
- Added `sf.manifest_active`, `sf.manifest_timer`, `sf.breach_timer` scoreboards
- Added `sf.is_hiding`, `sf.hunt_cooldown`, `sf.ghost_speed` scoreboards
- Added `sf.flicker_timer`, `sf.flicker_roll` scoreboards
- Added `predicate/is_sneaking.json`
- Added manifestation functions (start, end, tick, chase, wander)
- Added breach functions (start, tick, stage_1, stage_2, stage_3, check_trigger)
- Added hiding, death, flashlight flicker, and UV reveal functions

---

## [Beta 5.0] - January 1, 2026
### "Atmosphere Update"

#### Added
- **Ghost Events System** — Ghosts now interact with the world
  - Light Flicker — Lights dim, darkness pulses
  - Door Slam — Loud slams echo nearby
  - Object Throw — Items get launched (requires nearby items)
  - Ambient Sounds — Creepy sounds play randomly
  - Temperature Drop — Visible breath, frost particles
  - Block Interaction — Noteblock tunes, clicking sounds
- **Ghost-Specific Event Rates**
  - Poltergeist: Very active (50%)
  - Wraith/Phantom/Specter/Hollow: Medium (35-40%)
  - Shadow/Whisper: Low (25%)
  - Shade: Very rare (10%)
- **Hollow** — New MEDIUM threat ghost
  - Evidence: Spirit Box, Freezing, UV
  - Mimics voices, echoes, confuses players
  - Unique Spirit Box responses that mimic player voices
- Strange Signals 6-10
- Custom Model Data migration — all tools updated to string format (`spectral_frequency:toolname`)

#### Changed
- Ghost spawn pool now includes 8 ghost types
- Evidence help page updated with Hollow
- Spirit Box, ambient, and containment systems updated with Hollow

#### Technical
- Added `sf.event_timer`, `sf.event_cooldown` scoreboards
- Added event system functions (roll, select, 6 event types)
- Custom model data changed from floats to strings format

---

## [Beta 4.0] - December 31, 2025
### "Freezing Update"

#### Added
- **Freezing Evidence** — New evidence type exclusive to certain ghosts
  - Shadow and Wraith cause freezing temperatures
  - Other ghosts only show "Cool" on thermometer
- **Thermometer Visual Overhaul**
  - Temperature bar that shrinks near freezing ghosts
  - Color gradient: green → yellow → blue → white
  - Breath/frost particles near freezing ghosts
- **Evidence Detection Notifications**
  - "EMF SPIKE!" when detecting EMF evidence
  - Spirit Box response notification with visual bar
  - "Freezing temperatures detected!" for freezing evidence
  - Ghost Writing completion notification
- **Strange Signals** — 1% chance during Spirit Box scans to receive mysterious lore messages
- **Ghost Resistance** — Ghosts now fight back during containment (slip mechanic)
- Custom Model Data for all 7 tools (resource pack support)

#### Added — Advancements
- **Frostbite** — Detect freezing temperatures near an anomaly
- **Off The Charts** — Detect an EMF spike
- **Is Anyone There?** — Get a Spirit Box response
- **Beyond the Veil** — Receive a strange signal (secret)

#### Changed
- Thermometer now functions as true evidence tool, not just proximity detector
- Containment progress bar synced with resistance mechanic
- Help/evidence page updated with Freezing column

#### Fixed
- Minor ghost spawn positioning improvements

---

## [Beta 3.0] - December 29, 2025
### "UV Update"

#### Added
- **Flashlight** — Emits light and slows exposure buildup
- **UV Flashlight** — Reveals ghostly fingerprints left by certain ghosts
- **UV Evidence** — New evidence type; marks fade after 2 minutes
- **Specter** — New MEDIUM threat ghost (EMF + UV) — territorial spirit
- **Poltergeist** — New MEDIUM threat ghost (Spirit Box + UV) — playful trickster
- `/trigger sf.help` — Simplified help menu shortcut

#### Added — Advancements
- **Blacklight** — Reveal your first UV fingerprint
- **Contain Specter**
- **Contain Poltergeist**

#### Changed
- Guidebook expanded to 13 pages with new tools and ghosts
- Evidence Guide updated with UV column and all 7 ghosts
- Disturb function now spawns all 7 ghost types (1/7 chance each)

#### Fixed
- Ghost spawn positioning improvements

---

## [Beta 2.0] - December 28, 2025
### "Ghost Writing Update"

#### Added
- **Spectral Journal** — Drop near an anomaly and wait for ghost writing
  - 5 random spooky messages
  - Staged visual/audio effects during writing
  - Craft: Paper + Ink Sac + Echo Shard
- **Phantom** — New MEDIUM threat ghost (EMF + Ghost Writing)
- **Shade** — New LOW threat ghost (Ghost Writing only)
- **Ghost Ambient Effects** — Each ghost emits unique particles and sounds
- **Paginated Help Menu** — Navigate with clickable buttons
  - Investigation Tools, Summoning & Containment, Other Items, Evidence Guide
- Expanded Spirit Box responses — 10 lines per ghost (up from 6)

#### Added — Advancements
- **Writer's Block** — Witness ghost writing
- 5 containment advancements (one per ghost type)

#### Fixed
- Ghost tags updated for consistency (`spectral.ghost_name` format)
- Ghosts now spawn at ground level from Grave Soil
- Thermometer properly detects all ghost types

#### Changed
- Guidebook updated with all 5 ghosts and new evidence types
- Help menu redesigned with clickable navigation

---

## [Beta 1.0] - December 27, 2025
### "First Light"

#### Added
- **EMF Detector** — Detects spectral energy at 3 distance levels
- **Spirit Box** — Communicates with ghosts at night
- **Thermometer** — Measures temperature drops near anomalies
- **Containment Device** — Captures anomalies with progress bar
- **Investigator's Guidebook** — In-game documentation
- **Disturbed Grave Soil** — Summons random anomalies
- **Whisper** — LOW threat ghost (Spirit Box)
- **Shadow** — MEDIUM threat ghost (EMF)
- **Wraith** — HIGH threat ghost (EMF + Spirit Box)
- **Exposure/Sanity System** — 3 escalating stages of effects
- Thematic crafting recipes using Echo Shards, Soul Sand, Crying Obsidian
- `/trigger sf.help_main` for recipes and help

#### Added — Advancements
- **First Contact** — Detect your first anomaly
- **Night Shift** — Use the Spirit Box at night
- **Ghostbuster** — Contain your first ghost
- 2 additional base advancements

#### Technical
- Custom NBT items using carrot_on_a_stick, recovery_compass, breeze_rod, glass_bottle
- Scoreboard-based detection systems
- Predicate-based randomization
- Minecraft 1.21.11 / pack_format 94
