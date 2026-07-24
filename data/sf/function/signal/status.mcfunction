# signal/status.mcfunction
# Reports only the requesting Investigator's Radio state.

playsound minecraft:block.note_block.bit player @s ~ ~ ~ 0.45 1.1

# A live investigation remains globally shared.
execute if data storage sf:case {state:"active"} run return run tellraw @s [{"text":"── ","color":"dark_gray"},{"text":"UMBRA FIELD STATUS","color":"#5AC8C8","bold":true},{"text":" ──\n","color":"dark_gray"},{"text":"  CASE: ","color":"#6A6A78","bold":true},{"text":"ACTIVE","color":"#8B0000","bold":true},{"text":"\n  ORDERS: ","color":"#6A6A78","bold":true},{"text":"Gather three signs, identify the manifestation, and contain it.","color":"gray"}]

function sf:signal/recover

execute if entity @s[tag=sf.seeking,tag=sf.signal_wrong_dimension] run return run tellraw @s [{"text":"── ","color":"dark_gray"},{"text":"UMBRA FIELD STATUS","color":"#5AC8C8","bold":true},{"text":" ──\n","color":"dark_gray"},{"text":"  SIGNAL: ","color":"#6A6A78","bold":true},{"text":"OUT OF RANGE","color":"#FFC36B","bold":true},{"text":"\n  Your assignment remains saved in another dimension.","color":"gray"},{"text":"\n  Hold the Radio after returning to resume directional telemetry.","color":"#8A8A98","italic":true}]

execute if entity @s[tag=sf.seeking,tag=sf.signal_suspended] run return run tellraw @s [{"text":"── ","color":"dark_gray"},{"text":"UMBRA FIELD STATUS","color":"#5AC8C8","bold":true},{"text":" ──\n","color":"dark_gray"},{"text":"  SIGNAL: ","color":"#6A6A78","bold":true},{"text":"SUSPENDED","color":"#FFC36B","bold":true},{"text":"\n  The assignment will resume when the current live investigation closes.","color":"gray"}]

execute if entity @s[tag=sf.seeking] run return run tellraw @s [{"text":"── ","color":"dark_gray"},{"text":"UMBRA FIELD STATUS","color":"#5AC8C8","bold":true},{"text":" ──\n","color":"dark_gray"},{"text":"  SIGNAL: ","color":"#6A6A78","bold":true},{"text":"TRACKING","color":"#FFC36B","bold":true},{"text":"\n  LAST HORIZONTAL RANGE: ","color":"#6A6A78","bold":true},{"score":{"name":"@s","objective":"sf.sig_dist"},"color":"white"},{"text":"m","color":"gray"},{"text":"\n  Hold the Field Radio for direction and signal strength.","color":"#5AC8C8","italic":true}]

execute if score @s sf.sig_cd matches 1.. run return run tellraw @s [{"text":"── ","color":"dark_gray"},{"text":"UMBRA FIELD STATUS","color":"#5AC8C8","bold":true},{"text":" ──\n","color":"dark_gray"},{"text":"  RADIO: ","color":"#6A6A78","bold":true},{"text":"RETUNING","color":"#FFC36B","bold":true},{"text":"\n  The receiver is clearing residual interference.","color":"gray"}]

tellraw @s [{"text":"── ","color":"dark_gray"},{"text":"UMBRA FIELD STATUS","color":"#5AC8C8","bold":true},{"text":" ──\n","color":"dark_gray"},{"text":"  RADIO: ","color":"#6A6A78","bold":true},{"text":"READY","color":"#9BFFB0","bold":true},{"text":"\n  No investigation or assigned signal is active.","color":"gray"}]