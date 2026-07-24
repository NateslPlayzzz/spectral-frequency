# reconstruct/complete.mcfunction
# Runs as the Investigator at 12 unique fragments.

execute if entity @s[tag=spectral.reconstructed] run return 0

tag @s add spectral.reconstructed
function sf:forgotten/profile/mark_ready
advancement grant @s only sf:reconstruct

title @s times 20 80 40
title @s title {"text":"RECONSTRUCTION COMPLETE","color":"#C89BFF","bold":true}
title @s subtitle {"text":"twelve distinct fragments remembered","color":"white","italic":true}

playsound minecraft:block.beacon.power_select player @s ~ ~ ~ 1 0.6
playsound minecraft:entity.wither.spawn hostile @s ~ ~ ~ 0.5 1.4

tellraw @s [{"text":"[","color":"dark_gray"},{"text":"◇","color":"#C89BFF"},{"text":"] ","color":"dark_gray"},{"text":"The twelve patterns align. Something beyond the case record has noticed.","color":"#C89BFF","italic":true}]