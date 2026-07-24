# forgotten/vigil_tick_macro.mcfunction
# Macro context: {dimension:"namespace:id",x:<int>,y:<int>,z:<int>}

$execute unless data entity @s {Dimension:"$(dimension)"} run return run title @s actionbar {"text":"the Vigil pauses until you return","color":"#8B0000","italic":true}

$execute in $(dimension) positioned $(x) $(y) $(z) unless entity @s[distance=..48] run return run title @s actionbar {"text":"do not leave him alone again","color":"#8B0000","italic":true}

scoreboard players add @s sf.vigil_timer 1

execute if score @s sf.coherence matches ..3 run scoreboard players set @s sf.coherence 3

particle minecraft:sculk_soul ~ ~1 ~ 1 1 1 0.02 4
playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.4 0.5

execute if score @s sf.vigil_timer matches 8 run function sf:forgotten/memory/1
execute if score @s sf.vigil_timer matches 16 run function sf:forgotten/memory/2
execute if score @s sf.vigil_timer matches 24 run function sf:forgotten/memory/3
execute if score @s sf.vigil_timer matches 32 run function sf:forgotten/memory/4

execute if score @s sf.vigil_timer matches 40.. run function sf:forgotten/vigil_complete