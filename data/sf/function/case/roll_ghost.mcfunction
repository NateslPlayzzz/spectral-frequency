# case/roll_ghost.mcfunction
# Runs as the player beginning the case.
#
# Sets storage sf:temp case.id to a random ghost definition.
#
# Without an Echo Lens:
#   Roll only the first six standard-evidence fragments.
#
# While carrying an Echo Lens:
#   Roll from all twelve fragments.

# Default pool:
# banshee, shadow, specter, poltergeist, revenant, mare
scoreboard players set #ghost_pool sf.data 6

# Carrying an Echo Lens opens the complete twelve-fragment pool.
execute if items entity @s inventory.* *[custom_data~{sf:{item:"echolens"}}] run scoreboard players set #ghost_pool sf.data 12
execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"echolens"}}] run scoreboard players set #ghost_pool sf.data 12
execute if items entity @s weapon.offhand *[custom_data~{sf:{item:"echolens"}}] run scoreboard players set #ghost_pool sf.data 12

# Select an index from the currently available pool.
execute store result score #pick sf.data run random value 1..1000000
scoreboard players operation #pick sf.data %= #ghost_pool sf.data

# Resolve the selected index through sf:ghost_defs.index.
execute store result storage sf:temp idx int 1 run scoreboard players get #pick sf.data
function sf:case/pick_index with storage sf:temp