# bench/destroyed.mcfunction — the barrel is gone; the attunement fades
particle minecraft:smoke ~ ~0.5 ~ 0.3 0.3 0.3 0.02 15
playsound minecraft:block.beacon.deactivate block @a[distance=..16] ~ ~ ~ 0.6 0.8
kill @s