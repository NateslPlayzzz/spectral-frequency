# case/fail.mcfunction
# Runs when no living current-generation participant remains.

execute unless data storage sf:case {state:"active"} run return 0

title @a[tag=sf.case_participant] times 10 60 20
title @a[tag=sf.case_participant] title {"text":"CASE LOST","color":"dark_red","bold":true}
title @a[tag=sf.case_participant] subtitle {"text":"no one remained to hold the memory","color":"#5A2A2A","italic":true}

tellraw @a[tag=sf.case_participant] [{"text":"◈ ","color":"#7A5CFF"},{"text":"The presence fades. The investigation is lost — for now.","color":"#8A8A98"}]

function sf:case/teardown_lost