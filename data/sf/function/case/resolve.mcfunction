# case/resolve.mcfunction
# Successful case teardown.
#
# Performance scores are deliberately retained until reward/score finishes
# for the resolving player.

tag @s add sf.case_resolver

title @a[tag=sf.case_participant,tag=!sf.case_resolver] times 10 45 15
title @a[tag=sf.case_participant,tag=!sf.case_resolver] title {"text":"CASE RESOLVED","color":"#C89BFF","bold":true}
title @a[tag=sf.case_participant,tag=!sf.case_resolver] subtitle {"text":"the manifestation has been bound","color":"gray","italic":true}

execute as @a[tag=sf.case_participant,scores={sf.claimed=1..}] run function sf:case/release_claimed
execute as @a[tag=sf.case_participant] run function sf:case/reset

kill @e[type=marker,tag=sf.ghost]
kill @e[tag=sf.uv_trace]
kill @e[tag=sf.remnant]
kill @e[type=marker,tag=sf.ward]

tag @a remove spectral.seen
tag @a remove sf.case_participant
tag @a remove sf.case_owner
tag @a remove sf.solo_release_pending

scoreboard players set #case_age sf.data 0
scoreboard players set #hunt_roll_cd sf.data 0

data modify storage sf:case state set value "inactive"
data remove storage sf:case id
data remove storage sf:case mode
data remove storage sf:case owner
data remove storage sf:case dimension
data remove storage sf:case spawn

tag @a remove sf.case_resolver