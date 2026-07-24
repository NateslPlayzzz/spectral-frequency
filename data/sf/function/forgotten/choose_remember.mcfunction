# choose_remember.mcfunction — VIGIL: remember him whole, break the Hollow's hold
scoreboard players set @s sf.forgotten_phase 4
scoreboard players set @s sf.choice_hold 0
data modify storage sf:world ending set value "vigil"
# The release
playsound minecraft:block.beacon.power_select master @a ~ ~ ~ 1 1.0
playsound minecraft:entity.allay.item_given master @a ~ ~ ~ 1 0.8
execute at @e[tag=sf.forgotten,limit=1] run particle minecraft:end_rod ~ ~1 ~ 0.6 1 0.6 0.15 120
execute at @e[tag=sf.forgotten,limit=1] run particle minecraft:totem_of_undying ~ ~1 ~ 0.5 1 0.5 0.3 80
title @s times 20 100 40
title @s title {"text":"REMEMBERED","color":"#C89BFF","bold":true}
title @s subtitle {"text":"the Vigil holds","color":"gray"}
data modify storage sf:temp vline set value "I'm... whole. I'm WHOLE. I had forgotten what this felt like \u2014 to be a person and not a wound. Thank you. I won't forget you. I can't, now."
function sf:forgotten/voice
# Restore the player's coherence — the Hollow's grip on THEM breaks too
scoreboard players set @s sf.coherence 100
kill @e[tag=sf.forgotten]
schedule function sf:forgotten/epilogue_vigil 60t
advancement grant @s only sf:ending_vigil