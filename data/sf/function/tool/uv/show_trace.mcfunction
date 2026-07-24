# tool/uv/show_trace.mcfunction — as @s (trace marker) at @s
tag @s remove sf.uv_hidden
tag @s add sf.uv_shown
particle minecraft:glow ~ ~0.1 ~ 0.3 0.1 0.3 0.0 30
particle minecraft:wax_on ~ ~0.1 ~ 0.2 0.1 0.2 0.0 12