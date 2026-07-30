# case/resolve.mcfunction
# Final teardown after every online participant has received progression,
# personal residue, and performance rewards.

function sf:tool/contain/clear_all

# Defensive restoration in case a claimed participant was not released by the
# successful-containment dispatcher.
execute as @a[tag=sf.case_participant,scores={sf.claimed=1..}] run function sf:case/release_claimed

# Case-local evidence and performance state are no longer needed after every
# participant has been scored.
execute as @a[tag=sf.case_participant] run function sf:case/reset
execute as @a[tag=sf.case_participant] run function sf:case/reset_performance

kill @e[type=minecraft:marker,tag=sf.ghost]
kill @e[tag=sf.uv_trace]
kill @e[tag=sf.remnant]
kill @e[type=minecraft:marker,tag=sf.ward]

tag @a remove spectral.seen
scoreboard players set @a[tag=sf.case_participant] sf.case_gen 0
tag @a remove sf.case_participant
tag @a remove sf.case_owner
tag @a remove sf.case_resolver
tag @a remove sf.solo_release_pending
tag @a remove sf.signature_target
tag @a remove sf.fragment_new

function sf:evidence/reset_pending

scoreboard players set #case_age sf.data 0
scoreboard players set #hunt_roll_cd sf.data 0

data remove storage sf:config case_generation_adopt_serial
scoreboard players set #adopt_serial sf.data -1

data modify storage sf:case state set value "inactive"
data remove storage sf:case id
data remove storage sf:case mode
data remove storage sf:case owner
data remove storage sf:case dimension
data remove storage sf:case spawn