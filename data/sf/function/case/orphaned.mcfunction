# case/orphaned.mcfunction
# Closes an investigation whose authoritative manifestation vanished or duplicated.

execute unless data storage sf:case {state:"active"} run return 0

title @a[tag=sf.case_participant] times 10 55 15
title @a[tag=sf.case_participant] title {"text":"INVESTIGATION ABORTED","color":"#FFC36B","bold":true}
title @a[tag=sf.case_participant] subtitle {"text":"manifestation authority became unstable","color":"gray","italic":true}

tellraw @a [{"text":"[","color":"dark_gray"},{"text":"FIELD CONTROL","color":"#FFC36B","bold":true},{"text":"] ","color":"dark_gray"},{"text":"The authoritative manifestation vanished or duplicated. The investigation was closed without progression or rewards.","color":"gray"}]

function sf:case/teardown_lost