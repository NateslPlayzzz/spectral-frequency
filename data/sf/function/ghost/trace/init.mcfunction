# ghost/trace/init.mcfunction
# Runs as a newly summoned UV trace.

tag @s remove sf.uv_new

# Hidden residue remains available for ninety loaded seconds.
scoreboard players set @s sf.trace_timer 90

# sf.data on the marker stores the investigation generation.
scoreboard players operation @s sf.data = #case_serial sf.data