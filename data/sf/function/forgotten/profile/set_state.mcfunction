# forgotten/profile/set_state.mcfunction
# Expects sf:temp finale.state to contain the new persistent state.

function sf:player/data/ensure

data modify storage sf:temp finale.uuid set from entity @s UUID
function sf:forgotten/profile/set_state_macro with storage sf:temp finale