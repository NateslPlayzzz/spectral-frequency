# core/load.mcfunction
# Quiet lifecycle dispatcher for Spectral Frequency 1.0.

# A full purge leaves a tombstone so /reload does not immediately reinstall.
execute if data storage sf:system {purged:true} run return 0

# Pre-schema worlds enter schema 100 first.
execute if data storage sf:config initialized unless data storage sf:system schema run function sf:core/migrate/legacy_to_100

# No marker and no schema means a genuine fresh installation.
execute unless data storage sf:system schema run function sf:core/install/fresh

# Ordered additive migrations.
execute if data storage sf:system {schema:100} run function sf:core/migrate/100_to_101
execute if data storage sf:system {schema:101} run function sf:core/migrate/101_to_102

# Unknown schemas must never be silently rewritten.
execute unless data storage sf:system {schema:102} run return run tellraw @a [{"text":"[","color":"dark_gray"},{"text":"SPECTRAL FREQUENCY","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Unsupported persistent schema. Runtime loading was stopped to protect Investigator data.","color":"red"}]

execute unless data storage sf:system enabled run data modify storage sf:system enabled set value true
data modify storage sf:system version set value "1.0"
data modify storage sf:system build set value "stabilization"

function sf:core/runtime/load