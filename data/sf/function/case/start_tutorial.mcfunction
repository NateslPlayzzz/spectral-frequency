# case/start_tutorial.mcfunction
# Attempts to open the scripted Banshee tutorial.

execute unless data storage sf:forgotten {state:"idle"} run return 0
execute if data storage sf:case {state:"active"} run return 0

data modify storage sf:case id set value "banshee"
data modify storage sf:case mode set value "tutorial"

function sf:case/open

return 1