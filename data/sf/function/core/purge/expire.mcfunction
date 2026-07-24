# core/purge/expire.mcfunction
# Automatically disarms an unconfirmed purge request.

execute unless data storage sf:system {purge_armed:true} run return 0

data remove storage sf:system purge_armed
data remove storage sf:system purge_remove_gear
data modify storage sf:system last_action set value "purge_expired"

tellraw @a [{"text":"[","color":"dark_gray"},{"text":"SPECTRAL FREQUENCY","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Full purge confirmation expired. Nothing was removed.","color":"#9BFFB0"}]