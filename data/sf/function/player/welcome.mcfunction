# player/welcome.mcfunction — as @s.
# Cold open. The per-player startup timer handles later title and Vance stages.

title @s times 20 60 30
title @s subtitle {"text":"","color":"#6A6A78"}
title @s title {"text":"","color":"#7A5CFF"}
playsound minecraft:ambient.cave master @s ~ ~ ~ 1 0.4
playsound minecraft:block.beacon.deactivate master @s ~ ~ ~ 0.5 0.4