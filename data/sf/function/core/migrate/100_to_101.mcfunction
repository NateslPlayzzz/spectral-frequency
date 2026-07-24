# core/migrate/100_to_101.mcfunction
# Additive migration from schema 100 to schema 101.
#
# Adds:
# - persistent per-player documents:[]
# - profile_schema 101
#
# Preserves all existing quest, fragment, unlock, signal, requisition,
# evidence, advancement, and equipment state.

execute unless data storage sf:player_data entries run data modify storage sf:player_data entries set value []

# Online profiles migrate immediately. Offline profiles migrate lazily through
# player/data/ensure when those players next join.
execute as @a run function sf:player/data/ensure

data modify storage sf:system version set value "1.0"
data modify storage sf:system build set value "stabilization"
data modify storage sf:system schema set value 101
data modify storage sf:system enabled set value true
data modify storage sf:system purged set value false
data modify storage sf:system last_action set value "migrate_100_to_101"