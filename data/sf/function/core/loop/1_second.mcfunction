# core/loop/1_second.mcfunction
# Schedule first so later return/control-flow changes cannot stop the loop.

schedule function sf:core/loop/1_second 1s replace

execute store result score #hb_1s sf.data run time query gametime

# --- Online Memory bossbar ownership ---
function sf:ui/rebuild_bars

# --- Queued tutorial startup ---
execute if data storage sf:forgotten {state:"idle"} unless data storage sf:case {state:"active"} as @a[tag=sf.tutorial_waiting,scores={sf.quest=1}] at @s run function sf:quest/tutorial_retry

# --- Ghost sight drain ---
scoreboard players operation @a[tag=spectral.seen] sf.coherence -= #sight_drain sf.data
execute as @a[tag=spectral.seen] at @s run playsound minecraft:entity.warden.heartbeat hostile @s ~ ~ ~ 1 0.7
tag @a remove spectral.seen

# --- Idle ghost behavior: exactly once per second ---
execute as @e[type=marker,tag=sf.ghost,tag=!sf.forgotten,tag=sf.state.idle] at @s run function sf:ghost/idle/tick

# --- Hunt decision ---
execute if data storage sf:case {state:"active"} run function sf:ghost/hunt/decide

# --- Warning, Hunt, and cooldown timers ---
execute as @e[type=marker,tag=sf.ghost,tag=sf.state.warning] run scoreboard players remove @s sf.hunt_timer 1
execute as @e[type=marker,tag=sf.ghost,tag=sf.state.hunt] run scoreboard players remove @s sf.hunt_timer 1

execute as @e[type=marker,tag=sf.ghost,tag=sf.state.hunt,scores={sf.hunt_timer=..0}] run function sf:ghost/hunt/end

execute as @e[type=marker,tag=sf.ghost,tag=sf.state.cooldown] run scoreboard players remove @s sf.cooldown_timer 1
execute as @e[type=marker,tag=sf.ghost,tag=sf.state.cooldown,scores={sf.cooldown_timer=..0}] run function sf:ghost/idle

# --- Solo failure countdown ---
scoreboard players remove @a[tag=sf.solo_release_pending,scores={sf.revive_progress=1..}] sf.revive_progress 1
execute as @a[tag=sf.solo_release_pending,scores={sf.revive_progress=..0}] at @s run function sf:player/claim/solo_release

# --- Visible Remnant ambience ---
execute as @e[type=minecraft:interaction,tag=sf.remnant_interact] at @s run function sf:player/revive/remnant_tick

# --- Deliberate Remnant revival channels ---
execute as @e[type=minecraft:interaction,tag=sf.remnant_interact,tag=sf.remnant_channeling] at @s run function sf:player/revive/channel

# --- Remove stale rescuer state after disconnect or Remnant cleanup ---
execute as @a[tag=sf.reviving] at @s unless entity @e[type=minecraft:interaction,tag=sf.remnant_interact,tag=sf.remnant_channeling,distance=..4] run function sf:player/revive/clear_player

# --- Warding Totems ---
execute as @e[type=marker,tag=sf.ward] at @s run function sf:tool/totem/tick

# --- Motion Sensors ---
execute as @e[type=marker,tag=sf.sensor] at @s run function sf:tool/sensor/tick

# --- Attuned Bench ambience ---
execute as @e[type=marker,tag=sf.bench] at @s run particle minecraft:wax_off ~ ~0.3 ~ 0.3 0.3 0.3 0.0 3

# --- Persistent signal recovery ---
execute if data storage sf:forgotten {state:"idle"} as @a[tag=spectral.sf_init,tag=!sf.signal_checked] run function sf:signal/recover

# --- Per-player signal tracking ---
execute if data storage sf:forgotten {state:"idle"} as @a[tag=sf.seeking] at @s run function sf:signal/seek

# --- Forgotten authority and resumable phases ---
function sf:forgotten/authority/refresh

execute if data storage sf:forgotten {state:"pull"} as @a[tag=sf.forgotten_witness,scores={sf.recon_pull=1..}] at @s run function sf:forgotten/pull_tick

execute if data storage sf:forgotten {state:"threshold"} as @a[tag=sf.forgotten_witness] at @s run function sf:forgotten/threshold_tick

execute if data storage sf:forgotten {state:"manifest"} as @a[tag=sf.forgotten_witness] at @s run function sf:forgotten/manifest_tick

execute if data storage sf:forgotten {state:"vigil"} as @a[tag=sf.forgotten_witness] at @s run function sf:forgotten/vigil_tick

execute if data storage sf:forgotten {state:"epilogue"} as @a[tag=sf.forgotten_witness] at @s run function sf:forgotten/epilogue_tick