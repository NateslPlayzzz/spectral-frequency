# forgotten/runtime/ensure_entity_macro.mcfunction
# Macro context: {dimension:"namespace:id",x:<int>,y:<int>,z:<int>}

$execute in $(dimension) positioned $(x) $(y) $(z) if entity @s[distance=..64] unless entity @e[type=minecraft:marker,tag=sf.forgotten,distance=..8] run function sf:forgotten/spawn