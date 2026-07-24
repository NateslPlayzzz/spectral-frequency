# tool/contain/release_target_macro.mcfunction
# Macro context: {dimension:"namespace:id"}

$execute in $(dimension) run tag @e[type=minecraft:marker,tag=sf.contain_target] remove sf.contain_target
$execute in $(dimension) run tag @e[type=minecraft:marker,tag=sf.contain_candidate] remove sf.contain_candidate