# forgotten/threshold_tick.mcfunction

execute unless data storage sf:forgotten {state:"threshold"} run return 0
execute unless entity @s[tag=sf.forgotten_witness] run return 0

function sf:forgotten/threshold_tick_macro with storage sf:forgotten threshold