# tool/contain/resist_tutorial.mcfunction
# Controlled resistance used only during the first tutorial binding.
#
# Called seven times during the complete channel:
# progress 10, 20, 30, 40, 50, 60, and 70.
#
# Total tutorial cost: 7 Memory.

scoreboard players remove @s sf.coherence 1

execute at @s run particle minecraft:soul ~ ~1 ~ 0.3 0.45 0.3 0.01 4
playsound minecraft:entity.allay.hurt player @s ~ ~ ~ 0.25 0.75