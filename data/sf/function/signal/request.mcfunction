# signal/request.mcfunction
# Routes choices made through a Field Radio held in the main hand.
#
# 1  = request assignment
# 2  = field status
# 3  = cancel signal
# 4  = close channel
# 5  = open equipment requisition
# 6  = return to Field Radio
# 10 = execute emergency recovery
# 11 = audit field kit
# 12 = Attuned Bench policy
# 13 = confirm emergency recovery

execute unless items entity @s weapon.mainhand *[custom_data~{sf:{item:"radio"}}] run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"FIELD RADIO","color":"#5AC8C8","bold":true},{"text":"] ","color":"dark_gray"},{"text":"The secure channel closed when the Radio left your hand.","color":"gray"}]
execute if score @s sf.claimed matches 1.. run return 0
execute if entity @s[gamemode=spectator] run return 0

execute if score @s sf.signal matches 1 run return run function sf:signal/request_new
execute if score @s sf.signal matches 2 run return run function sf:signal/status
execute if score @s sf.signal matches 3 run return run function sf:signal/cancel
execute if score @s sf.signal matches 4 run return run function sf:signal/close

execute if score @s sf.signal matches 5 run return run function sf:requisition/open
execute if score @s sf.signal matches 6 run return run function sf:requisition/back_radio

execute if score @s sf.signal matches 10 run return run function sf:requisition/recover_core
execute if score @s sf.signal matches 11 run return run function sf:requisition/status
execute if score @s sf.signal matches 12 run return run function sf:requisition/bench_info
execute if score @s sf.signal matches 13 run return run function sf:requisition/confirm