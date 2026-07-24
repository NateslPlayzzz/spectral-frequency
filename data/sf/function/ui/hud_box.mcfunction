# ui/hud_box.mcfunction
execute if score @s sf.read_val matches 1 run title @s actionbar ["",{"text":"\u25c8 SPIRIT BOX  ","color":"gray"},{"text":"RESPONSE","color":"#9BFFB0","bold":true}]
execute if score @s sf.read_val matches 0 run title @s actionbar ["",{"text":"\u25c8 SPIRIT BOX  ","color":"gray"},{"text":"silence","color":"dark_gray"}]