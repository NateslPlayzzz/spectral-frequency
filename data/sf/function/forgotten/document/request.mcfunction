# forgotten/document/request.mcfunction
# Guidebook values:
# 17 = Protocol document
# 18 = Vigil document

execute if score @s sf.guide matches 17 run return run function sf:forgotten/document/request_protocol
execute if score @s sf.guide matches 18 run return run function sf:forgotten/document/request_vigil