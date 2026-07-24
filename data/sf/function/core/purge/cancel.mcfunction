# core/purge/cancel.mcfunction
# Cancels an armed full purge.

execute unless data storage sf:system {purge_armed:true} run tellraw @a [{"text":"[","color":"dark_gray"},{"text":"SPECTRAL FREQUENCY","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"No full purge is currently armed.","color":"gray"}]
execute unless data storage sf:system {purge_armed:true} run return 0

schedule clear sf:core/purge/expire

data remove storage sf:system purge_armed
data remove storage sf:system purge_remove_gear
data modify storage sf:system last_action set value "purge_cancelled"

tellraw @a [{"text":"[","color":"dark_gray"},{"text":"SPECTRAL FREQUENCY","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Full purge cancelled. Runtime data was not removed.","color":"#9BFFB0"}]