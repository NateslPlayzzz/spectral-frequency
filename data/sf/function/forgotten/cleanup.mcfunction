# forgotten/cleanup.mcfunction
# Completes an authoritative epilogue and returns the runtime to normal play.

execute unless data storage sf:forgotten {state:"epilogue"} run return 0
execute unless entity @s[tag=sf.forgotten_witness] run return 0

function sf:forgotten/profile/mark_completed

kill @e[tag=sf.forgotten]

scoreboard players set @s sf.forgotten_phase 0
scoreboard players set @s sf.recon_pull 0
scoreboard players set @s sf.vigil_timer 0
scoreboard players set @s sf.choice_hold 0
scoreboard players set @s sf.choice_path 0

data modify storage sf:forgotten state set value "idle"
function sf:forgotten/runtime/idle_cleanup

# Resume persistent Field Radio records after releasing the global finale lock.
tag @a[tag=spectral.sf_init] remove sf.signal_checked
execute as @a[tag=spectral.sf_init] run function sf:signal/recover

data modify storage sf:system last_action set value "finale_completed"

tellraw @s [{"text":"[","color":"dark_gray"},{"text":"RECONSTRUCTION","color":"#C89BFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"The finale record has been sealed into your persistent profile.","color":"#9BFFB0"}]