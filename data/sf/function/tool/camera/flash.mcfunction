# tool/camera/flash.mcfunction — as @s at @s. The shutter.
playsound minecraft:entity.item.pickup master @s ~ ~ ~ 0.6 2.0
playsound minecraft:block.dispenser.fail master @s ~ ~ ~ 0.4 1.6
particle minecraft:end_rod ~ ~1 ~ 0.3 0.3 0.3 0.1 8
scoreboard players operation @s sf.photo_cd = #photo_cooldown sf.data