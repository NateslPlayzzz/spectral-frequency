# core/config/defaults.mcfunction
# Per-key idempotent configuration defaults.

execute unless data storage sf:config ambient_drain run data modify storage sf:config ambient_drain set value 1
execute unless data storage sf:config recover_rate run data modify storage sf:config recover_rate set value 3
execute unless data storage sf:config world_forget run data modify storage sf:config world_forget set value 1
execute unless data storage sf:config sight_drain run data modify storage sf:config sight_drain set value 4

execute unless data storage sf:config contain_need run data modify storage sf:config contain_need set value 80
execute unless data storage sf:config contain_drain run data modify storage sf:config contain_drain set value 1

execute unless data storage sf:config hunt_grace run data modify storage sf:config hunt_grace set value 30
execute unless data storage sf:config hunt_cooldown run data modify storage sf:config hunt_cooldown set value 25

# Remnant revival:
# 10 one-second stages at 2 Memory each.
execute unless data storage sf:config revive_need run data modify storage sf:config revive_need set value 10
execute unless data storage sf:config revive_cost run data modify storage sf:config revive_cost set value 2

execute unless data storage sf:config flashlight_warmth run data modify storage sf:config flashlight_warmth set value 1
execute unless data storage sf:config incense_cooldown run data modify storage sf:config incense_cooldown set value 60

execute unless data storage sf:config photo_reward run data modify storage sf:config photo_reward set value 10
execute unless data storage sf:config photo_cooldown run data modify storage sf:config photo_cooldown set value 15

execute unless data storage sf:config sensor_radius run data modify storage sf:config sensor_radius set value 5

# Radio cooldown is stored in game ticks.
# 2400 ticks = approximately two minutes at 20 TPS.
execute unless data storage sf:config radio_cooldown run data modify storage sf:config radio_cooldown set value 2400

# Legacy offer setting retained only for migration compatibility.
execute unless data storage sf:config offer_chance run data modify storage sf:config offer_chance set value 0

# One-time migration from the former random-offer dispatch system.
execute unless data storage sf:config dispatch_radio_v1 run data modify storage sf:config radio_cooldown set value 2400
execute unless data storage sf:config dispatch_radio_v1 run data modify storage sf:config offer_chance set value 0
execute unless data storage sf:config dispatch_radio_v1 run data modify storage sf:config dispatch_radio_v1 set value true

# One-time migration from the original automatic 50-second revival.
execute unless data storage sf:config revive_interaction_v1 run data modify storage sf:config revive_need set value 10
execute unless data storage sf:config revive_interaction_v1 run data modify storage sf:config revive_cost set value 2
execute unless data storage sf:config revive_interaction_v1 run data modify storage sf:config revive_interaction_v1 set value true

# Attuned Bench catalog trigger.
execute unless data storage sf:config bench_catalog_v1 run scoreboard objectives add sf.bench_menu trigger
execute unless data storage sf:config bench_catalog_v1 run data modify storage sf:config bench_catalog_v1 set value true

scoreboard players enable @a sf.bench_menu

# Emergency equipment-requisition allowance.
execute unless data storage sf:config requisition_limit run data modify storage sf:config requisition_limit set value 2

# Existing worlds receive the requisition runtime mirror objective once.
execute unless data storage sf:config requisition_claims_v1 run scoreboard objectives add sf.req_used dummy
execute unless data storage sf:config requisition_claims_v1 run data modify storage sf:config requisition_claims_v1 set value true

scoreboard players add @a sf.req_used 0

# Existing schema-102 worlds receive the case-local classification objective once.
execute unless data storage sf:config identification_v1 run scoreboard objectives add sf.case_id dummy
execute unless data storage sf:config identification_v1 run data modify storage sf:config identification_v1 set value true

scoreboard players add @a sf.case_id 0

data modify storage sf:config initialized set value true