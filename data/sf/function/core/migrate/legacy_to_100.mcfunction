# core/migrate/legacy_to_100.mcfunction
# One-time migration from the pre-schema Spectral Frequency build.

# Add only objectives that did not exist in the original runtime.

execute unless data storage sf:config bench_catalog_v1 run scoreboard objectives add sf.bench_menu trigger
execute unless data storage sf:config bench_catalog_v1 run data modify storage sf:config bench_catalog_v1 set value true

execute unless data storage sf:config requisition_claims_v1 run scoreboard objectives add sf.req_used dummy
execute unless data storage sf:config requisition_claims_v1 run data modify storage sf:config requisition_claims_v1 set value true

scoreboard objectives add sf.leave_now minecraft.custom:minecraft.leave_game
scoreboard objectives add sf.leave_seen dummy

execute unless data storage sf:player_data entries run data modify storage sf:player_data entries set value []
execute unless data storage sf:case state run data modify storage sf:case state set value "inactive"

data modify storage sf:system version set value "1.0"
data modify storage sf:system build set value "stabilization"
data modify storage sf:system schema set value 100
data modify storage sf:system enabled set value true
data modify storage sf:system purged set value false