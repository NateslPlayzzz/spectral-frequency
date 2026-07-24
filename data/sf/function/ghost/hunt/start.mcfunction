# ghost/hunt/start.mcfunction

tag @s remove sf.state.idle
tag @s remove sf.state.warning
tag @s remove sf.state.cooldown
tag @s add sf.state.hunt
tag @s remove sf.roaming

scoreboard players set @s sf.hunt_timer 30

execute as @a[tag=sf.case_participant] at @s run playsound minecraft:entity.warden.roar hostile @s ~ ~ ~ 0.7 0.8
execute as @a[tag=sf.case_participant] at @s run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 1 0.4

title @a[tag=sf.case_participant] times 5 40 15
title @a[tag=sf.case_participant] title {"text":" "}
title @a[tag=sf.case_participant] subtitle {"text":"it remembers you","color":"dark_red","italic":true}