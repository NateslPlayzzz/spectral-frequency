# dev/repair/player.mcfunction
# Repairs the executing Investigator without resetting progression.

execute unless data storage sf:system {enabled:true} run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"SF REPAIR","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Runtime is disabled. Re-enable or reinstall Spectral Frequency before repairing players.","color":"#FFC36B"}]

function sf:dev/repair/player_worker

# Reassign authoritative Memory bossbar ownership.
function sf:ui/rebuild_bars

# Reclassify Memory without firing artificial band-change effects.
function sf:memory/update_fast
scoreboard players operation @s sf.coherence_band_prev = @s sf.coherence_band
function sf:memory/update

data modify storage sf:system last_action set value "repair_player"

tellraw @s [{"text":"[","color":"dark_gray"},{"text":"SF REPAIR","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Your Investigator profile and runtime state were repaired.","color":"#9BFFB0"}]
tellraw @s [{"text":"  Permanent progression and equipment were preserved.","color":"gray"}]