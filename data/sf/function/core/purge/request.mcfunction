# core/purge/request.mcfunction
# Arms the destructive full-purge command for thirty seconds.
#
# This command does not remove anything by itself.

execute if data storage sf:system {purged:true} run tellraw @a [{"text":"[","color":"dark_gray"},{"text":"SPECTRAL FREQUENCY","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"This installation is already fully purged. Use /function sf:core/reinstall to rebuild it.","color":"#FFC36B"}]
execute if data storage sf:system {purged:true} run return 0

execute if data storage sf:system {purge_armed:true} run tellraw @a [{"text":"[","color":"dark_gray"},{"text":"SPECTRAL FREQUENCY","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"A full purge is already armed.","color":"#FFC36B"}]
execute if data storage sf:system {purge_armed:true} run return 0

# Every new request begins by preserving player-owned equipment.
# The administrator must explicitly opt into equipment deletion.
data remove storage sf:system purge_remove_gear

data modify storage sf:system purge_armed set value true
data modify storage sf:system last_action set value "purge_requested"

schedule function sf:core/purge/expire 30s replace

tellraw @a [{"text":"","color":"white"},{"text":"[","color":"dark_gray"},{"text":"SPECTRAL FREQUENCY","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"FULL DATA PURGE ARMED","color":"#FF5A5A","bold":true}]
tellraw @a [{"text":"  This will permanently remove all Spectral Frequency scoreboards, storages, bossbars, advancements, progression, and loaded runtime entities.","color":"#FFC36B"}]
tellraw @a [{"text":"  Player-owned equipment will be preserved by default.","color":"gray"}]
tellraw @a [{"text":"  Optional equipment deletion: ","color":"gray"},{"text":"/function sf:core/purge/gear","color":"#FF8E8E"}]
tellraw @a [{"text":"  Confirm within 30 seconds: ","color":"gray"},{"text":"/function sf:core/purge/confirm","color":"#FF5A5A","bold":true}]
tellraw @a [{"text":"  Cancel: ","color":"gray"},{"text":"/function sf:core/purge/cancel","color":"#9BFFB0"}]