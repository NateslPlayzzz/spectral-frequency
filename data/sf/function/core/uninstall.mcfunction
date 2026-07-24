# core/uninstall.mcfunction
# Nondestructive runtime shutdown.
#
# Preserves:
# - UUID profiles
# - quest progression
# - reconstructed fragments
# - Bench unlocks
# - requisition history
# - pending signal records
# - advancements
# - scoreboards
# - player-owned equipment

data modify storage sf:system enabled set value false
data modify storage sf:system last_action set value "soft_uninstall"

# Stop every known scheduled SF process.
schedule clear sf:core/loop/fast
schedule clear sf:core/loop/1_second
schedule clear sf:core/loop/5_second
schedule clear sf:core/loop/30_second

schedule clear sf:forgotten/epilogue_protocol
schedule clear sf:forgotten/epilogue_vigil
schedule clear sf:forgotten/vigil_begin
schedule clear sf:player/claim/solo_release
schedule clear sf:player/welcome_title
schedule clear sf:quest/intro_1

# Cancel transient containment authority before player and case cleanup.
function sf:tool/contain/clear_all

# Return Taken players before removing runtime ownership.
execute as @a[scores={sf.claimed=1..}] run function sf:core/restore_player
execute as @a run function sf:core/cleanup_player

# Remove loaded Spectral Frequency runtime entities.
kill @e[type=minecraft:marker,tag=sf.ghost]
kill @e[tag=sf.anchor]
kill @e[tag=sf.uv_trace]
kill @e[tag=sf.remnant]
kill @e[type=minecraft:marker,tag=sf.ward]
kill @e[type=minecraft:marker,tag=sf.sensor]
kill @e[type=minecraft:marker,tag=sf.bench]
kill @e[tag=sf.case_source]
kill @e[tag=sf.dispatch_origin]
kill @e[tag=sf.forgotten]

# Close the active runtime case without touching permanent progression.
data modify storage sf:case state set value "inactive"
data remove storage sf:case id
data remove storage sf:case mode
data remove storage sf:case owner
data remove storage sf:case dimension
data remove storage sf:case spawn

# Remove unfinished temporary Bench transactions.
data remove storage sf:bench candidate
data remove storage sf:bench scan
data remove storage sf:bench current
data remove storage sf:bench consume

# Clear and hide the Memory pool without deleting it.
bossbar set sf:mem0 players
bossbar set sf:mem1 players
bossbar set sf:mem2 players
bossbar set sf:mem3 players
bossbar set sf:mem4 players
bossbar set sf:mem5 players
bossbar set sf:mem6 players
bossbar set sf:mem7 players

bossbar set sf:mem0 visible false
bossbar set sf:mem1 visible false
bossbar set sf:mem2 visible false
bossbar set sf:mem3 visible false
bossbar set sf:mem4 visible false
bossbar set sf:mem5 visible false
bossbar set sf:mem6 visible false
bossbar set sf:mem7 visible false

tellraw @a [{"text":"[","color":"dark_gray"},{"text":"SPECTRAL FREQUENCY","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Runtime disabled safely. Player progression and equipment were preserved.","color":"#FFC36B"}]
tellraw @a [{"text":"  Re-enable with ","color":"gray"},{"text":"/function sf:core/enable","color":"#9BFFB0"},{"text":".","color":"gray"}]