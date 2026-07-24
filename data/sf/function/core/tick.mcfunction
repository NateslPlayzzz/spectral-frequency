# core/tick.mcfunction
# Minimal runtime and session dispatcher.

execute unless data storage sf:system {enabled:true} run return 0

# A missing leave_seen score identifies a player who has never attached to
# this installation, including players returning after a full data purge.
execute as @a unless score @s sf.leave_seen = @s sf.leave_seen run function sf:player/join

# Handles ordinary new players and reattachment after a soft uninstall.
execute as @a[tag=!spectral.sf_init] run function sf:player/join

# leave_now increments when the previous session ended. A mismatch therefore
# identifies the first tick of a new connection.
execute as @a[tag=spectral.sf_init] unless score @s sf.leave_seen = @s sf.leave_now run function sf:player/reconnect

execute as @a[tag=spectral.sf_init] at @s run function sf:player/tick