# case/teardown_lost.mcfunction
# Shared no-reward teardown for failed, abandoned, and orphaned investigations.

function sf:tool/contain/clear_all

# Restore Taken participants from the current generation.
execute as @a[tag=sf.case_participant,scores={sf.claimed=1..}] if score @s sf.case_gen = #case_serial sf.data run function sf:case/release_claimed

# A mismatched Taken state is restored without teleporting into this case.
execute as @a[tag=sf.case_participant,scores={sf.claimed=1..}] unless score @s sf.case_gen = #case_serial sf.data run function sf:core/restore_player

execute as @a[tag=sf.case_participant] run function sf:case/reset
execute as @a[tag=sf.case_participant] run function sf:case/reset_performance

scoreboard players set @a[tag=sf.case_participant] sf.case_gen 0

kill @e[type=minecraft:marker,tag=sf.ghost,tag=!sf.forgotten]
kill @e[tag=sf.uv_trace]
kill @e[tag=sf.remnant]
kill @e[type=minecraft:marker,tag=sf.ward]
kill @e[tag=sf.case_source]
kill @e[tag=sf.dispatch_origin]
kill @e[type=minecraft:marker,tag=sf.sensor]
tag @a remove spectral.seen
tag @a remove sf.case_participant
tag @a remove sf.case_owner
tag @a remove sf.case_resolver
tag @a remove sf.solo_release_pending
tag @a remove sf.reviving
tag @a remove sf.case_valid_online
tag @a remove sf.signature_target
tag @a remove sf.shade_suppressed
tag @a remove sf.fragment_new
tag @a remove sf.evidence_new

function sf:evidence/reset_pending

scoreboard players set #case_age sf.data 0
scoreboard players set #hunt_roll_cd sf.data 0
scoreboard players set #case_empty sf.data 0
scoreboard players set #ghost_missing sf.data 0
scoreboard players set #case_online sf.data 0
scoreboard players set #case_living sf.data 0
scoreboard players set #case_taken sf.data 0
scoreboard players set #case_field sf.data 0
scoreboard players set #case_ghosts sf.data 0
scoreboard players set #adopt_serial sf.data -1

data remove storage sf:config case_generation_adopt_serial

data modify storage sf:case state set value "inactive"
data remove storage sf:case id
data remove storage sf:case mode
data remove storage sf:case owner
data remove storage sf:case dimension
data remove storage sf:case spawn
data remove storage sf:case participants
data remove storage sf:case resolver
data remove storage sf:case result
data remove storage sf:case ghost

data remove storage sf:temp revive
data remove storage sf:temp remnant
data remove storage sf:temp seen

# Pending personal assignments may reattach now that the global case lock is gone.
tag @a[tag=spectral.sf_init] remove sf.signal_checked
execute if data storage sf:forgotten {state:"idle"} as @a[tag=spectral.sf_init] run function sf:signal/recover

function sf:ui/rebuild_bars