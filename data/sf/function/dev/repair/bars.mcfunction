# dev/repair/bars.mcfunction
# Rebuilds authoritative ownership of the eight Memory bossbars.

execute unless data storage sf:system {enabled:true} run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"SF REPAIR","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Runtime is disabled. Memory bossbars cannot be rebuilt.","color":"#FFC36B"}]

# Remove stale player ownership before rebuilding the pool.
bossbar set sf:mem0 players
bossbar set sf:mem1 players
bossbar set sf:mem2 players
bossbar set sf:mem3 players
bossbar set sf:mem4 players
bossbar set sf:mem5 players
bossbar set sf:mem6 players
bossbar set sf:mem7 players

function sf:ui/rebuild_bars

# Immediately refresh the visible values after reassignment.
execute as @a[tag=spectral.sf_init] run function sf:memory/update_fast

data modify storage sf:system last_action set value "repair_bars"

tellraw @s [{"text":"[","color":"dark_gray"},{"text":"SF REPAIR","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Memory bossbar ownership was rebuilt.","color":"#9BFFB0"}]
tellraw @s [{"text":"  The current pool supports eight simultaneous Investigators.","color":"gray"}]