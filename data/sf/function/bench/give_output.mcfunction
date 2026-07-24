# give_output.mcfunction — macro: route to the tool's existing give function
$function sf:tool/give_$(out)
title @s actionbar ["",{"text":"crafted: ","color":"#9BFFB0"},{"text":"$(name)","color":"white"}]