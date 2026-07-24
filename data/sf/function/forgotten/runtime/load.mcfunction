# forgotten/runtime/load.mcfunction
# Validates and resumes the schema-102 finale state machine.

# Old schedule-driven finale functions are no longer authoritative.
schedule clear sf:forgotten/vigil_begin
schedule clear sf:forgotten/epilogue_protocol
schedule clear sf:forgotten/epilogue_vigil

# Reject an unknown lifecycle state.
execute unless data storage sf:forgotten {state:"idle"} unless data storage sf:forgotten {state:"pull"} unless data storage sf:forgotten {state:"threshold"} unless data storage sf:forgotten {state:"manifest"} unless data storage sf:forgotten {state:"vigil"} unless data storage sf:forgotten {state:"choice"} unless data storage sf:forgotten {state:"epilogue"} unless data storage sf:forgotten {state:"repair_required"} run data modify storage sf:forgotten state set value "repair_required"

# Every non-idle lifecycle requires an authoritative witness.
execute unless data storage sf:forgotten {state:"idle"} unless data storage sf:forgotten {state:"repair_required"} unless data storage sf:forgotten witness run data modify storage sf:forgotten state set value "repair_required"

# Validate phase-specific recovery records.
execute if data storage sf:forgotten {state:"pull"} unless data storage sf:forgotten thin.dimension run data modify storage sf:forgotten state set value "repair_required"
execute if data storage sf:forgotten {state:"pull"} unless data storage sf:forgotten thin.x run data modify storage sf:forgotten state set value "repair_required"
execute if data storage sf:forgotten {state:"pull"} unless data storage sf:forgotten thin.z run data modify storage sf:forgotten state set value "repair_required"

execute if data storage sf:forgotten {state:"threshold"} unless data storage sf:forgotten threshold.dimension run data modify storage sf:forgotten state set value "repair_required"
execute if data storage sf:forgotten {state:"threshold"} unless data storage sf:forgotten threshold.x run data modify storage sf:forgotten state set value "repair_required"
execute if data storage sf:forgotten {state:"threshold"} unless data storage sf:forgotten threshold.y run data modify storage sf:forgotten state set value "repair_required"
execute if data storage sf:forgotten {state:"threshold"} unless data storage sf:forgotten threshold.z run data modify storage sf:forgotten state set value "repair_required"

execute if data storage sf:forgotten {state:"manifest"} unless data storage sf:forgotten manifest.dimension run data modify storage sf:forgotten state set value "repair_required"
execute if data storage sf:forgotten {state:"vigil"} unless data storage sf:forgotten manifest.dimension run data modify storage sf:forgotten state set value "repair_required"
execute if data storage sf:forgotten {state:"choice"} unless data storage sf:forgotten manifest.dimension run data modify storage sf:forgotten state set value "repair_required"

# An idle finale must not retain loaded runtime artifacts.
execute if data storage sf:forgotten {state:"idle"} run function sf:forgotten/runtime/idle_cleanup

function sf:forgotten/authority/refresh

# Recreate a missing manifestation only when its authoritative witness is online
# and close enough that the recorded chunk is already loaded.
execute if data storage sf:forgotten {state:"manifest"} as @a[tag=sf.forgotten_witness] run function sf:forgotten/runtime/ensure_entity
execute if data storage sf:forgotten {state:"vigil"} as @a[tag=sf.forgotten_witness] run function sf:forgotten/runtime/ensure_entity
execute if data storage sf:forgotten {state:"choice"} as @a[tag=sf.forgotten_witness] run function sf:forgotten/runtime/ensure_entity

# An epilogue must preserve one known branch outcome.
execute if data storage sf:forgotten {state:"epilogue"} unless data storage sf:forgotten {ending:"protocol"} unless data storage sf:forgotten {ending:"vigil"} run data modify storage sf:forgotten state set value "repair_required"

execute if data storage sf:forgotten {state:"repair_required"} run tellraw @a [{"text":"[","color":"dark_gray"},{"text":"THE FORGOTTEN","color":"#8B0000","bold":true},{"text":"] ","color":"dark_gray"},{"text":"The stored finale lifecycle is incomplete. Progression is locked pending administrative repair.","color":"#FFC36B"}]