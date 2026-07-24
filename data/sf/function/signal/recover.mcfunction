# signal/recover.mcfunction
# Restores runtime signal state from persistent UUID-owned storage.

data remove storage sf:temp signal.record
data modify storage sf:temp signal.uuid set from entity @s UUID
function sf:signal/data/load with storage sf:temp signal

# A valid saved signal restores tracking.
execute if data storage sf:temp signal.record{active:true} run tag @s add sf.seeking

# An old Part 1 seeking tag has no UUID-owned record and cannot be safely
# migrated.
execute unless data storage sf:temp signal.record{active:true} if entity @s[tag=sf.seeking,tag=!sf.signal_checked] run tellraw @s [{"text":"[","color":"dark_gray"},{"text":"DISPATCH","color":"#FFC36B","bold":true},{"text":"] ","color":"dark_gray"},{"text":"A legacy signal assignment was cleared during the Radio upgrade. Request a new reading when ready.","color":"gray"}]

execute unless data storage sf:temp signal.record{active:true} run tag @s remove sf.seeking
execute unless data storage sf:temp signal.record{active:true} run tag @s remove sf.signal_wrong_dimension
execute unless data storage sf:temp signal.record{active:true} run tag @s remove sf.signal_suspended
execute unless data storage sf:temp signal.record{active:true} run function sf:signal/clear_hud_tags
execute unless data storage sf:temp signal.record{active:true} run scoreboard players set @s sf.sig_miss 0

tag @s add sf.signal_checked