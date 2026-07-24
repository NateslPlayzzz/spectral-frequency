# forgotten/menu_status.mcfunction
# Displays persistent finale status on the Reconstruction page.

function sf:player/data/ensure

data modify storage sf:temp finale.uuid set from entity @s UUID
function sf:forgotten/menu_status_macro with storage sf:temp finale