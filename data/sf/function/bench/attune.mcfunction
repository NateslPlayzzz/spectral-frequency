# bench/attune.mcfunction — @s player at barrel origin
summon marker ~0.5 ~0.5 ~0.5 {Tags:["sf.bench","smithed.entity","smithed.strict"]}
playsound minecraft:block.respawn_anchor.set_spawn block @a[distance=..16] ~ ~ ~ 1 0.8
playsound minecraft:block.amethyst_block.resonate block @a[distance=..16] ~ ~ ~ 0.8 0.6
particle minecraft:soul ~0.5 ~1 ~0.5 0.3 0.4 0.3 0.02 30
title @s actionbar {"text":"the barrel resonates \u2014 a workbench is attuned","color":"#9BFFB0","italic":true}