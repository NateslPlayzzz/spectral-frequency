# case/abandoned.mcfunction
# Closes an investigation after sixty seconds without a living or Taken
# current-generation participant online.

execute unless data storage sf:case {state:"active"} run return 0

tellraw @a [{"text":"[","color":"dark_gray"},{"text":"FIELD CONTROL","color":"#FFC36B","bold":true},{"text":"] ","color":"dark_gray"},{"text":"An unattended investigation exceeded its reconnect window and was closed without reward.","color":"gray"}]

function sf:case/teardown_lost