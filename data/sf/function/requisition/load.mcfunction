# requisition/load.mcfunction
# Loads the player's persistent emergency-claim count.

function sf:player/data/ensure

data modify storage sf:temp requisition.uuid set from entity @s UUID
function sf:requisition/load_macro with storage sf:temp requisition

scoreboard players set #req_limit sf.data 2
execute store result score #req_limit sf.data run data get storage sf:config requisition_limit 1

scoreboard players operation #req_remaining sf.data = #req_limit sf.data
scoreboard players operation #req_remaining sf.data -= @s sf.req_used

execute if score #req_remaining sf.data matches ..-1 run scoreboard players set #req_remaining sf.data 0