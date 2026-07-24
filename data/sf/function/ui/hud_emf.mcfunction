# ui/hud_emf.mcfunction
execute if score @s sf.read_val matches 1 run title @s actionbar ["",{"text":"\u25c8 EMF  ","color":"gray"},{"text":"1","color":"dark_gray"}]
execute if score @s sf.read_val matches 2 run title @s actionbar ["",{"text":"\u25c8 EMF  ","color":"gray"},{"text":"2","color":"yellow"}]
execute if score @s sf.read_val matches 5 run title @s actionbar ["",{"text":"\u25c8 EMF  ","color":"gray"},{"text":"5","color":"red","bold":true}]