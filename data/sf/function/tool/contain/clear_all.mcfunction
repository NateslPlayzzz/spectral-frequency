# tool/contain/clear_all.mcfunction
# Cancels every loaded transient containment channel.
#
# Preserves:
# - active case ownership
# - evidence records
# - permanent progression
# - equipment
# - Memory
#
# This is safe during reload, administrative repair, case teardown,
# soft uninstall, and fresh case initialization.

# Release the shared manifestation target while authoritative case-dimension
# storage is still available.
function sf:tool/contain/release_target

# Clear all online player-side containment state.
scoreboard players set @a sf.contain_active 0
scoreboard players set @a sf.contain_progress 0

tag @a remove sf.contain_operator
tag @a remove sf.contain_probe

# Remove any same-command activation residue.
tag @e[type=minecraft:marker,tag=sf.contain_candidate] remove sf.contain_candidate