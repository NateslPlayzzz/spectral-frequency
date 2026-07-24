# requisition/restore_access.mcfunction
# Access equipment does not consume an emergency field-kit claim.

tag @s remove sf.requisition_access

# Investigator's Guidebook
execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"guide"}}] 0
execute if score #req_has sf.data matches 0 run tag @s add sf.requisition_access
execute if score #req_has sf.data matches 0 run function sf:tool/give_guidebook

# Field Radio
execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"radio"}}] 0
execute if score #req_has sf.data matches 0 run tag @s add sf.requisition_access
execute if score #req_has sf.data matches 0 run function sf:tool/give_radio

# Resonance Key
execute store result score #req_has sf.data run clear @s *[custom_data~{sf:{item:"reskey"}}] 0
execute if score #req_has sf.data matches 0 run tag @s add sf.requisition_access
execute if score #req_has sf.data matches 0 run function sf:tool/give_reskey