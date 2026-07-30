# case/orphaned.mcfunction
# Closes a case whose authoritative manifestation vanished or duplicated.

execute unless data storage sf:case {state:"active"} run return 0

title @a[tag=sf.case_participant] times 10 55 15
title @a[tag=sf.case_participant] title {"text":"CASE ABORTED","color":"#FFC36B","bold":true}
title @a[tag=sf.case_participant] subtitle {"text":"the manifestation record became unstable","color":"gray","italic":true}

tellraw @a [{"text":"[","color":"dark_gray"},{"text":"FIELD CONTROL","color":"#FFC36B","bold":true},{"text":"] ","color":"dark_gray"},{"text":"The presence is gone or duplicated. The investigation has been closed without reward.","color":"gray"}]

function sf:case/teardown_lost