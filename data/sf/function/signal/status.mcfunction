# signal/status.mcfunction
# Reports only the requesting Investigator's Field Radio state.

playsound minecraft:block.note_block.bit player @s ~ ~ ~ 0.45 1.1

execute if data storage sf:case {state:"active"} run return run tellraw @s [{"text":"── ","color":"dark_gray"},{"text":"UMBRA FIELD STATUS","color":"#5AC8C8","bold":true},{"text":" ──\n","color":"dark_gray"},{"text":"  INVESTIGATION  ","color":"#6A6A78","bold":true},{"text":"ACTIVE","color":"#FF8E8E","bold":true},{"text":"\n  OBJECTIVE       ","color":"#6A6A78","bold":true},{"text":"Confirm three evidence types, classify the fragment, and contain the manifestation.","color":"gray"}]

function sf:signal/recover

execute if entity @s[tag=sf.seeking,tag=sf.signal_wrong_dimension] run return run tellraw @s [{"text":"── ","color":"dark_gray"},{"text":"UMBRA FIELD STATUS","color":"#5AC8C8","bold":true},{"text":" ──\n","color":"dark_gray"},{"text":"  SIGNAL  ","color":"#6A6A78","bold":true},{"text":"OUT OF RANGE","color":"#FFC36B","bold":true},{"text":"\n  Your personal assignment remains stored in another dimension.","color":"gray"},{"text":"\n  Return there and hold the Field Radio to resume directional telemetry.","color":"#8A8A98","italic":true}]

execute if entity @s[tag=sf.seeking,tag=sf.signal_suspended] run return run tellraw @s [{"text":"── ","color":"dark_gray"},{"text":"UMBRA FIELD STATUS","color":"#5AC8C8","bold":true},{"text":" ──\n","color":"dark_gray"},{"text":"  SIGNAL  ","color":"#6A6A78","bold":true},{"text":"SUSPENDED","color":"#FFC36B","bold":true},{"text":"\n  Your assignment will resume when the active investigation closes.","color":"gray"}]

execute if entity @s[tag=sf.seeking] run return run tellraw @s [{"text":"── ","color":"dark_gray"},{"text":"UMBRA FIELD STATUS","color":"#5AC8C8","bold":true},{"text":" ──\n","color":"dark_gray"},{"text":"  SIGNAL  ","color":"#6A6A78","bold":true},{"text":"TRACKING","color":"#FFC36B","bold":true},{"text":"\n  LAST HORIZONTAL RANGE  ","color":"#6A6A78","bold":true},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"},{"text":"\n  Keep the Field Radio in hand for direction and signal strength.","color":"#5AC8C8","italic":true}]

execute if score @s sf.sig_cd matches 1.. run return run tellraw @s [{"text":"── ","color":"dark_gray"},{"text":"UMBRA FIELD STATUS","color":"#5AC8C8","bold":true},{"text":" ──\n","color":"dark_gray"},{"text":"  RADIO  ","color":"#6A6A78","bold":true},{"text":"RETUNING","color":"#FFC36B","bold":true},{"text":"\n  The receiver is clearing residual interference before another assignment can be requested.","color":"gray"}]

tellraw @s [{"text":"── ","color":"dark_gray"},{"text":"UMBRA FIELD STATUS","color":"#5AC8C8","bold":true},{"text":" ──\n","color":"dark_gray"},{"text":"  RADIO  ","color":"#6A6A78","bold":true},{"text":"READY","color":"#9BFFB0","bold":true},{"text":"\n  No investigation or personal assignment is active.","color":"gray"}]