# forgotten/epilogue_protocol.mcfunction
# Compatibility entry point. Active epilogues are now loop-driven.

function sf:forgotten/authority/refresh

execute if data storage sf:forgotten {state:"epilogue",ending:"protocol"} as @a[tag=sf.forgotten_witness] run function sf:forgotten/epilogue_protocol_say