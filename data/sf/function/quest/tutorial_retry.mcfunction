# quest/tutorial_retry.mcfunction
# Retries a queued tutorial after the current global case closes.

execute unless score @s sf.quest matches 1 run tag @s remove sf.tutorial_waiting
execute unless score @s sf.quest matches 1 run return 0

execute if function sf:case/start_tutorial run return run function sf:quest/tutorial_started

return 0