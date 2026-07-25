# tool/contain/reject.mcfunction
# A failed binding deliberately does not reveal whether the evidence record,
# classification, or both were incorrect.

scoreboard players set @s sf.tool_cd 20

title @s times 3 30 10
title @s subtitle {"text":"the classification does not hold","color":"dark_red","italic":true}
title @s title {"text":" "}

playsound minecraft:entity.warden.sonic_boom hostile @s ~ ~ ~ 0.8 0.7
playsound minecraft:block.respawn_anchor.deplete hostile @s ~ ~ ~ 0.5 0.8

particle minecraft:reverse_portal ~ ~1 ~ 0.25 0.45 0.25 0.02 18

scoreboard players remove @s sf.coherence 10
execute if score @s sf.coherence matches ..0 run scoreboard players set @s sf.coherence 0

tellraw @s [{"text":"[","color":"dark_gray"},{"text":"FOCUS","color":"#C89BFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Binding rejected. Recheck the recorded signs and your filed classification.","color":"#FFC36B"}]