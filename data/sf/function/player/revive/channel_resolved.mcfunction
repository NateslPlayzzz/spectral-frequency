# player/revive/channel_resolved.mcfunction
# Macro context:
# {
#   owner:[I;...],
#   rescuer:[I;...]
# }

# The case must still exist.
execute unless data storage sf:case {state:"active"} run return run function sf:player/revive/break

# The rescuer must remain online, living, participating, and within range.
$execute unless entity @a[nbt={UUID:$(rescuer)},tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..3.5] run return run function sf:player/revive/break

# The owner must remain online and Taken.
$execute unless entity @a[nbt={UUID:$(owner)},scores={sf.claimed=1..}] run return run function sf:player/revive/break

# Never allow the cost to reduce the rescuer to zero.
scoreboard players operation #revive_floor sf.data = #revive_cost sf.data
scoreboard players add #revive_floor sf.data 1

$execute unless score @a[nbt={UUID:$(rescuer)},limit=1] sf.coherence >= #revive_floor sf.data run return run function sf:player/revive/break

# Pay one stage of the ritual.
$scoreboard players operation @a[nbt={UUID:$(rescuer)}] sf.coherence -= #revive_cost sf.data
scoreboard players add @s sf.revive_progress 1

# Convert remnant stages into an accurate percentage for the rescuer HUD.
scoreboard players operation #revive_pct sf.data = @s sf.revive_progress
scoreboard players set #revive_scale sf.data 100
scoreboard players operation #revive_pct sf.data *= #revive_scale sf.data
scoreboard players operation #revive_pct sf.data /= #revive_need sf.data

$scoreboard players operation @a[nbt={UUID:$(rescuer)}] sf.revive_progress = #revive_pct sf.data

# Escalating visual and audio feedback.
particle minecraft:end_rod ~ ~0.9 ~ 0.32 0.5 0.32 0.0 7
particle minecraft:soul ~ ~0.9 ~ 0.45 0.7 0.45 0.01 9
particle dust{color:[0.48,0.36,1.0],scale:1.0} ~ ~0.9 ~ 0.3 0.5 0.3 0.0 7

$playsound minecraft:block.conduit.ambient.short player @a[nbt={UUID:$(rescuer)}] ~ ~ ~ 0.5 1.35
$playsound minecraft:block.amethyst_block.chime player @a[nbt={UUID:$(rescuer)}] ~ ~ ~ 0.25 0.8

execute if score @s sf.revive_progress >= #revive_need sf.data run function sf:player/revive/complete