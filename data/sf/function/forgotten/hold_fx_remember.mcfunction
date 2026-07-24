title @s actionbar [{"text":"REMEMBERING... ","color":"#C89BFF","bold":true},{"score":{"name":"@s","objective":"sf.choice_hold"},"color":"white"},{"text":"%","color":"gray"}]
execute at @s run particle minecraft:end_rod ^ ^1 ^2 0.3 0.5 0.3 0.02 3
playsound minecraft:block.amethyst_block.chime master @s ~ ~ ~ 0.3 1.0
execute if score @s sf.choice_hold matches 60 run function sf:forgotten/remember_midword