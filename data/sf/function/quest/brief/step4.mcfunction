# quest/brief/step4.mcfunction
# Teaches classification-bound containment.

data modify storage sf:temp vline set value "Now act on your classification. The Containment Focus compares the fragment you filed with the active manifestation."
function sf:quest/vance

data modify storage sf:temp vline set value "It also verifies the three confirmed evidence types. If either conclusion is wrong, the binding fails without revealing which mistake you made."
function sf:quest/vance

function sf:tool/give_contain

data modify storage sf:temp vline set value "[Hold the Containment Focus near the calm Banshee manifestation and maintain the binding.]"
function sf:quest/vance