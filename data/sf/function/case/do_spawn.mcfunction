# case/do_spawn.mcfunction — macro: spawn the chosen ghost from sf:case.id
$data modify storage sf:temp spawn set value {id:"$(id)"}
function sf:ghost/spawn with storage sf:temp spawn