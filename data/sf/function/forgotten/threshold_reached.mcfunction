# forgotten/threshold_reached.mcfunction

execute unless data storage sf:forgotten {state:"threshold"} run return 0
execute unless entity @s[tag=sf.forgotten_witness] run return 0

tag @s remove sf.at_threshold

scoreboard players set @s sf.recon_pull 0
scoreboard players set @s sf.forgotten_phase 2
scoreboard players set @s sf.vigil_timer 0

data modify storage sf:forgotten state set value "manifest"

data modify storage sf:temp finale.state set value "manifest"
function sf:forgotten/profile/set_state

function sf:forgotten/manifest