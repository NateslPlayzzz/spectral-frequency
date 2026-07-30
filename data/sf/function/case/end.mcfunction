# case/end.mcfunction
# Manual or administrative teardown.

execute unless data storage sf:case {state:"active"} run return run tellraw @s [{"text":"◈ ","color":"#7A5CFF"},{"text":"No case is currently active.","color":"gray"}]

function sf:tool/contain/clear_all

tellraw @a[tag=sf.case_participant] [{"text":"◈ ","color":"#7A5CFF"},{"text":"Case cleared. All active field records have been closed.","color":"#8A8A98"}]

execute as @a[tag=sf.case_participant,scores={sf.claimed=1..}] run function sf:case/release_claimed
execute as @a[tag=sf.case_participant] run function sf:case/reset
execute as @a[tag=sf.case_participant] run function sf:case/reset_performance

kill @e[type=marker,tag=sf.ghost]
kill @e[tag=sf.uv_trace]
kill @e[tag=sf.remnant]
kill @e[type=marker,tag=sf.ward]

tag @a remove spectral.seen
scoreboard players set @a[tag=sf.case_participant] sf.case_gen 0

tag @a remove sf.case_participant
tag @a remove sf.case_owner
tag @a remove sf.case_resolver
tag @a remove sf.solo_release_pending

function sf:evidence/reset_pending

scoreboard players set #case_age sf.data 0
scoreboard players set #hunt_roll_cd sf.data 0
scoreboard players set #case_empty sf.data 0
scoreboard players set #ghost_missing sf.data 0

data remove storage sf:config case_generation_adopt_serial
scoreboard players set #adopt_serial sf.data -1

data modify storage sf:case state set value "inactive"
data remove storage sf:case id
data remove storage sf:case mode
data remove storage sf:case owner
data remove storage sf:case dimension
data remove storage sf:case spawn