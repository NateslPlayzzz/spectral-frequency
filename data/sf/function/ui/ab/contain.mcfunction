# ui/ab/contain.mcfunction
# Containment progress with phase-aware resistance feedback.

scoreboard players operation #pct sf.data = @s sf.contain_progress
scoreboard players operation #pct sf.data *= #hundred sf.data
scoreboard players operation #pct sf.data /= #contain_need sf.data

execute if score #pct sf.data matches ..59 run title @s actionbar ["",{"text":"◈ BINDING  ","color":"#C89BFF"},{"score":{"name":"#pct","objective":"sf.data"},"color":"white"},{"text":"%","color":"gray"}]

execute if score #pct sf.data matches 60..84 run title @s actionbar ["",{"text":"◈ RESISTING  ","color":"#FFC36B","bold":true},{"score":{"name":"#pct","objective":"sf.data"},"color":"white"},{"text":"%","color":"gray"}]

execute if score #pct sf.data matches 85.. run title @s actionbar ["",{"text":"◈ HOLD  ","color":"dark_red","bold":true},{"score":{"name":"#pct","objective":"sf.data"},"color":"white"},{"text":"%","color":"gray"}]