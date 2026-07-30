# tool/sensor/use.mcfunction
# Deploys, relocates, or retrieves the player's one active Motion Sensor.

scoreboard players set @s sf.tool_cd 8

execute unless data storage sf:case {state:"active"} run return run title @s actionbar {"text":"a sensor can only monitor an active investigation","color":"dark_gray","italic":true}
execute unless entity @s[tag=sf.case_participant] run return run title @s actionbar {"text":"this investigation is not linked to your field channel","color":"#FFC36B","italic":true}
execute unless score @s sf.case_gen = #case_serial sf.data run return run title @s actionbar {"text":"your field channel belongs to another investigation","color":"#FFC36B","italic":true}
execute if score @s sf.claimed matches 1.. run return 0
execute if entity @s[gamemode=spectator] run return 0

data modify storage sf:temp sensor.uuid set from entity @s UUID
function sf:tool/sensor/use_resolved with storage sf:temp sensor
data remove storage sf:temp sensor