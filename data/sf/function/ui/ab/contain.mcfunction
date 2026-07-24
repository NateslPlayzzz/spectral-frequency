# percent = progress/need*100
scoreboard players operation #pct sf.data = @s sf.contain_progress
scoreboard players operation #pct sf.data *= #hundred sf.data
scoreboard players operation #pct sf.data /= #contain_need sf.data
title @s actionbar ["",{"text":"\u25c8 BINDING  ","color":"#C89BFF"},{"score":{"name":"#pct","objective":"sf.data"},"color":"white"},{"text":"%","color":"gray"}]