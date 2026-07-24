# tool/contain/resist_aggressive.mcfunction
# One additional configured Memory pulse every four channel cycles.

scoreboard players operation @s sf.coherence -= #contain_drain sf.data

execute at @s run particle minecraft:sculk_soul ~ ~1 ~ 0.25 0.35 0.25 0.02 3