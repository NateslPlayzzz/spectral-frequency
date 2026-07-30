# case/fail.mcfunction
# Runs when no living current-generation participant remains.

execute unless data storage sf:case {state:"active"} run return 0

title @a[tag=sf.case_participant] times 10 60 20
title @a[tag=sf.case_participant] title {"text":"INVESTIGATION LOST","color":"dark_red","bold":true}
title @a[tag=sf.case_participant] subtitle {"text":"no living Investigator remained","color":"#5A2A2A","italic":true}

tellraw @a[tag=sf.case_participant] [{"text":"[","color":"dark_gray"},{"text":"FIELD CONTROL","color":"dark_red","bold":true},{"text":"] ","color":"dark_gray"},{"text":"The manifestation has withdrawn. No fragment record or case reward was recovered.","color":"#8A8A98"}]

function sf:case/teardown_lost