# core/load.mcfunction
# Quiet lifecycle dispatcher for Spectral Frequency 1.0.

# A full purge leaves a tombstone so /reload does not immediately reinstall.
execute if data storage sf:system {purged:true} run return 0

# Worlds using the pre-schema build first enter schema 100.
execute if data storage sf:config initialized unless data storage sf:system schema run function sf:core/migrate/legacy_to_100

# No legacy marker and no schema means a genuine fresh installation.
execute unless data storage sf:system schema run function sf:core/install/fresh

# Schema 100 gains the persistent Recovered Documents archive through an
# additive, progression-preserving migration.
execute if data storage sf:system {schema:100} run function sf:core/migrate/100_to_101

# Refuse to run against an unknown schema rather than silently rewriting it.
execute unless data storage sf:system {schema:101} run return run tellraw @a [{"text":"[","color":"dark_gray"},{"text":"SPECTRAL FREQUENCY","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Unsupported persistent schema. Runtime loading was stopped to protect Investigator data.","color":"red"}]

# Repair ordinary metadata without changing the schema or enabled state.
execute unless data storage sf:system enabled run data modify storage sf:system enabled set value true
data modify storage sf:system version set value "1.0"
data modify storage sf:system build set value "stabilization"

function sf:core/runtime/load