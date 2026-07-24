# ui/ab/reading.mcfunction — as @s. Dispatch to the tool channel that set the request.
execute if score @s sf.read_type matches 1 run return run function sf:ui/hud_emf
execute if score @s sf.read_type matches 2 run return run function sf:ui/hud_thermo
execute if score @s sf.read_type matches 3 run return run function sf:ui/hud_box
execute if score @s sf.read_type matches 4 run return run function sf:ui/hud_uv
execute if score @s sf.read_type matches 5 run return run function sf:ui/hud_writing
execute if score @s sf.read_type matches 6 run return run function sf:ui/hud_echo