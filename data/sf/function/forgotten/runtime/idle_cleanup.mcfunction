# forgotten/runtime/idle_cleanup.mcfunction
# Returns the global finale runtime to a clean idle state without altering permanent profile outcomes.

schedule clear sf:forgotten/vigil_begin
schedule clear sf:forgotten/epilogue_protocol
schedule clear sf:forgotten/epilogue_vigil

kill @e[tag=sf.forgotten]

data remove storage sf:forgotten witness
data remove storage sf:forgotten dimension
data remove storage sf:forgotten origin
data remove storage sf:forgotten thin
data remove storage sf:forgotten threshold
data remove storage sf:forgotten manifest
data remove storage sf:forgotten ending

data remove storage sf:temp finale

function sf:forgotten/authority/idle_reset