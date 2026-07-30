# dev/repair/case.mcfunction
# Force-closes a corrupted or abandoned standard investigation while
# preserving permanent Investigator progression and pending signals.

execute unless data storage sf:system {enabled:true} run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"SF REPAIR","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Runtime is disabled. Case repair was not performed.","color":"#FFC36B"}]
execute unless data storage sf:forgotten {state:"idle"} run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"SF REPAIR","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Case repair refused: the Forgotten lifecycle is active or awaiting repair.","color":"#FF8E8E"},{"text":" Use /function sf:dev/repair/finale instead.","color":"gray"}]

function sf:tool/contain/clear_all

execute as @a[scores={sf.claimed=1..}] run function sf:core/restore_player
execute as @a run function sf:case/clear_runtime_player
scoreboard players set @a sf.case_gen 0

kill @e[type=minecraft:marker,tag=sf.ghost,tag=!sf.forgotten]
kill @e[tag=sf.uv_trace]
kill @e[tag=sf.remnant]
kill @e[type=minecraft:marker,tag=sf.ward]
kill @e[tag=sf.case_source]
kill @e[tag=sf.dispatch_origin]

schedule clear sf:player/claim/solo_release

tag @a remove sf.case_participant
tag @a remove sf.case_owner
tag @a remove sf.case_resolver
tag @a remove sf.solo_release_pending
tag @a remove sf.reviving
tag @a remove sf.case_valid_online
tag @a remove sf.signature_target
tag @a remove sf.shade_suppressed

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

tag @a[tag=spectral.sf_init] remove sf.signal_checked
execute as @a[tag=spectral.sf_init] run function sf:signal/recover

function sf:ui/rebuild_bars

data modify storage sf:system last_action set value "repair_case"

tellraw @a [{"text":"[","color":"dark_gray"},{"text":"SF REPAIR","color":"#7A5CFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"The standard investigation runtime was force-closed and repaired.","color":"#9BFFB0"}]
tellraw @a [{"text":"  Permanent Investigator progression, equipment, and pending Field Radio records were preserved.","color":"gray"}]
tellraw @a [{"text":"  Generation-owned manifestations, wards, UV residue, and Remnants will reject stale cases when loaded.","color":"dark_gray"}]