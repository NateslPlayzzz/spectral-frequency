# dev/repair/schedules.mcfunction
# Clears and re-arms every recurring Spectral Frequency scheduler.
#
# Does not run gameplay workers immediately and does not modify progression.

execute unless data storage sf:system {enabled:true} run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"SF REPAIR","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Runtime is disabled. Scheduled loops were not restarted.","color":"#FFC36B"}]

schedule clear sf:core/loop/fast
schedule clear sf:core/loop/1_second
schedule clear sf:core/loop/5_second
schedule clear sf:core/loop/30_second

# Reset diagnostic heartbeats to the current game time.
execute store result score #hb_fast sf.data run time query gametime
scoreboard players operation #hb_1s sf.data = #hb_fast sf.data
scoreboard players operation #hb_5s sf.data = #hb_fast sf.data
scoreboard players operation #hb_30s sf.data = #hb_fast sf.data

# Each wrapper re-arms itself before processing gameplay.
schedule function sf:core/loop/fast 2t replace
schedule function sf:core/loop/1_second 1s replace
schedule function sf:core/loop/5_second 5s replace
schedule function sf:core/loop/30_second 30s replace

data modify storage sf:system last_action set value "repair_schedules"

tellraw @s [{"text":"[","color":"dark_gray"},{"text":"SF REPAIR","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Fast, one-second, five-second, and thirty-second loops were re-armed.","color":"#9BFFB0"}]