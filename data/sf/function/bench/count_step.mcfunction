# bench/count_step.mcfunction

execute unless data storage sf:bench scan[-1] run return 0

data modify storage sf:bench current set from storage sf:bench scan[-1]
data remove storage sf:bench scan[-1]

scoreboard players set #stack_count sf.data 0
execute store result score #stack_count sf.data run data get storage sf:bench current.count 1

execute if data storage sf:bench current{id:"minecraft:iron_ingot"} run scoreboard players operation #have_iron sf.data += #stack_count sf.data
execute if data storage sf:bench current{id:"minecraft:redstone"} run scoreboard players operation #have_redstone sf.data += #stack_count sf.data
execute if data storage sf:bench current{id:"minecraft:glass"} run scoreboard players operation #have_glass sf.data += #stack_count sf.data

# Plain vanilla Amethyst counts; custom Veil Shards do not.
execute if data storage sf:bench current{id:"minecraft:amethyst_shard"} unless data storage sf:bench current.components."minecraft:custom_data".sf.material run scoreboard players operation #have_amethyst sf.data += #stack_count sf.data

execute if data storage sf:bench current{id:"minecraft:slime_ball",components:{"minecraft:custom_data":{sf:{material:"ectoplasm"}}}} run scoreboard players operation #have_ecto sf.data += #stack_count sf.data

execute if data storage sf:bench current{id:"minecraft:amethyst_shard",components:{"minecraft:custom_data":{sf:{material:"veil_shard"}}}} run scoreboard players operation #have_shard sf.data += #stack_count sf.data

function sf:bench/count_step