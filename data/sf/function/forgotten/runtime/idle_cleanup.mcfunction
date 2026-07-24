# forgotten/runtime/idle_cleanup.mcfunction

kill @e[tag=sf.forgotten]

data remove storage sf:forgotten witness
data remove storage sf:forgotten dimension
data remove storage sf:forgotten origin
data remove storage sf:forgotten thin
data remove storage sf:forgotten threshold
data remove storage sf:forgotten manifest
data remove storage sf:forgotten ending

function sf:forgotten/authority/idle_reset