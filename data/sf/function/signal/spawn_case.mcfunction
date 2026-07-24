# signal/spawn_case.mcfunction
# Opens a standard case at the signal owner's current position.

execute if data storage sf:case {state:"active"} run return run function sf:signal/msg_active

function sf:case/roll_ghost

data modify storage sf:case id set from storage sf:temp case.id
data modify storage sf:case mode set value "standard"

function sf:case/open

title @a[tag=sf.case_participant] times 5 45 15
title @a[tag=sf.case_participant] title {"text":"CASE OPEN","color":"#7A5CFF","bold":true}
title @a[tag=sf.case_participant] subtitle {"text":"gather three signs. name it. bind it.","color":"gray","italic":true}

execute as @a[tag=sf.case_participant] at @s run playsound minecraft:block.bell.use player @s ~ ~ ~ 0.55 0.55
execute as @a[tag=sf.case_participant] at @s run playsound minecraft:entity.allay.ambient_with_item player @s ~ ~ ~ 0.25 0.65

data modify storage sf:temp vline set value "That's the source. Whatever crossed over here, identify it before it learns too much about you."
function sf:quest/vance

tellraw @a[tag=sf.case_participant] [{"text":"── ","color":"dark_gray"},{"text":"UMBRA CASE OPEN","color":"#7A5CFF","bold":true},{"text":" ──","color":"dark_gray"}]
tellraw @a[tag=sf.case_participant] [{"text":"  OBJECTIVE 01  ","color":"#6A6A78","bold":true},{"text":"Confirm three evidence types.","color":"gray"}]
tellraw @a[tag=sf.case_participant] [{"text":"  OBJECTIVE 02  ","color":"#6A6A78","bold":true},{"text":"Identify the manifestation.","color":"gray"}]
tellraw @a[tag=sf.case_participant] [{"text":"  OBJECTIVE 03  ","color":"#6A6A78","bold":true},{"text":"Complete containment.","color":"gray"}]