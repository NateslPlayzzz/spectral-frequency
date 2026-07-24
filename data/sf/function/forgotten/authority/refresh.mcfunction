# forgotten/authority/refresh.mcfunction
# Rebuilds online finale tags from the authoritative stored witness UUID.

tag @a remove sf.forgotten_witness
tag @a remove sf.forgotten_active
tag @a remove sf.at_threshold

execute if data storage sf:forgotten {state:"idle"} run function sf:forgotten/authority/idle_reset
execute if data storage sf:forgotten {state:"repair_required"} run function sf:forgotten/authority/idle_reset

execute if data storage sf:forgotten witness unless data storage sf:forgotten {state:"idle"} unless data storage sf:forgotten {state:"repair_required"} run function sf:forgotten/authority/attach_macro with storage sf:forgotten

execute as @a[tag=!sf.forgotten_witness] run function sf:forgotten/authority/clear_player