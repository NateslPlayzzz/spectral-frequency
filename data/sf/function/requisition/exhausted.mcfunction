# requisition/exhausted.mcfunction

title @s times 5 45 15
title @s title {"text":"CLAIMS EXHAUSTED","color":"#FFC36B","bold":true}
title @s subtitle {"text":"replacement instruments require Bench assembly","color":"gray","italic":true}

playsound minecraft:block.note_block.bass player @s ~ ~ ~ 0.5 0.55
playsound minecraft:block.beacon.deactivate player @s ~ ~ ~ 0.3 0.7

tellraw @s [{"text":"[","color":"dark_gray"},{"text":"LOGISTICS","color":"#D8C8A0","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Both emergency field-kit claims have been used.","color":"#FFC36B"}]

tellraw @s [{"text":"[","color":"dark_gray"},{"text":"BENCH","color":"#C89BFF","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Missing calibration instruments can now be rebuilt with ordinary Iron, Redstone, Glass, and Amethyst.","color":"gray"}]

execute if entity @s[tag=sf.requisition_access] run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"ACCESS","color":"#5AC8C8","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Missing access equipment was still reissued without consuming a claim.","color":"gray"}]

tag @s remove sf.requisition_access