# ghost/trace/tick.mcfunction
# Runs once per loaded second as each UV trace.

# Residue has meaning only during a live investigation.
execute unless data storage sf:case {state:"active"} run return run kill @s

# A trace from another case generation is stale, including a trace whose
# chunk unloaded before the old case was cleared.
execute unless score @s sf.data = #case_serial sf.data run return run kill @s

scoreboard players remove @s sf.trace_timer 1

execute if score @s sf.trace_timer matches ..0 run return run kill @s

execute if entity @s[tag=sf.uv_shown] run function sf:tool/uv/pulse_trace