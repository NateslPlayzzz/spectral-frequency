# tool/echolens/echo_seen.mcfunction
# An apparent erasure-signature bleeds through the Lens.

particle minecraft:dust{color:[0.78,0.63,1.0],scale:1.4} ~ ~1 ~ 0.4 0.5 0.4 0.0 25
particle minecraft:reverse_portal ~ ~1 ~ 0.3 0.4 0.3 0.02 15
particle minecraft:sculk_soul ~ ~1.2 ~ 0.2 0.3 0.2 0.01 8

playsound minecraft:block.sculk_shrieker.shriek ambient @s ~ ~ ~ 0.5 1.4
playsound minecraft:entity.warden.sonic_charge ambient @s ~ ~ ~ 0.4 1.2

title @s actionbar {"text":"— an echo answers —","color":"#C89BFF","italic":true}