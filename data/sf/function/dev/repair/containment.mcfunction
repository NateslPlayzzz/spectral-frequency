# dev/repair/containment.mcfunction
# Nondestructively cancels stale or corrupted containment authority.
#
# Preserves:
# - the active investigation
# - evidence and Journal records
# - quest progression
# - reconstructed fragments
# - Memory
# - equipment
# - case performance

execute unless data storage sf:system {enabled:true} run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"SF REPAIR","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Runtime is disabled. Containment repair was not performed.","color":"#FFC36B"}]

function sf:tool/contain/clear_all

data modify storage sf:system last_action set value "repair_containment"

tellraw @a [{"text":"[","color":"dark_gray"},{"text":"SF REPAIR","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Transient containment authority was cleared safely.","color":"#9BFFB0"}]
tellraw @a [{"text":"  The active investigation, evidence records, progression, Memory, and equipment were preserved.","color":"gray"}]