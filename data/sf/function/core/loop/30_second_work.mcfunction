# core/loop/30_second_work.mcfunction
# Slow environmental pressure and cleanup.
#
# This file must never schedule the loop. Scheduling belongs exclusively to
# core/loop/30_second.mcfunction.

# Revealed UV traces expire even if the originating case has already ended.
kill @e[tag=sf.uv_trace,tag=sf.uv_shown]

# No passive Memory pressure outside an active investigation.
execute unless data storage sf:case {state:"active"} run return 0

# ------------------------------------------------------------
# UNLIT PARTICIPANTS
# ------------------------------------------------------------
#
# Only enrolled, graduated, living participants near the manifestation lose
# ambient Memory. Active containment is excluded.

execute as @a[tag=spectral.sf_init,tag=sf.case_participant,gamemode=!spectator,scores={sf.quest=100..,sf.claimed=0,sf.contain_active=0,sf.coherence=1..}] at @s if entity @e[type=minecraft:marker, tag=sf.ghost,distance=..48] unless entity @s[tag=spectral.lit] run scoreboard players operation @s sf.coherence -= #ambient_drain sf.data

# ------------------------------------------------------------
# LIT PARTICIPANTS
# ------------------------------------------------------------
#
# Light restores a small amount of Memory while near the manifestation, but
# cannot revive a player from zero or exceed the normal 100-point ceiling.

execute as @a[tag=spectral.sf_init,tag=sf.case_participant,tag=spectral.lit,gamemode=!spectator,scores={sf.quest=100..,sf.claimed=0,sf.contain_active=0,sf.coherence=1..99}] at @s if entity @e[type=minecraft:marker,tag=sf.ghost,distance=..48] run scoreboard players operation @s sf.coherence += #flashlight_warmth sf.data