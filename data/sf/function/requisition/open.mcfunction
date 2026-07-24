# requisition/open.mcfunction

execute unless score @s sf.quest matches 100.. run return run function sf:signal/msg_notready

function sf:requisition/load

scoreboard players enable @s sf.signal

tellraw @s [{"text":"[","color":"dark_gray"},{"text":"LOGISTICS","color":"#D8C8A0","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Emergency claims remaining: ","color":"gray"},{"score":{"name":"#req_remaining","objective":"sf.data"},"color":"#9BFFB0","bold":true},{"text":" / ","color":"dark_gray"},{"score":{"name":"#req_limit","objective":"sf.data"},"color":"white"}]

playsound minecraft:block.note_block.bit player @s ~ ~ ~ 0.45 1.2
playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.2 0.9

dialog show @s sf:field_requisition