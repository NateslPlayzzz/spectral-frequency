# memory/ambient_tick.mcfunction
# Runs as one graduated Investigator every 30 seconds while they are
# within 48 blocks of an active manifestation.

# Containment has its own resistance system. Do not combine both drains.
execute if score @s sf.contain_active matches 1.. run return 0

# A functioning flashlight provides slow stabilization.
#
# It cannot recover a player from complete erasure. At 0 Memory, the
# player must use an anchor, ward, photograph reward, or another
# dedicated recovery mechanic.
execute if entity @s[tag=spectral.lit] if score @s sf.coherence matches 1..99 run scoreboard players operation @s sf.coherence += #flashlight_warmth sf.data

# Darkness slowly weakens Memory while inside the manifestation's field.
execute unless entity @s[tag=spectral.lit] run scoreboard players operation @s sf.coherence -= #ambient_drain sf.data

# Defensive clamps in case configuration values are altered.
execute if score @s sf.coherence matches 101.. run scoreboard players set @s sf.coherence 100
execute if score @s sf.coherence matches ..-1 run scoreboard players set @s sf.coherence 0