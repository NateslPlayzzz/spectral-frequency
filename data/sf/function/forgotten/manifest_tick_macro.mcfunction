# forgotten/manifest_tick_macro.mcfunction
# Macro context: {dimension:"namespace:id",x:<int>,y:<int>,z:<int>}

$execute unless data entity @s {Dimension:"$(dimension)"} run return run title @s actionbar {"text":"return to him","color":"#8B0000","italic":true}

$execute in $(dimension) positioned $(x) $(y) $(z) unless entity @s[distance=..64] run return run title @s actionbar {"text":"the manifestation waits where you left it","color":"#8B0000","italic":true}

scoreboard players add @s sf.vigil_timer 1

execute if score @s sf.vigil_timer matches 4.. run function sf:forgotten/vigil_start