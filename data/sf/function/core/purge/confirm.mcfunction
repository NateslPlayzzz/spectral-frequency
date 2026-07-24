# core/purge/confirm.mcfunction
# Performs the irreversible full data purge.
#
# The request must have been armed within the previous thirty seconds.

execute unless data storage sf:system {purge_armed:true} run tellraw @a [{"text":"[","color":"dark_gray"},{"text":"SPECTRAL FREQUENCY","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Full purge is not armed. Run /function sf:core/purge/request first.","color":"#FFC36B"}]
execute unless data storage sf:system {purge_armed:true} run return 0

schedule clear sf:core/purge/expire
data remove storage sf:system purge_armed

# Soft shutdown must happen before scoreboards are deleted.
function sf:core/uninstall

# Remove online player progression, advancements, and identity tags.
execute as @a run function sf:core/purge/clear_player_identity

# Remove global runtime infrastructure.
function sf:core/purge/remove_bossbars
function sf:core/purge/remove_objectives
function sf:core/purge/remove_storage

tellraw @a [{"text":"","color":"white"},{"text":"[","color":"dark_gray"},{"text":"SPECTRAL FREQUENCY","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"FULL DATA PURGE COMPLETE","color":"#FF5A5A","bold":true}]
tellraw @a [{"text":"  Scoreboards, bossbars, storage records, advancements, progression, and loaded runtime entities were removed.","color":"gray"}]
tellraw @a [{"text":"  /reload will not reinstall the datapack while the purge tombstone exists.","color":"#FFC36B"}]
tellraw @a [{"text":"  Reinstall explicitly with ","color":"gray"},{"text":"/function sf:core/reinstall","color":"#9BFFB0"},{"text":".","color":"gray"}]
tellraw @a [{"text":"  Limitation: entities and items in unloaded chunks or containers cannot be removed globally and may require manual cleanup.","color":"dark_gray"}]