# player/revive/wake.mcfunction
# Runs as the Taken Investigator after teleporting to their Remnant.

scoreboard players set @s sf.claimed 0
scoreboard players set @s sf.coherence 35
scoreboard players set @s sf.revive_progress 0

tag @s remove sf.solo_release_pending
tag @s remove sf.reviving

gamemode survival @s

effect clear @s minecraft:blindness
effect give @s minecraft:slowness 3 0 true
effect give @s minecraft:darkness 2 0 true
effect give @s minecraft:resistance 3 4 true

title @s times 10 55 20
title @s title {"text":"REMEMBERED","color":"#7A5CFF","bold":true}
title @s subtitle {"text":"your identity holds at thirty-five Memory","color":"white","italic":true}

playsound minecraft:entity.player.levelup player @s ~ ~ ~ 0.65 0.8
playsound minecraft:block.respawn_anchor.charge player @s ~ ~ ~ 0.45 1.15
playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.4 0.75

particle minecraft:reverse_portal ~ ~1 ~ 0.5 0.8 0.5 0.04 22
particle minecraft:end_rod ~ ~1 ~ 0.45 0.75 0.45 0.03 18

tellraw @a[tag=sf.case_participant] [{"text":"[","color":"dark_gray"},{"text":"REMNANT","color":"#C89BFF","bold":true},{"text":"] ","color":"dark_gray"},{"selector":"@s","color":"white"},{"text":" has been returned to the investigation.","color":"gray"}]