# Changelog

All notable changes to Spectral Frequency will be documented in this file.

## Beta 8.0 - Don't Trust Your Senses (January 10, 2026)

### 🧠 Sanity System
- 5 sanity stages: Clear, Mild, Unsettled, Unstable, Critical
- Bossbar displays current sanity level
- Passive exposure gain when near ghosts (distance-based)
- Stage-based decay: higher stages recover slower
- Flashlight and Warding Totem aid recovery

### 👁️ Hallucinations
- High sanity causes fake evidence readings
- EMF can show false signals
- Thermometer can show fake freezing
- Spirit Box can give fake responses (even without a ghost nearby)
- Reality becomes unreliable

### 👻 New Ghost: Revenant
- Behavior: Fast when observed, slow when hidden
- Evidence: EMF, Freezing, Ghost Writing
- Containment: 25 seconds (hardest yet)
- "It never stopped."

### 📷 New Tool: Photo Camera
- Capture ghost photos as proof of encounter
- Aim at ghost and use to photograph
- Collect photos of each ghost type
- Recipe: Glass Pane + Echo Shard + Iron Ingots

### 📖 Lore Expansion
- Page 2 drops on second successful containment
- Dr. Vance discovers the portal structure
- Ancient symbols. Unknown meaning.
- The investigation continues.

### 🏆 New Advancements
- **Snapshot** — Capture your first ghost photo
- **Can't Catch Me** — Survive a Revenant hunt
- **Losing It** — Reach critical sanity

### 📊 Current Content
- 10 Tools
- 9 Ghosts
- 5 Evidence Types

---

### Community
Nexus Labs Discord is now live — bug reports, suggestions, lore discussion, and more.

---

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
```

## Beta 7.0 - Ghost Identity (January 7, 2026)

### 🛡️ Defense Tools
- **Warding Totem** — Place to create a 6-block protective zone for 45 seconds. Ghosts cannot enter.
- **Soul Incense** — Emergency escape tool. Repels ghost 10 blocks + gives speed boost.

### 👻 Ghost Behaviors
Every ghost now has unique hunt behavior:
- **Whisper** — Stops chasing when players stay silent
- **Shadow** — Kills flashlights within 5 blocks
- **Wraith** — Phases through walls, completely silent
- **Phantom** — Vanishes when you look directly at it
- **Shade** — Won't hunt if 2+ players nearby
- **Specter** — Leaves UV trail during hunts
- **Poltergeist** — Knocks players back during chase
- **Hollow** — Events trigger twice

### 📖 Lore
- First lore page drops on first successful containment
- Dr. E. Vance's Field Notes — Day 1

### 💀 Unique Death Messages
Each ghost now has personalized death messages when they claim you.

### 📻 Spirit Box Hints
Ghosts occasionally hint at their weaknesses through the Spirit Box.

### 🏆 New Advancements
- **Hold the Line** — Use a Warding Totem
- **Emergency Exit** — Use Soul Incense
- **Researcher** — Find your first research notes
- **Silent Treatment** — Stop a Whisper by staying silent
- **Strength in Numbers** — Prevent a Shade hunt with teamwork
- **Lights Out** — Have your flashlight killed by Shadow
- **Through the Wall** — Witness a Wraith phase through walls
- **Now You See Me** — Make a Phantom vanish by looking at it

### 🔧 Fixes & Polish
- Flashlight no longer gives night vision (preserves darkness)
- Ghosts now stay grounded during hunts (gravity + step up)
- Updated all give commands to match recipe format
- Help menu now includes Defense Tools page
- Updated load message to Beta 7.0
  
-------------

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
  - Closets, basements, anywhere with a solid ceiling
  - Ghost cannot find hidden players
- **Death System** — Consequences for getting caught
  - Ghost escapes (must find a new one)
  - +100 exposure penalty
  - Teleported away from location
- **Survival Rewards**
  - -100 exposure on surviving manifestation
  - "Close Call" advancement unlocked
- **Contained Ghost Potions** — Collectible trophies
  - Unique color per ghost type
  - Custom name and lore description
  - Enchantment glint effect
- **Flashlight Flicker** — Flashlight flickers during breach and manifestation
- **UV Ghost Reveal** — UV Flashlight reveals ghost during manifestation
  - Ghost gets glowing effect
  - Particles surround revealed ghost

#### Changed
- Load message updated (organized scoreboards, clean formatting)
- Join message updated (atmospheric title, welcome text)
- Ghost hunt speeds vary by type:
  - Slow: Whisper (6), Shade (8)
  - Medium: Shadow, Phantom, Specter, Poltergeist, Hollow (12)
  - Fast: Wraith (18)

#### Technical
- Added `sf.manifest_active` scoreboard
- Added `sf.manifest_timer` scoreboard
- Added `sf.breach_timer` scoreboard
- Added `sf.is_hiding` scoreboard
- Added `sf.hunt_cooldown` scoreboard
- Added `sf.ghost_speed` scoreboard
- Added `sf.flicker_timer` scoreboard
- Added `sf.flicker_roll` scoreboard
- Added `predicate/is_sneaking.json`
- Added manifestation functions (start, end, tick, chase, wander)
- Added breach functions (start, tick, stage_1, stage_2, stage_3, check_trigger)
- Added hiding/check.mcfunction
- Added death/on_death.mcfunction
- Added flashlight flicker functions
- Added UV ghost reveal functions
- Added contained ghost give functions (one per ghost)

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
  - Poltergeist: Very active (50% chance)
  - Wraith/Phantom/Specter/Hollow: Medium (35-40%)
  - Shadow/Whisper: Low (25%)
  - Shade: Very rare (10%)
- **Hollow Ghost** — New ghost type
  - Evidence: Spirit Box + Freezing + UV
  - Threat Level: Medium
  - Behavior: Mimics voices, echoes, confuses players
  - Unique Spirit Box responses that mimic player voices
- **Strange Signals Expansion** — 5 new mysterious messages
  - "THE VEIL IS THIN"
  - "THE FORGOTTEN WATCHES"
  - "BETWEEN WORLDS"
  - "NOT ALONE"
  - "THEY BROKE THROUGH"
- **Custom Model Data Migration** — All tools updated to string format for resource pack support
  - Format: `spectral_frequency:toolname`

#### Changed
- Ghost spawn pool now includes 8 ghost types
- Evidence help page updated with Hollow
- Spirit Box scan updated with Hollow responses
- Ambient system updated with Hollow effects
- Containment system updated with Hollow strain/progress
- Strange Signals now has 10 possible messages (up from 5)

#### Technical
- Added `sf.event_timer` scoreboard
- Added `sf.event_cooldown` scoreboard
- Added event system functions (roll, select, 6 event types)
- Added new predicates for event chances
- Custom model data changed from `floats` to `strings` format

---

## [Beta 4.0] - December 31, 2025
### "Freezing Update"

#### Added
- **Freezing Evidence** — New evidence type exclusive to certain ghosts
  - Shadow and Wraith now cause freezing temperatures
  - Other ghosts only show "Cool" on thermometer
- **Thermometer Visual Overhaul**
  - Temperature bar that shrinks as you approach freezing ghost
  - Color gradient (green → yellow → blue → white)
  - Breath/frost particles near freezing ghosts
- **Evidence Detection Notifications**
  - "EMF SPIKE!" when detecting EMF evidence
  - Spirit Box response notification with visual bar
  - "Freezing temperatures detected!" for freezing evidence
  - Ghost Writing completion notification
- **Strange Signals** — 1% chance during Spirit Box scans to receive mysterious lore messages
- **Ghost Resistance** — Ghosts now fight back during containment (slip mechanic)
- **Custom Model Data** — All 7 tools now have custom_model_data for resource pack support
  - Thermometer: 1001
  - EMF Detector: 1002
  - Spirit Box: 1003
  - Containment Device: 1004
  - Spectral Journal: 1005
  - Flashlight: 1006
  - UV Flashlight: 1007
- **New Advancements**
  - "Frostbite" — Detect freezing temperatures near an anomaly
  - "Off The Charts" — Detect an EMF spike
  - "Is Anyone There?" — Get a Spirit Box response
  - "Beyond the Veil" — Receive a strange signal (secret)

#### Changed
- Thermometer now functions as true evidence tool, not just proximity detector
- Containment progress bar synced with resistance mechanic
- Help/evidence page updated with Freezing column
- Guidebook updated with Freezing information

#### Fixed
- Minor ghost spawn positioning improvements

---

## [Beta 3.0] - 2025-12-29

### Added
- **Flashlight** - New tool that emits light and slows exposure buildup
- **UV Flashlight** - Reveals ghostly fingerprints left by certain ghosts
- **UV Evidence** - New evidence type; marks fade after 2 minutes
- **Specter** - New ghost type (EMF + UV) - territorial spirit
- **Poltergeist** - New ghost type (Spirit Box + UV) - playful trickster
- **`/trigger sf.help`** - Simplified help menu shortcut
- **UV Evidence advancement** - For revealing your first fingerprint
- **Contain Specter advancement**
- **Contain Poltergeist advancement**

### Changed
- Guidebook expanded to 13 pages with new tools and ghosts
- Evidence Guide updated with UV column and all 7 ghosts
- Help/Tools page updated with Flashlight and UV Flashlight recipes
- Disturb function now spawns all 7 ghost types (1/7 chance each)

### Fixed
- Ghost spawn positioning improvements

---

## [Beta 2.0] - 2025-12-28

### Added
- **Spectral Journal** - New investigation tool that detects ghost writing
  - Drop near an anomaly and wait for activity
  - 5 random spooky messages
  - Staged visual/audio effects during writing
- **Phantom** - New ghost type (EMF + Ghost Writing)
- **Shade** - New ghost type (Ghost Writing only)
- **Ghost ambient effects** - Each ghost emits unique particles and sounds
- **Paginated help menu** - Navigate with clickable buttons
  - Investigation Tools page
  - Summoning & Containment page
  - Other Items page
  - Evidence Guide page
- **"Writer's Block" advancement** - Witness ghost writing
- **5 containment advancements** - One for each ghost type
- **Journal drop feedback** - Message when placing journal
- **Expanded Spirit Box responses** - 10 lines per ghost (up from 6)

### Fixed
- Ghost tags updated for consistency (`spectral.ghost_name` format)
- Ghosts now spawn at ground level from Grave Soil
- Thermometer properly detects all ghost types
- All tools properly detect new ghosts

### Changed
- Guidebook updated with all 5 ghosts and new evidence types
- Help menu redesigned with clickable navigation
- Pack description updated to Beta 2.0

---

## [Beta 1.0] - 2025-12-27

### Added
- **EMF Detector** - Detects spectral energy at 3 distance levels
- **Spirit Box** - Communicates with ghosts at night
- **Thermometer** - Measures temperature drops near anomalies
- **Containment Device** - Captures anomalies with progress bar
- **Investigator's Guidebook** - In-game documentation
- **Disturbed Grave Soil** - Summons random anomalies
- **Whisper** - Low threat ghost (Spirit Box evidence)
- **Shadow** - Medium threat ghost (EMF evidence)
- **Wraith** - High threat ghost (EMF + Spirit Box evidence)
- **Exposure/Sanity system** - 3 escalating stages of effects
- **5 base advancements** - First Contact, Night Shift, Ghostbuster, etc.
- **Thematic crafting recipes** - Using Echo Shards, Soul Sand, Crying Obsidian
- **Help trigger** - `/trigger sf.help_main` for recipes

### Technical
- Custom NBT items using carrot_on_a_stick, recovery_compass, breeze_rod, glass_bottle
- Scoreboard-based detection systems
- Predicate-based randomization
- Minecraft 1.21.11 pack format (94)
