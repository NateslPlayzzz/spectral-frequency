# forgotten/choice_tick.mcfunction

execute unless data storage sf:forgotten {state:"choice"} run return 0
execute unless entity @s[tag=sf.forgotten_witness] run return 0

function sf:forgotten/runtime/ensure_entity
function sf:forgotten/choice_tick_macro with storage sf:forgotten manifest