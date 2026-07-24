# forgotten/pull_tick.mcfunction

execute unless data storage sf:forgotten {state:"pull"} run return 0
execute unless entity @s[tag=sf.forgotten_witness] run return 0

function sf:forgotten/pull_tick_macro with storage sf:forgotten thin