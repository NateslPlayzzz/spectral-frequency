# case/fail.mcfunction
# Runs when every participant has been Taken.

title @a[tag=sf.case_participant] times 10 60 20
title @a[tag=sf.case_participant] title {"text":"CASE LOST","color":"dark_red","bold":true}
title @a[tag=sf.case_participant] subtitle {"text":"no one remained to hold the memory","color":"#5A2A2A","italic":true}

tellraw @a[tag=sf.case_participant] [{"text":"◈ ","color":"#7A5CFF"},{"text":"The presence fades. The investigation is lost — for now.","color":"#8A8A98"}]

execute as @a[tag=sf.case_participant,scores={sf.claimed=1..}] run function sf:case/release_claimed
execute as @a[tag=sf.case_participant] run function sf:case/reset
execute as @a[tag=sf.case_participant] run function sf:case/reset_performance

kill @e[type=marker,tag=sf.ghost]
kill @e[tag=sf.uv_trace]
kill @e[tag=sf.remnant]
kill @e[type=marker,tag=sf.ward]

tag @a remove spectral.seen
tag @a remove sf.case_participant
tag @a remove sf.case_owner
tag @a remove sf.case_resolver
tag @a remove sf.solo_release_pending

scoreboard players set #case_age sf.data 0
scoreboard players set #hunt_roll_cd sf.data 0

data modify storage sf:case state set value "inactive"
data remove storage sf:case id
data remove storage sf:case mode
data remove storage sf:case owner
data remove storage sf:case dimension
data remove storage sf:case spawn