# player/1s_tick.mcfunction — runs as @s (player) once per second
function sf:memory/update
execute if score @s sf.writing_active matches 1.. run function sf:tool/writing/channel
# Quest briefing dispatcher — fires a step's briefing once when reached
execute if score @s sf.quest matches 1.. unless score @s sf.q_briefed >= @s sf.quest run function sf:quest/brief
execute if score @s sf.offer_active matches 1 run scoreboard players remove @s sf.offer_timer 1
execute if score @s sf.offer_active matches 1 if score @s sf.offer_timer matches ..0 run function sf:offer/expire
execute if entity @s[tag=spectral.reconstructed,tag=!sf.forgotten_seen] run function sf:forgotten/awaken
execute if entity @s[tag=sf.at_threshold] if score @s sf.coherence_band matches 0 run function sf:forgotten/threshold_reached