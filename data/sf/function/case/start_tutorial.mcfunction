# case/start_tutorial.mcfunction
# Attempts to open the scripted Banshee tutorial.
#
# Returns 1 when opened.
# Returns 0 when another case is active.

execute if data storage sf:case {state:"active"} run return 0

data modify storage sf:case id set value "banshee"
data modify storage sf:case mode set value "tutorial"

function sf:case/open

return 1