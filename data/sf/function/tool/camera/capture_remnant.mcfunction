# tool/camera/capture_remnant.mcfunction
# Preserves the image of one current-generation Taken-player Remnant.

scoreboard players add @s sf.photo_count 1

title @s actionbar {"text":"you keep their image safe","color":"#7A5CFF","italic":true}
playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.3 0.6

tag @e[type=minecraft:interaction,tag=sf.camera_target] remove sf.camera_target