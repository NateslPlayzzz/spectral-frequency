# tool/contain/reject.mcfunction — wrong or incomplete ID; the Hollow bites back
title @s times 3 25 8
title @s subtitle {"text":"you have not named it","color":"dark_red","italic":true}
title @s title {"text":" "}
playsound minecraft:entity.warden.sonic_boom hostile @s ~ ~ ~ 0.8 0.7
scoreboard players remove @s sf.coherence 10