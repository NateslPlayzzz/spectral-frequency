# forgotten/choose_remember.mcfunction
# VIGIL: remember Thorne whole and break the Frame's imposed erasure.

execute unless data storage sf:forgotten {state:"choice"} run return 0
execute unless entity @s[tag=sf.forgotten_witness] run return 0

data modify storage sf:forgotten state set value "epilogue"
data modify storage sf:forgotten ending set value "vigil"

scoreboard players set @s sf.forgotten_phase 5
scoreboard players set @s sf.vigil_timer 0
scoreboard players set @s sf.choice_hold 0
scoreboard players set @s sf.choice_path 0

data modify storage sf:temp finale.ending set value "vigil"
function sf:forgotten/profile/complete

playsound minecraft:block.beacon.power_select player @s ~ ~ ~ 1 1.0
playsound minecraft:entity.allay.item_given player @s ~ ~ ~ 1 0.8

execute at @e[type=minecraft:marker,tag=sf.forgotten,sort=nearest,limit=1] run particle minecraft:end_rod ~ ~1 ~ 0.6 1 0.6 0.15 120
execute at @e[type=minecraft:marker,tag=sf.forgotten,sort=nearest,limit=1] run particle minecraft:totem_of_undying ~ ~1 ~ 0.5 1 0.5 0.3 80

title @s times 20 100 40
title @s title {"text":"REMEMBERED","color":"#C89BFF","bold":true}
title @s subtitle {"text":"the Vigil holds","color":"gray"}

data modify storage sf:temp vline set value "I'm... whole. I'm WHOLE. I had forgotten what this felt like — to be a person and not a wound. Thank you. I won't forget you. I can't, now."
function sf:forgotten/voice

scoreboard players set @s sf.coherence 100

kill @e[tag=sf.forgotten]

advancement grant @s only sf:ending_vigil