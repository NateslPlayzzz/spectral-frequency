# core/reinstall.mcfunction
# Rebuilds a fully purged installation from schema zero.

execute unless data storage sf:system {purged:true} run tellraw @a [{"text":"[","color":"dark_gray"},{"text":"SPECTRAL FREQUENCY","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"This installation has not been fully purged. Use /function sf:core/enable for a soft-disabled runtime.","color":"#FFC36B"}]
execute unless data storage sf:system {purged:true} run return 0

schedule clear sf:core/purge/expire
data remove storage sf:system purge_armed

# Recreate every scoreboard, bossbar, and base storage record.
function sf:core/install/fresh

data modify storage sf:system last_action set value "reinstalled"

# Rebuild definitions, constants, bars, and scheduled loops.
function sf:core/runtime/load

# Attach currently online players immediately.
execute as @a run function sf:player/join

tellraw @a [{"text":"[","color":"dark_gray"},{"text":"SPECTRAL FREQUENCY","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Clean installation rebuilt successfully.","color":"#9BFFB0"}]
tellraw @a [{"text":"  Schema 100 is active. Online Investigators were attached as new profiles.","color":"gray"}]

execute if data storage sf:system {purge_remove_gear:true} run tellraw @a [{"text":"  Deferred equipment cleanup remains active for offline players returning after this purge.","color":"#FFC36B"}]