# ghost/compile/run.mcfunction
# Runs as a freshly summoned manifestation.

tag @s remove sf.compiling

execute if data storage sf:temp compile.modules[0] run function sf:ghost/compile/step
execute if data storage sf:temp compile.evidence[0] run function sf:ghost/compile/evi_step

function sf:ghost/compile/tier with storage sf:temp compile
function sf:ghost/compile/signature with storage sf:temp compile

scoreboard players set @s sf.roam_timer 8