# case/open.mcfunction
# Opens the case whose id and mode are already stored in sf:case.
#
# Expected modes:
#   "standard"
#   "tutorial"
#
# Runs as the case owner at the case origin.

function sf:tool/contain/clear_all

# Remove stale loaded artifacts from an interrupted inactive case.
kill @e[type=minecraft:marker,tag=sf.ghost]
kill @e[tag=sf.uv_trace]
kill @e[tag=sf.remnant]
kill @e[type=minecraft:marker,tag=sf.ward]

# Remove stale runtime ownership from online players.
tag @a remove sf.case_participant
tag @a remove sf.case_owner
tag @a remove sf.case_resolver
tag @a remove sf.solo_release_pending
tag @a remove sf.reviving

function sf:evidence/reset_pending

# Every investigation receives a distinct runtime generation.
scoreboard players add #case_serial sf.data 1

# A newly opened case supersedes any one-time upgrade adoption window.
data remove storage sf:config case_generation_adopt_serial
scoreboard players set #adopt_serial sf.data -1

# The initiating player always owns and participates in the case.
tag @s add sf.case_owner
tag @s add sf.case_participant

# Standard cases include eligible Investigators already nearby.
# Tutorial cases remain private to the onboarding player.
execute if data storage sf:case {mode:"standard"} as @a[tag=spectral.sf_init,tag=!sf.case_participant,gamemode=!spectator,scores={sf.quest=100..,sf.claimed=0},distance=..48] run tag @s add sf.case_participant

# Bind every enrolled online participant to this exact generation.
scoreboard players operation @a[tag=sf.case_participant] sf.case_gen = #case_serial sf.data

execute as @a[tag=sf.case_participant] run function sf:case/reset
execute as @a[tag=sf.case_participant] run function sf:case/reset_performance

data modify storage sf:case owner set from entity @s UUID
data modify storage sf:case dimension set from entity @s Dimension

execute store result storage sf:case spawn.x int 1 run data get entity @s Pos[0] 1
execute store result storage sf:case spawn.y int 1 run data get entity @s Pos[1] 1
execute store result storage sf:case spawn.z int 1 run data get entity @s Pos[2] 1

data modify storage sf:case state set value "active"

scoreboard players set #case_age sf.data 0
scoreboard players set #hunt_roll_cd sf.data 0
scoreboard players set #case_empty sf.data 0
scoreboard players set #ghost_missing sf.data 0

function sf:case/do_spawn with storage sf:case