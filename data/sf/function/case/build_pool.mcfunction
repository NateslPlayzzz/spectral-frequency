# case/build_pool.mcfunction
# Builds the requesting Investigator's currently eligible assignment pool.
#
# Standard mode:
#   Missing Banshee, Shadow, Specter, Poltergeist, Revenant, and Mare.
#
# Expanded mode:
#   Every missing standard and Veil-registry manifestation.
#
# If every accessible manifestation is already remembered, the corresponding
# complete pool is restored so repeat cases remain available.

function sf:player/data/ensure
function sf:player/data/load_shardcount

scoreboard players set #expanded_pool sf.data 0

# Advanced assignments remain physically gated by possession of an Echo Lens.
execute if items entity @s inventory.* *[custom_data~{sf:{item:"echolens"}}] run scoreboard players set #expanded_pool sf.data 1
execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"echolens"}}] run scoreboard players set #expanded_pool sf.data 1
execute if items entity @s weapon.offhand *[custom_data~{sf:{item:"echolens"}}] run scoreboard players set #expanded_pool sf.data 1

data modify storage sf:temp case.pool set value []
data modify storage sf:temp pool.uuid set from entity @s UUID

function sf:case/build_pool_macro with storage sf:temp pool

# Record how many currently accessible unremembered patterns were found.
scoreboard players set #ghost_pool sf.data 0
execute store result score #ghost_pool sf.data run data get storage sf:temp case.pool
scoreboard players operation #missing_pool sf.data = #ghost_pool sf.data

# Once every accessible pattern is remembered, restore the complete accessible
# pool so ordinary repeat investigations remain possible.
execute if score #missing_pool sf.data matches 0 if score #expanded_pool sf.data matches 0 run data modify storage sf:temp case.pool set value ["banshee","shadow","specter","poltergeist","revenant","mare"]

execute if score #missing_pool sf.data matches 0 if score #expanded_pool sf.data matches 1 run data modify storage sf:temp case.pool set value ["banshee","shadow","specter","poltergeist","revenant","mare","whisper","wraith","phantom","shade","hollow","dread"]

# Recalculate the final usable pool length.
scoreboard players set #ghost_pool sf.data 0
execute store result score #ghost_pool sf.data run data get storage sf:temp case.pool

# Defensive fallback. A valid roster should never reach this branch.
execute if score #ghost_pool sf.data matches ..0 run data modify storage sf:temp case.pool set value ["banshee"]
execute if score #ghost_pool sf.data matches ..0 run scoreboard players set #ghost_pool sf.data 1

data remove storage sf:temp pool