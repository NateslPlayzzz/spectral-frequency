# signal/request_new.mcfunction
# Requests one normal UUID-owned UMBRA assignment.

function sf:signal/recover

execute if score @s sf.quest matches ..99 run return run function sf:signal/msg_notready

execute if score @s sf.claimed matches 1.. run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"RADIO","color":"#5AC8C8","bold":true},{"text":"] ","color":"dark_gray"},{"text":"No response. The channel cannot find you.","color":"#8A8A98","italic":true}]

execute if entity @s[tag=spectral.reconstructed] run return run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"VANCE","color":"#5AC8C8","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Not now. Something else has already found the channel.","color":"#C89BFF","italic":true}]

execute if data storage sf:case {state:"active"} run return run function sf:signal/msg_active
execute if entity @s[tag=sf.seeking] run return run function sf:signal/msg_seeking
execute if score @s sf.sig_cd matches 1.. run return run function sf:signal/msg_cooldown

function sf:signal/assign