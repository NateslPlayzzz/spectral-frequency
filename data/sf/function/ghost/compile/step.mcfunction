# ghost/compile/step.mcfunction — pop head, stamp tag, recurse on tail
data modify storage sf:temp compile.head set from storage sf:temp compile.modules[0]
function sf:ghost/compile/add with storage sf:temp compile
data remove storage sf:temp compile.modules[0]
execute if data storage sf:temp compile.modules[0] run function sf:ghost/compile/step