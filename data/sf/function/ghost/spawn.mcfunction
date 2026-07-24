# ghost/spawn.mcfunction — call with {id:"<ghost>"} at the spawn position
$summon marker ~ ~ ~ {Tags:["sf.ghost","spectral.anomaly","sf.state.idle","sf.compiling","smithed.entity","smithed.strict"],data:{sf:{ghost_id:"$(id)"}}}
$data modify storage sf:temp compile.modules set from storage sf:ghost_defs $(id).modules
$data modify storage sf:temp compile.evidence set from storage sf:ghost_defs $(id).evidence
$data modify storage sf:temp compile.timing_tier set from storage sf:ghost_defs $(id).timing_tier
execute as @e[type=marker,tag=sf.compiling] run function sf:ghost/compile/run
data remove storage sf:temp compile
data remove storage sf:temp spawn