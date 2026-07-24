# dev/health/containment_dimension.mcfunction
# Macro context: {dimension:"namespace:id"}

$execute in $(dimension) store result score #health_contain_target sf.data if entity @e[type=minecraft:marker,tag=sf.contain_target]

$execute in $(dimension) store result score #health_contain_candidate sf.data if entity @e[type=minecraft:marker,tag=sf.contain_candidate]

$execute in $(dimension) if entity @e[type=minecraft:marker,tag=sf.contain_target,tag=sf.state.warning] run scoreboard players set #health_contain_violent sf.data 1

$execute in $(dimension) if entity @e[type=minecraft:marker,tag=sf.contain_target,tag=sf.state.hunt] run scoreboard players set #health_contain_violent sf.data 1