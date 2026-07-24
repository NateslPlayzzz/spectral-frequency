# forgotten/epilogue_tick.mcfunction
# Runs once per second as the authoritative witness.
#
# sf.vigil_timer is persistent across reload and reconnect, so the epilogue
# pauses while the witness is offline and resumes when they return.

execute unless data storage sf:forgotten {state:"epilogue"} run return 0
execute unless entity @s[tag=sf.forgotten_witness] run return 0

scoreboard players add @s sf.vigil_timer 1

execute if score @s sf.vigil_timer matches 3 if data storage sf:forgotten {ending:"protocol"} run function sf:forgotten/epilogue_protocol_say
execute if score @s sf.vigil_timer matches 3 if data storage sf:forgotten {ending:"vigil"} run function sf:forgotten/epilogue_vigil_say

execute if score @s sf.vigil_timer matches 3 run function sf:forgotten/give_epilogue_doc

execute if score @s sf.vigil_timer matches 5.. run function sf:forgotten/cleanup