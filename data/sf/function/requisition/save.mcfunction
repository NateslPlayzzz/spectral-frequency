# requisition/save.mcfunction

data modify storage sf:temp requisition.uuid set from entity @s UUID
execute store result storage sf:temp requisition.used int 1 run scoreboard players get @s sf.req_used

function sf:requisition/save_macro with storage sf:temp requisition