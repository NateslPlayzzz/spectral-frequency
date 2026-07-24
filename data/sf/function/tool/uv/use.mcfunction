# tool/uv/use.mcfunction
# Sweeps for hidden or already-revealed case traces.

execute unless data storage sf:case {state:"active"} run return run function sf:tool/evidence/no_case
execute unless entity @s[tag=sf.case_participant] run return run function sf:tool/evidence/not_participant

scoreboard players set @s sf.tool_cd 8

execute if entity @e[tag=sf.uv_trace,distance=..6] run function sf:tool/uv/reveal
execute unless entity @e[tag=sf.uv_trace,distance=..6] run function sf:tool/uv/nothing