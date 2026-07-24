# core/purge/gear.mcfunction
# Explicitly opts into removing Spectral Frequency items.
#
# Removes:
# - SF items from online player inventories
# - loaded dropped SF item entities
#
# Items in unloaded chunks or containers cannot be found safely.
# Offline inventories are cleared when those players first join after reinstall.

execute unless data storage sf:system {purge_armed:true} unless data storage sf:system {purged:true} run tellraw @a [{"text":"[","color":"dark_gray"},{"text":"SPECTRAL FREQUENCY","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Arm a full purge before enabling equipment removal.","color":"#FFC36B"}]
execute unless data storage sf:system {purge_armed:true} unless data storage sf:system {purged:true} run return 0

data modify storage sf:system purge_remove_gear set value true

clear @a *[custom_data~{sf:{}}]

execute as @e[type=minecraft:item] if items entity @s contents *[custom_data~{sf:{}}] run kill @s

tellraw @a [{"text":"[","color":"dark_gray"},{"text":"SPECTRAL FREQUENCY","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Equipment removal enabled.","color":"#FF8E8E"}]
tellraw @a [{"text":"  Online inventories and loaded dropped SF items were cleared.","color":"gray"}]
tellraw @a [{"text":"  Offline players will have SF items cleared on their first join after reinstall.","color":"gray"}]
tellraw @a [{"text":"  Items stored inside containers or unloaded chunks require manual removal.","color":"dark_gray"}]