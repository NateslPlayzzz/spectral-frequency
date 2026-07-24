# forgotten/vigil_tick.mcfunction

execute unless data storage sf:forgotten {state:"vigil"} run return 0
execute unless entity @s[tag=sf.forgotten_witness] run return 0

function sf:forgotten/runtime/ensure_entity
function sf:forgotten/vigil_tick_macro with storage sf:forgotten manifest