# forgotten/profile/mark_ready.mcfunction
# Marks the executing reconstructed Investigator as ready for deliberate
# finale activation.

function sf:player/data/ensure

data modify storage sf:temp finale.uuid set from entity @s UUID
function sf:forgotten/profile/mark_ready_macro with storage sf:temp finale