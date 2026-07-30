# ghost/module/light_flicker/snuff.mcfunction
# A non-destructive electrical disturbance centered on the manifestation.
# Never remove or replace player-owned world lighting.

particle minecraft:electric_spark ~ ~0.7 ~ 0.55 0.7 0.55 0.03 14
particle minecraft:smoke ~ ~0.5 ~ 0.4 0.5 0.4 0.01 8

playsound minecraft:block.fire.extinguish ambient @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..12] ~ ~ ~ 0.55 1.15
playsound minecraft:block.sculk_sensor.clicking ambient @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..12] ~ ~ ~ 0.45 0.75
playsound minecraft:block.redstone_torch.burnout ambient @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0},distance=..12] ~ ~ ~ 0.5 0.65

# Only enrolled living Investigators with an active Spectral Flashlight are
# functionally disrupted. Ordinary blocks and outside players are untouched.
execute as @a[tag=sf.case_participant,gamemode=!spectator,scores={sf.claimed=0,sf.flashlight_on=1..},distance=..12] at @s run function sf:tool/flashlight/disrupt