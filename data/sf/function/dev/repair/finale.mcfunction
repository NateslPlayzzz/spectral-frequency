# dev/repair/finale.mcfunction
# Aborts an unresolved finale or finalizes an already-recorded epilogue.
#
# It never removes a permanent Protocol or Vigil outcome.

execute unless data storage sf:system {enabled:true} run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"SF REPAIR","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Runtime is disabled. Finale repair was not performed.","color":"#FFC36B"}]

execute if data storage sf:forgotten {state:"idle"} run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"SF REPAIR","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"No active or interrupted finale requires repair.","color":"gray"}]

# Repair the persistent witness profile even when that player is offline.
execute if data storage sf:forgotten witness run function sf:forgotten/profile/repair_macro with storage sf:forgotten

schedule clear sf:forgotten/vigil_begin
schedule clear sf:forgotten/epilogue_protocol
schedule clear sf:forgotten/epilogue_vigil

kill @e[tag=sf.forgotten]

data modify storage sf:forgotten state set value "idle"
function sf:forgotten/runtime/idle_cleanup

tag @a[tag=spectral.sf_init] remove sf.signal_checked
execute as @a[tag=spectral.sf_init] run function sf:signal/recover

function sf:ui/rebuild_bars

data modify storage sf:system last_action set value "repair_finale"

tellraw @a [{"text":"[","color":"dark_gray"},{"text":"SF REPAIR","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"The Forgotten lifecycle was returned to idle safely.","color":"#9BFFB0"}]
tellraw @a [{"text":"  Unresolved witnesses may begin again. Any recorded Protocol or Vigil outcome was preserved.","color":"gray"}]