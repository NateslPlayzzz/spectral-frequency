# tool/contain/success.mcfunction
# Runs as the authoritative containment operator.
#
# The operator owns the binding interaction, but every enrolled participant
# receives personal progression and rewards before case teardown.

# Stop the operator's channel state while preserving the target long enough
# to capture its difficulty and dissolve it.
scoreboard players set @s sf.contain_active 0
scoreboard players set @s sf.contain_progress 0

tag @s remove sf.contain_operator
tag @s remove sf.contain_probe

# Capture the target's shared difficulty before it is removed.
scoreboard players set @a[tag=sf.case_participant] sf.was_aggressive 0

execute if entity @e[type=minecraft:marker,tag=sf.contain_target,tag=sf.tier.aggressive,distance=..6,limit=1] run scoreboard players set @a[tag=sf.case_participant] sf.was_aggressive 1

# Resolve only the target selected when the binding began.
execute at @s run function sf:ghost/contain/resolve
function sf:tool/contain/release_target

function sf:sfx/contain_success

# A participant who was Taken is returned before rewards are delivered.
# release_claimed preserves performance scores while restoring the player.
execute as @a[tag=sf.case_participant,scores={sf.claimed=1..}] run function sf:case/release_claimed

# Fragment discovery, personal residue, Memory restoration, performance
# rewards, and advancements belong to every online enrolled participant.
execute as @a[tag=sf.case_participant] run function sf:case/reward_participant

# Erase the shared investigation only after every participant's persistent
# progression has been written.
function sf:case/resolve