# player/claim/ensure_remnant_macro.mcfunction
# Macro context:
# {
#   uuid:[I;...]
# }

$execute if entity @e[type=minecraft:interaction,tag=sf.remnant_interact,nbt={data:{sf:{owner:$(uuid)}}}] run tag @s add sf.remnant_present