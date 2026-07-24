# bench/craft_finish.mcfunction
# Runs only after the barrel has been rewritten with exact ingredients removed.

function sf:bench/give_output with storage sf:bench candidate

scoreboard players set @s sf.tool_cd 8

title @s times 5 40 15
title @s title {"text":"ASSEMBLY COMPLETE","color":"#9BFFB0","bold":true}
title @s subtitle {"text":"the resonance holds its new shape","color":"gray","italic":true}

playsound minecraft:block.enchantment_table.use block @a[distance=..16] ~0.5 ~1 ~0.5 1 1.0
playsound minecraft:block.amethyst_cluster.break block @a[distance=..16] ~0.5 ~1 ~0.5 0.7 1.4
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 0.45 1.2

particle minecraft:wax_on ~0.5 ~1 ~0.5 0.35 0.45 0.35 0.0 24
particle minecraft:end_rod ~0.5 ~1 ~0.5 0.25 0.45 0.25 0.03 14
particle minecraft:electric_spark ~0.5 ~1 ~0.5 0.2 0.3 0.2 0.02 7

advancement grant @s only sf:craft_tool

data remove storage sf:bench scan
data remove storage sf:bench current
data remove storage sf:bench consume