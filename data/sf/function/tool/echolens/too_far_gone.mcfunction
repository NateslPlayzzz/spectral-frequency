# tool/echolens/too_far_gone.mcfunction
# Zero Memory cannot support deliberate observation.

title @s actionbar {"text":"there is no reflection left to look through","color":"dark_red","italic":true}

playsound minecraft:block.glass.break player @s ~ ~ ~ 0.45 0.55
particle minecraft:reverse_portal ~ ~1 ~ 0.25 0.35 0.25 0.02 9