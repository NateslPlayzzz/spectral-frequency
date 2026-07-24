# case/release_claimed_at.mcfunction
# Macro context:
# {
#   dimension:"namespace:id",
#   x:<int>,
#   y:<int>,
#   z:<int>
# }

$execute in $(dimension) run tp @s $(x) $(y) $(z)