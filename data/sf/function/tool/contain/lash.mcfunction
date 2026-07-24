# tool/contain/lash.mcfunction
# A rare burst of late-channel resistance.

scoreboard players operation #contain_lash sf.data = #contain_drain sf.data
scoreboard players operation #contain_lash sf.data *= #two sf.data
scoreboard players operation @s sf.coherence -= #contain_lash sf.data

playsound minecraft:entity.warden.sonic_boom player @s ~ ~ ~ 0.5 1.2
execute at @s run particle minecraft:sonic_boom ~ ~1 ~ 0 0 0 0 1