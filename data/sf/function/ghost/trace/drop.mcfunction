# ghost/trace/drop.mcfunction — as @s (ghost) at @s. Cap traces so they don't pile up.
execute if entity @e[tag=sf.uv_trace,distance=..6] run return 0
summon marker ~ ~ ~ {Tags:["sf.uv_trace","sf.uv_hidden","smithed.entity","smithed.strict"]}