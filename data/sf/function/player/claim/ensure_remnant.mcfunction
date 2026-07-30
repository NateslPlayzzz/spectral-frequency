# player/claim/ensure_remnant.mcfunction
# Runs as a Taken participant at their current position.

execute unless data storage sf:case {state:"active"} run return 0
execute unless entity @s[tag=sf.case_participant] run return 0
execute unless score @s sf.claimed matches 1.. run return 0
execute unless score @s sf.case_gen = #case_serial sf.data run return 0

tag @s remove sf.remnant_present

data modify storage sf:temp remnant.uuid set from entity @s UUID
function sf:player/claim/ensure_remnant_macro with storage sf:temp remnant

execute unless entity @s[tag=sf.remnant_present] at @s run function sf:player/claim/spawn_remnant with storage sf:temp remnant

tag @s remove sf.remnant_present
data remove storage sf:temp remnant