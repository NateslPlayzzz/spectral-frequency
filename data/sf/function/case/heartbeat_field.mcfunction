# case/heartbeat_field.mcfunction
# Macro context:
# {
#   dimension:"namespace:id",
#   x:<integer>,
#   y:<integer>,
#   z:<integer>
# }

$execute in $(dimension) positioned $(x) $(y) $(z) if entity @a[tag=sf.case_valid_online,gamemode=!spectator,scores={sf.claimed=0},distance=..96] run scoreboard players set #case_field sf.data 1