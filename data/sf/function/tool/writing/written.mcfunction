# tool/writing/written.mcfunction — something wrote back
particle minecraft:dust{color:[1.0,0.88,0.55],scale:1.0} ~ ~1 ~ 0.3 0.3 0.3 0.0 12
playsound minecraft:entity.enderman.ambient ambient @s ~ ~ ~ 0.5 0.4
playsound minecraft:item.book.put master @s ~ ~ ~ 0.8 0.8
title @s actionbar {"text":"\u2014 something wrote back \u2014","color":"#FFC36B","italic":true}