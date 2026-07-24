# bench/consume_step.mcfunction
# Drains the copied barrel list, removes exact recipe quantities, rebuilds
# the surviving item list, then writes it back to the same barrel.

# ------------------------------------------------------------
# FINISH
# ------------------------------------------------------------

execute unless data storage sf:bench consume.items[-1] run data modify block ~ ~ ~ Items set from storage sf:bench consume.output
execute unless data storage sf:bench consume.items[-1] run function sf:bench/craft_finish
execute unless data storage sf:bench consume.items[-1] run return 0

# ------------------------------------------------------------
# READ NEXT STACK
# ------------------------------------------------------------

data modify storage sf:bench consume.current set from storage sf:bench consume.items[-1]
data remove storage sf:bench consume.items[-1]

scoreboard players set #stack_count sf.data 0
scoreboard players set #stack_kind sf.data 0
scoreboard players set #take sf.data 0

execute store result score #stack_count sf.data run data get storage sf:bench consume.current.count 1

# 1 = Iron
# 2 = Redstone
# 3 = Glass
# 4 = Plain Amethyst
# 5 = Ectoplasm
# 6 = Veil Shard

execute if data storage sf:bench consume.current{id:"minecraft:iron_ingot"} run scoreboard players set #stack_kind sf.data 1
execute if data storage sf:bench consume.current{id:"minecraft:redstone"} run scoreboard players set #stack_kind sf.data 2
execute if data storage sf:bench consume.current{id:"minecraft:glass"} run scoreboard players set #stack_kind sf.data 3

execute if data storage sf:bench consume.current{id:"minecraft:amethyst_shard"} unless data storage sf:bench consume.current.components."minecraft:custom_data".sf.material run scoreboard players set #stack_kind sf.data 4

execute if data storage sf:bench consume.current{id:"minecraft:slime_ball",components:{"minecraft:custom_data":{sf:{material:"ectoplasm"}}}} run scoreboard players set #stack_kind sf.data 5

execute if data storage sf:bench consume.current{id:"minecraft:amethyst_shard",components:{"minecraft:custom_data":{sf:{material:"veil_shard"}}}} run scoreboard players set #stack_kind sf.data 6

# ------------------------------------------------------------
# REMOVE ONLY WHAT THIS RECIPE STILL NEEDS
# ------------------------------------------------------------

execute if score #stack_kind sf.data matches 1 run scoreboard players operation #take sf.data = #stack_count sf.data
execute if score #stack_kind sf.data matches 1 run scoreboard players operation #take sf.data < #need_iron sf.data
execute if score #stack_kind sf.data matches 1 run scoreboard players operation #need_iron sf.data -= #take sf.data
execute if score #stack_kind sf.data matches 1 run scoreboard players operation #stack_count sf.data -= #take sf.data

execute if score #stack_kind sf.data matches 2 run scoreboard players operation #take sf.data = #stack_count sf.data
execute if score #stack_kind sf.data matches 2 run scoreboard players operation #take sf.data < #need_redstone sf.data
execute if score #stack_kind sf.data matches 2 run scoreboard players operation #need_redstone sf.data -= #take sf.data
execute if score #stack_kind sf.data matches 2 run scoreboard players operation #stack_count sf.data -= #take sf.data

execute if score #stack_kind sf.data matches 3 run scoreboard players operation #take sf.data = #stack_count sf.data
execute if score #stack_kind sf.data matches 3 run scoreboard players operation #take sf.data < #need_glass sf.data
execute if score #stack_kind sf.data matches 3 run scoreboard players operation #need_glass sf.data -= #take sf.data
execute if score #stack_kind sf.data matches 3 run scoreboard players operation #stack_count sf.data -= #take sf.data

execute if score #stack_kind sf.data matches 4 run scoreboard players operation #take sf.data = #stack_count sf.data
execute if score #stack_kind sf.data matches 4 run scoreboard players operation #take sf.data < #need_amethyst sf.data
execute if score #stack_kind sf.data matches 4 run scoreboard players operation #need_amethyst sf.data -= #take sf.data
execute if score #stack_kind sf.data matches 4 run scoreboard players operation #stack_count sf.data -= #take sf.data

execute if score #stack_kind sf.data matches 5 run scoreboard players operation #take sf.data = #stack_count sf.data
execute if score #stack_kind sf.data matches 5 run scoreboard players operation #take sf.data < #need_ecto sf.data
execute if score #stack_kind sf.data matches 5 run scoreboard players operation #need_ecto sf.data -= #take sf.data
execute if score #stack_kind sf.data matches 5 run scoreboard players operation #stack_count sf.data -= #take sf.data

execute if score #stack_kind sf.data matches 6 run scoreboard players operation #take sf.data = #stack_count sf.data
execute if score #stack_kind sf.data matches 6 run scoreboard players operation #take sf.data < #need_shard sf.data
execute if score #stack_kind sf.data matches 6 run scoreboard players operation #need_shard sf.data -= #take sf.data
execute if score #stack_kind sf.data matches 6 run scoreboard players operation #stack_count sf.data -= #take sf.data

# ------------------------------------------------------------
# PRESERVE THE REMAINDER
# ------------------------------------------------------------

execute if score #stack_count sf.data matches 1.. store result storage sf:bench consume.current.count int 1 run scoreboard players get #stack_count sf.data
execute if score #stack_count sf.data matches 1.. run data modify storage sf:bench consume.output append from storage sf:bench consume.current

function sf:bench/consume_step