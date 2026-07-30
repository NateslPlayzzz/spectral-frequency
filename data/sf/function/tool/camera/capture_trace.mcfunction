# tool/camera/capture_trace.mcfunction
# Preserves revealed residue as atmospheric documentation.
#
# UV residue no longer provides renewable Memory. Its evidence value belongs
# to the UV Light and Current Case Journal.

scoreboard players add @s sf.photo_count 1

title @s actionbar {"text": "a trace, preserved","color": "#C89BFF","italic": true}

playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.3 1.2