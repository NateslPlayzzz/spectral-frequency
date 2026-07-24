# requisition/confirm.mcfunction

execute unless score @s sf.quest matches 100.. run return run function sf:signal/msg_notready

function sf:requisition/load

scoreboard players enable @s sf.signal

tellraw @s [{"text":"[","color":"dark_gray"},{"text":"LOGISTICS","color":"#D8C8A0","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Emergency claims remaining: ","color":"gray"},{"score":{"name":"#req_remaining","objective":"sf.data"},"color":"#9BFFB0","bold":true},{"text":" / ","color":"dark_gray"},{"score":{"name":"#req_limit","objective":"sf.data"},"color":"white"}]

dialog show @s sf:field_requisition_confirm