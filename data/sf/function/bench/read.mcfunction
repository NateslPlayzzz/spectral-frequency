# bench/read.mcfunction
# Opens the recipe catalog for an already-attuned barrel.

execute unless score @s sf.quest matches 100.. run return run title @s actionbar {"text":"the Bench does not recognize you yet","color":"dark_gray","italic":true}

# Idempotently repairs basic recipe authorization for older investigators.
function sf:quest/unlock_basics

scoreboard players enable @s sf.bench_menu

playsound minecraft:block.amethyst_block.hit block @s ~ ~ ~ 0.7 1.0
playsound minecraft:block.enchantment_table.use player @s ~ ~ ~ 0.3 1.2

particle minecraft:enchant ~0.5 ~1 ~0.5 0.35 0.45 0.35 0.35 14
particle minecraft:electric_spark ~0.5 ~1 ~0.5 0.2 0.3 0.2 0.02 5

dialog show @s sf:attuned_bench