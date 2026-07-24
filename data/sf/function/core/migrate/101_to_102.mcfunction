# core/migrate/101_to_102.mcfunction
# Additive migration from schema 101 to schema 102.
#
# Adds:
# - per-player finale:{state,ending}
# - authoritative global Forgotten lifecycle state
#
# Existing progression is preserved.

execute unless data storage sf:player_data entries run data modify storage sf:player_data entries set value []

# Begin idle unless an older finale appears to have been interrupted.
data modify storage sf:forgotten state set value "idle"

execute if data storage sf:forgotten thin run data modify storage sf:forgotten state set value "repair_required"
execute if entity @e[tag=sf.forgotten] run data modify storage sf:forgotten state set value "repair_required"
execute if entity @a[tag=sf.forgotten_witness] run data modify storage sf:forgotten state set value "repair_required"

# Online profiles migrate immediately. Offline profiles migrate lazily on join.
execute as @a run function sf:player/data/ensure

data modify storage sf:system version set value "1.0"
data modify storage sf:system build set value "stabilization"
data modify storage sf:system schema set value 102
data modify storage sf:system enabled set value true
data modify storage sf:system purged set value false
data modify storage sf:system last_action set value "migrate_101_to_102"