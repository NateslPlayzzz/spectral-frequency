# ghost/trace/drop.mcfunction
# Runs as the manifestation at its current position.

# Keep traces spatially useful rather than stacking at one point.
execute if entity @e[type=minecraft:marker,tag=sf.uv_trace,distance=..6] run return 0

# Bound loaded trace population for performance and readability.
scoreboard players set #trace_count sf.data 0
execute as @e[type=minecraft:marker,tag=sf.uv_trace] run scoreboard players add #trace_count sf.data 1

execute if score #trace_count sf.data matches 8.. run return 0

summon minecraft:marker ~ ~ ~ {Tags:["sf.uv_trace","sf.uv_hidden","sf.uv_new","smithed.entity","smithed.strict"]}

execute as @e[type=minecraft:marker,tag=sf.uv_trace,tag=sf.uv_new,distance=..1,sort=nearest,limit=1] run function sf:ghost/trace/init