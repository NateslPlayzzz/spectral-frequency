# dev/repair/players.mcfunction
# Repairs every currently online Investigator.
#
# Offline players are repaired automatically when they next join.

execute unless data storage sf:system {enabled:true} run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"SF REPAIR","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Runtime is disabled. Re-enable or reinstall Spectral Frequency before repairing players.","color":"#FFC36B"}]

execute as @a run function sf:dev/repair/player_worker

# Rebuild the shared eight-slot Memory pool once after all profiles are ready.
function sf:ui/rebuild_bars

# Reclassify Memory without artificial band-change effects.
execute as @a[tag=spectral.sf_init] run function sf:memory/update_fast
scoreboard players operation @a[tag=spectral.sf_init] sf.coherence_band_prev = @a[tag=spectral.sf_init] sf.coherence_band
execute as @a[tag=spectral.sf_init] run function sf:memory/update

data modify storage sf:system last_action set value "repair_online_players"

tellraw @a [{"text":"[","color":"dark_gray"},{"text":"SF REPAIR","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"All online Investigator profiles and runtime state were repaired.","color":"#9BFFB0"}]
tellraw @a [{"text":"  Offline Investigators will repair automatically when they reconnect.","color":"gray"}]