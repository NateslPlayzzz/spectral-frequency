# tool/camera/capture_ghost_first.mcfunction
# The first archival manifestation image of this investigation.

scoreboard players operation @s sf.coherence += #photo_reward sf.data
execute if score @s sf.coherence matches 101.. run scoreboard players set @s sf.coherence 100

scoreboard players set @s sf.case_photo 1

title @s times 5 40 15
title @s title {"text":" "}
title @s subtitle {"text": "— you caught it on film —","color": "#E0E0E0","italic": true}

function sf:sfx/photo

tellraw @s [{"text": "[","color": "dark_gray"},{"text": "◈","color": "#E0E0E0"},{"text": "] ","color": "dark_gray"},{"text": "The first image holds. The forgetting loosens its grip — +","color": "gray" },{"score": {"name": "#photo_reward","objective": "sf.data"},"color": "#E0E0E0"},{"text": " Memory.","color": "gray"}]