# ghost/compile/evi_step.mcfunction — pop evidence head, stamp sf.evit.<x>, recurse
data modify storage sf:temp compile.head set from storage sf:temp compile.evidence[0]
function sf:ghost/compile/add_evi with storage sf:temp compile
data remove storage sf:temp compile.evidence[0]
execute if data storage sf:temp compile.evidence[0] run function sf:ghost/compile/evi_step