# core/load.mcfunction
# Quiet lifecycle dispatcher for Spectral Frequency 1.0.

# A full purge leaves a tombstone so /reload does not immediately reinstall.
execute if data storage sf:system {purged:true} run return 0

# Worlds using the pre-schema build already have sf:config.initialized.
execute if data storage sf:config initialized unless data storage sf:system schema run function sf:core/migrate/legacy_to_100

# No legacy marker and no schema means a genuine fresh installation.
execute unless data storage sf:system schema run function sf:core/install/fresh

# Repair system metadata without changing the enabled state.
execute unless data storage sf:system enabled run data modify storage sf:system enabled set value true
data modify storage sf:system version set value "1.0"
data modify storage sf:system build set value "stabilization"
data modify storage sf:system schema set value 100

function sf:core/runtime/load