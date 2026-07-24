# forgotten/choice_tick_macro.mcfunction
# Macro context: {dimension:"namespace:id",x:<int>,y:<int>,z:<int>}

$execute unless data entity @s {Dimension:"$(dimension)"} run return run function sf:forgotten/choice/reset

$execute in $(dimension) positioned $(x) $(y) $(z) unless entity @s[distance=..30] run return run function sf:forgotten/choice/reset

function sf:forgotten/choice/work