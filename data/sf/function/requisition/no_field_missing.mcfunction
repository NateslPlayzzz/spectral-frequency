# requisition/no_field_missing.mcfunction

execute if entity @s[tag=sf.requisition_access] run title @s times 5 40 15
execute if entity @s[tag=sf.requisition_access] run title @s title {"text":"ACCESS RESTORED","color":"#5AC8C8","bold":true}
execute if entity @s[tag=sf.requisition_access] run title @s subtitle {"text":"no emergency claim was consumed","color":"gray","italic":true}

execute unless entity @s[tag=sf.requisition_access] run title @s times 5 35 10
execute unless entity @s[tag=sf.requisition_access] run title @s title {"text":"KIT VERIFIED","color":"#9BFFB0","bold":true}
execute unless entity @s[tag=sf.requisition_access] run title @s subtitle {"text":"all field instruments accounted for","color":"gray","italic":true}

playsound minecraft:block.note_block.bit player @s ~ ~ ~ 0.45 1.25

tellraw @s [{"text":"[","color":"dark_gray"},{"text":"LOGISTICS","color":"#D8C8A0","bold":true},{"text":"] ","color":"dark_gray"},{"text":"No emergency field-kit claim was consumed.","color":"gray"}]

tag @s remove sf.requisition_access