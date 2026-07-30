# tool/uv/show_trace.mcfunction
# Runs as a newly revealed trace at its own position.

tag @s remove sf.uv_hidden
tag @s add sf.uv_shown

# Once exposed, the residue remains visibly active for twenty seconds.
scoreboard players set @s sf.trace_timer 20

particle minecraft:glow ~ ~0.1 ~ 0.3 0.1 0.3 0.0 30
particle minecraft:wax_on ~ ~0.1 ~ 0.2 0.1 0.2 0.0 12

playsound minecraft:block.amethyst_block.resonate ambient @a[tag=sf.case_participant,distance=..10] ~ ~ ~ 0.35 1.6