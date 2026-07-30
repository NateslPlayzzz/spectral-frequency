# core/runtime/constants.mcfunction
# Rebuilds configuration mirrors without resetting active case timers.

scoreboard players set #hundred sf.data 100
scoreboard players set #two sf.data 2
scoreboard players set #four sf.data 4
scoreboard players set #ten sf.data 10
scoreboard players set #neg sf.data -1
scoreboard players set #fifty sf.data 50
scoreboard players set #revive_scale sf.data 100

scoreboard players set #ambient_drain sf.data 1
scoreboard players set #recover_rate sf.data 3
scoreboard players set #world_forget sf.data 1
scoreboard players set #sight_drain sf.data 4

scoreboard players set #contain_need sf.data 80
scoreboard players set #contain_drain sf.data 1

scoreboard players set #hunt_grace sf.data 30
scoreboard players set #hunt_cooldown sf.data 25

scoreboard players set #revive_need sf.data 10
scoreboard players set #revive_cost sf.data 2

scoreboard players set #flashlight_warmth sf.data 1
scoreboard players set #incense_cooldown sf.data 60

scoreboard players set #photo_reward sf.data 10
scoreboard players set #photo_cooldown sf.data 15

scoreboard players set #sensor_radius sf.data 5

scoreboard players set #totem_duration sf.data 60
scoreboard players set #totem_recover sf.data 1

scoreboard players set #radio_cooldown sf.data 2400
scoreboard players set #offer_chance sf.data 0
scoreboard players set #req_limit sf.data 2

execute store result score #ambient_drain sf.data run data get storage sf:config ambient_drain 1
execute store result score #recover_rate sf.data run data get storage sf:config recover_rate 1
execute store result score #world_forget sf.data run data get storage sf:config world_forget 1
execute store result score #sight_drain sf.data run data get storage sf:config sight_drain 1

execute store result score #contain_need sf.data run data get storage sf:config contain_need 1
execute store result score #contain_drain sf.data run data get storage sf:config contain_drain 1

execute store result score #hunt_grace sf.data run data get storage sf:config hunt_grace 1
execute store result score #hunt_cooldown sf.data run data get storage sf:config hunt_cooldown 1

execute store result score #revive_need sf.data run data get storage sf:config revive_need 1
execute store result score #revive_cost sf.data run data get storage sf:config revive_cost 1

execute store result score #flashlight_warmth sf.data run data get storage sf:config flashlight_warmth 1
execute store result score #incense_cooldown sf.data run data get storage sf:config incense_cooldown 1

execute store result score #photo_reward sf.data run data get storage sf:config photo_reward 1
execute store result score #photo_cooldown sf.data run data get storage sf:config photo_cooldown 1

execute store result score #sensor_radius sf.data run data get storage sf:config sensor_radius 1

execute store result score #totem_duration sf.data run data get storage sf:config totem_duration 1
execute store result score #totem_recover sf.data run data get storage sf:config totem_recover 1

execute store result score #radio_cooldown sf.data run data get storage sf:config radio_cooldown 1
execute store result score #offer_chance sf.data run data get storage sf:config offer_chance 1
execute store result score #req_limit sf.data run data get storage sf:config requisition_limit 1

# These are active runtime counters and must survive /reload.
execute unless score #case_age sf.data = #case_age sf.data run scoreboard players set #case_age sf.data 0
execute unless score #hunt_roll_cd sf.data = #hunt_roll_cd sf.data run scoreboard players set #hunt_roll_cd sf.data 0
# Transient evidence confirmation state.
# Preserve active provisional readings across ordinary runtime reloads, but
# initialize them when loading an older world that has no score yet.

execute unless score #pending_emf sf.data = #pending_emf sf.data run scoreboard players set #pending_emf sf.data 0
execute unless score #pending_thermo sf.data = #pending_thermo sf.data run scoreboard players set #pending_thermo sf.data 0
execute unless score #pending_box sf.data = #pending_box sf.data run scoreboard players set #pending_box sf.data 0
execute unless score #pending_writing sf.data = #pending_writing sf.data run scoreboard players set #pending_writing sf.data 0
execute unless score #scan_near sf.data = #scan_near sf.data run scoreboard players set #scan_near sf.data 0

# Identifies the current global investigation generation.
# Traces retain this value so residue from old unloaded chunks cannot
# contaminate a later investigation.
execute unless score #case_serial sf.data = #case_serial sf.data run scoreboard players set #case_serial sf.data 0