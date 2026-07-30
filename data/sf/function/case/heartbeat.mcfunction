# case/heartbeat.mcfunction
# Runs once per second while a standard or tutorial case is active.

execute unless data storage sf:case {state:"active"} run return 0

# ------------------------------------------------------------
# ONLINE GENERATION VALIDATION
# ------------------------------------------------------------

tag @a remove sf.case_valid_online

execute as @a[tag=sf.case_participant] if score @s sf.case_gen = #case_serial sf.data run tag @s add sf.case_valid_online

# Online players carrying stale participant state are detached immediately.
execute as @a[tag=sf.case_participant,tag=!sf.case_valid_online,scores={sf.claimed=1..}] run function sf:core/restore_player
execute as @a[tag=sf.case_participant,tag=!sf.case_valid_online] run function sf:case/clear_runtime_player

scoreboard players set #case_online sf.data 0
scoreboard players set #case_living sf.data 0
scoreboard players set #case_taken sf.data 0

execute as @a[tag=sf.case_valid_online] run scoreboard players add #case_online sf.data 1
execute as @a[tag=sf.case_valid_online,gamemode=!spectator,scores={sf.claimed=0}] run scoreboard players add #case_living sf.data 1
execute as @a[tag=sf.case_valid_online,scores={sf.claimed=1..}] run scoreboard players add #case_taken sf.data 1

# ------------------------------------------------------------
# CASE-OWNER TRANSFER
# ------------------------------------------------------------

tag @a remove sf.case_owner
execute as @a[tag=sf.case_valid_online,gamemode=!spectator,scores={sf.claimed=0},sort=arbitrary,limit=1] run tag @s add sf.case_owner
execute as @a[tag=sf.case_owner,limit=1] run data modify storage sf:case owner set from entity @s UUID

# ------------------------------------------------------------
# LIVING-PARTICIPANT AUTHORITY
# ------------------------------------------------------------

# A living participant cancels abandonment and pending all-Taken failure.
execute if score #case_living sf.data matches 1.. run scoreboard players set #case_empty sf.data 0
execute if score #case_living sf.data matches 1.. run tag @a[tag=sf.case_valid_online,tag=sf.solo_release_pending] remove sf.solo_release_pending
execute if score #case_living sf.data matches 1.. run scoreboard players set @a[tag=sf.case_valid_online,scores={sf.claimed=1..}] sf.revive_progress 0

# When all online valid participants are Taken, begin the existing dramatic three-second failure.
execute if score #case_living sf.data matches 0 if score #case_taken sf.data matches 1.. run scoreboard players set #case_empty sf.data 0
execute if score #case_living sf.data matches 0 if score #case_taken sf.data matches 1.. as @a[tag=sf.case_valid_online,scores={sf.claimed=1..},sort=arbitrary,limit=1] run function sf:player/claim/check_solo

# No living or Taken participant is online. Allow sixty seconds for reconnect.
execute if score #case_living sf.data matches 0 if score #case_taken sf.data matches 0 run scoreboard players add #case_empty sf.data 1
execute if score #case_empty sf.data matches 60.. run return run function sf:case/abandoned

# ------------------------------------------------------------
# MANIFESTATION OWNERSHIP AND ORPHAN DETECTION
# ------------------------------------------------------------

# Standard manifestations from another investigation self-delete on load.
execute as @e[type=minecraft:marker,tag=sf.ghost,tag=!sf.forgotten] unless score @s sf.data = #case_serial sf.data run kill @s

scoreboard players set #case_ghosts sf.data 0
execute as @e[type=minecraft:marker,tag=sf.ghost,tag=!sf.forgotten] if score @s sf.data = #case_serial sf.data run scoreboard players add #case_ghosts sf.data 1

# More than one authoritative manifestation is immediate case corruption.
execute if score #case_ghosts sf.data matches 2.. run return run function sf:case/orphaned

scoreboard players set #case_field sf.data 0

data remove storage sf:temp heartbeat
data modify storage sf:temp heartbeat.dimension set from storage sf:case dimension
data modify storage sf:temp heartbeat.x set from storage sf:case spawn.x
data modify storage sf:temp heartbeat.y set from storage sf:case spawn.y
data modify storage sf:temp heartbeat.z set from storage sf:case spawn.z

function sf:case/heartbeat_field with storage sf:temp heartbeat

data remove storage sf:temp heartbeat

execute if score #case_ghosts sf.data matches 1 run scoreboard players set #ghost_missing sf.data 0
execute if score #case_field sf.data matches 0 run scoreboard players set #ghost_missing sf.data 0
execute if score #case_field sf.data matches 1 if score #case_ghosts sf.data matches 0 run scoreboard players add #ghost_missing sf.data 1

# Require five consecutive loaded seconds without the manifestation.
execute if score #ghost_missing sf.data matches 5.. run return run function sf:case/orphaned

tag @a remove sf.case_valid_online