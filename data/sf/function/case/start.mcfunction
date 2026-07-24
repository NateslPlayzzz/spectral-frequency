# case/start.mcfunction
# Manual standard-case entry point.

execute unless score @s sf.quest matches 100.. run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"DISPATCH","color":"#5AC8C8","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Complete the guided investigation before opening field cases.","color":"gray"}]

execute if score @s sf.claimed matches 1.. run return 0

execute if data storage sf:case {state:"active"} run return run tellraw @s [{"text":"◈ ","color":"#7A5CFF"},{"text":"A case is already active. Resolve or clear it first.","color":"red"}]

function sf:case/roll_ghost

data modify storage sf:case id set from storage sf:temp case.id
data modify storage sf:case mode set value "standard"

function sf:case/open

title @a[tag=sf.case_participant] times 10 50 20
title @a[tag=sf.case_participant] title {"text":"CASE OPEN","color":"#7A5CFF","bold":true}
title @a[tag=sf.case_participant] subtitle {"text":"something is here. find out what.","color":"gray","italic":true}

execute as @a[tag=sf.case_participant] at @s run playsound minecraft:block.bell.use player @s ~ ~ ~ 0.6 0.5

tellraw @a[tag=sf.case_participant] [{"text":"◈ ","color":"#7A5CFF"},{"text":"Investigation begun. Gather evidence, name it, bind it.","color":"#8A8A98"}]