# forgotten/vigil_begin.mcfunction
# Compatibility entry point. The active runtime no longer depends on schedules.

function sf:forgotten/authority/refresh
execute if data storage sf:forgotten {state:"manifest"} as @a[tag=sf.forgotten_witness] run function sf:forgotten/vigil_start