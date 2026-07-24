# forgotten/profile/mark_completed.mcfunction

function sf:player/data/ensure

data modify storage sf:temp finale.uuid set from entity @s UUID
function sf:forgotten/profile/mark_completed_macro with storage sf:temp finale