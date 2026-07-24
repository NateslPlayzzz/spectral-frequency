# forgotten/give_epilogue_doc.mcfunction

execute unless data storage sf:forgotten {state:"epilogue"} run return 0
execute unless entity @s[tag=sf.forgotten_witness] run return 0

execute if data storage sf:forgotten {ending:"protocol"} run function sf:forgotten/epilogue_doc_protocol
execute if data storage sf:forgotten {ending:"vigil"} run function sf:forgotten/epilogue_doc_vigil