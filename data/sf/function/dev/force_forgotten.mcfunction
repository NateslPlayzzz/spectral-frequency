# dev/force_forgotten.mcfunction
# Marks the executing development profile as reconstructed and finale-ready.
# It no longer starts the finale automatically.

tag @s add spectral.reconstructed
scoreboard players set @s sf.shard_count 12

function sf:forgotten/profile/mark_ready

tellraw @s [{"text":"[","color":"dark_gray"},{"text":"DEV","color":"#FFC36B","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Reconstruction and finale readiness granted. Start deliberately through the Guidebook.","color":"gray"}]