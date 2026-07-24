# forgotten/vigil_complete.mcfunction — the truth is told; the choice opens
scoreboard players set @s sf.forgotten_phase 3
scoreboard players set @s sf.choice_hold 0
scoreboard players set @s sf.choice_path 0
title @s times 20 60 20
title @s title {"text":" "}
title @s subtitle {"text":"the choice","color":"#8B0000","italic":true}
playsound minecraft:block.beacon.activate master @s ~ ~ ~ 1 0.5
data modify storage sf:temp vline set value "So. Here we are. You hold both ends of it now."
function sf:forgotten/voice
tellraw @s ""
tellraw @s [{"text":"   Hold ","color":"gray"},{"text":"the Containment Focus","color":"#5AC8C8"},{"text":" toward him to ","color":"gray"},{"text":"SEAL","color":"#5AC8C8","bold":true},{"text":" \u2014 finish what UMBRA began.","color":"gray"}]
tellraw @s [{"text":"   Hold ","color":"gray"},{"text":"an empty hand","color":"#C89BFF"},{"text":" toward him to ","color":"gray"},{"text":"REMEMBER","color":"#C89BFF","bold":true},{"text":" \u2014 and let him go.","color":"gray"}]
tellraw @s [{"text":"   (hold, and do not look away)","color":"dark_gray","italic":true}]
data modify storage sf:temp vline set value "Whatever you choose \u2014 I'm still here. I won't stop you. I don't think I have the right to."
function sf:quest/vance