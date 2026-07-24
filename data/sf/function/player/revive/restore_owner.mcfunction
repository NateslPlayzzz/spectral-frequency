# player/revive/restore_owner.mcfunction
# Macro context:
# {
#   owner:[I;...],
#   dimension:"namespace:id",
#   x:<number>,
#   y:<number>,
#   z:<number>
# }
#
# Teleport before wake changes sf.claimed from 1 to 0.

$execute as @a[nbt={UUID:$(owner)},scores={sf.claimed=1..}] in $(dimension) run tp @s $(x) $(y) $(z)
$execute as @a[nbt={UUID:$(owner)},scores={sf.claimed=1..}] run function sf:player/revive/wake