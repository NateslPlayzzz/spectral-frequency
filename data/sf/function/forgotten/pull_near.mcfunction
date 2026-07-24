title @s actionbar ["",{"text":"they are screaming now  \u00b7  ","color":"#8B0000","bold":true},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"#C77"},{"text":"m","color":"dark_gray"}]
execute at @s run particle minecraft:soul ~ ~1 ~ 0.3 0.5 0.3 0.02 6
playsound minecraft:block.sculk_sensor.clicking ambient @s ~ ~ ~ 0.4 0.5