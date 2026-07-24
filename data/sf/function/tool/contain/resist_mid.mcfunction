# tool/contain/resist_mid.mcfunction
# One configured Memory pulse during the middle resistance phase.

scoreboard players operation @s sf.coherence -= #contain_drain sf.data

execute at @s run particle minecraft:soul ~ ~1 ~ 0.3 0.4 0.3 0.01 4