# forgotten/threshold_tick_macro.mcfunction
# Macro context: {dimension:"namespace:id",x:<int>,y:<int>,z:<int>}

$execute unless data entity @s {Dimension:"$(dimension)"} run return run title @s actionbar {"text":"return to the fracture","color":"#8B0000","italic":true}

$execute in $(dimension) positioned $(x) $(y) $(z) unless entity @s[distance=..12] run return run title @s actionbar {"text":"return to the place where the seal broke","color":"#8B0000","italic":true}

execute unless score @s sf.coherence_band matches 0 run return run title @s actionbar {"text":"let your coherence fall to the edge of erasure...","color":"#8B0000","italic":true}

function sf:forgotten/threshold_reached