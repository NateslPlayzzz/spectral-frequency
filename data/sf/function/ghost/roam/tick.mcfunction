# ghost/roam/tick.mcfunction — once/sec. Count down to the next wander; while wandering, drift.
execute if score @s sf.roam_timer matches 1.. run scoreboard players remove @s sf.roam_timer 1
# Not currently moving and timer elapsed? Pick a new wander heading.
execute if entity @s[tag=!sf.roaming] if score @s sf.roam_timer matches ..0 if predicate sf:chance/25 run function sf:ghost/roam/begin
# Currently roaming? the per-2t drift handles motion; just time out the roam.
execute if entity @s[tag=sf.roaming] if score @s sf.roam_timer matches ..0 run function sf:ghost/roam/stop