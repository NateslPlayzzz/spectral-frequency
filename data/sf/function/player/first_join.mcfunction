# player/first_join.mcfunction
# Runs only when a new UUID profile has just been created.

scoreboard players set @s sf.coherence 100
scoreboard players set @s sf.coherence_band 4
scoreboard players set @s sf.coherence_band_prev 4

scoreboard players set @s sf.timer 0
scoreboard players set @s sf.tool_cd 0
scoreboard players set @s sf.read_timer 0
scoreboard players set @s sf.read_type 0
scoreboard players set @s sf.read_val 0

scoreboard players set @s sf.claimed 0
scoreboard players set @s sf.req_used 0

tag @s remove spectral.coherence_frayed
tag @s remove spectral.coherence_thinning
tag @s remove spectral.coherence_unwritten
tag @s remove spectral.coherence_erased
tag @s add spectral.coherence_whole

function sf:quest/begin
function sf:player/welcome