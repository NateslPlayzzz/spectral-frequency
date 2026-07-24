# forgotten/profile/complete.mcfunction
# Expects sf:temp finale.ending to contain "protocol" or "vigil".

function sf:player/data/ensure

data modify storage sf:temp finale.uuid set from entity @s UUID
function sf:forgotten/profile/complete_macro with storage sf:temp finale