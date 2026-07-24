# tool/contain/begin.mcfunction

scoreboard players set @s sf.tool_cd 6

execute unless data storage sf:case {state:"active"} run return run title @s actionbar {"text":"no active case to contain","color":"dark_gray","italic":true}

execute unless entity @s[tag=sf.case_participant] run return run title @s actionbar {"text":"this case is not assigned to your field channel","color":"#FFC36B","italic":true}

execute unless entity @e[type=marker,tag=sf.ghost,distance=..6] run return run title @s actionbar {"text":"no anomaly within reach","color":"dark_gray","italic":true}

execute as @e[type=marker,tag=sf.ghost,distance=..6,limit=1,sort=nearest] run function sf:tool/contain/check_id