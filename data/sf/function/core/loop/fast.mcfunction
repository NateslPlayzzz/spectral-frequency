# core/loop/fast.mcfunction
# Fast visual and active-channel processing every two ticks.

schedule function sf:core/loop/fast 2t replace

execute store result score #hb_fast sf.data run time query gametime

execute as @e[type=marker,tag=sf.ghost,tag=sf.state.hunt] at @s run function sf:ghost/hunt/tick
execute as @e[type=marker,tag=sf.ghost,tag=sf.state.warning] at @s run function sf:ghost/hunt/warn_tick

execute as @a[tag=spectral.sf_init,scores={sf.contain_active=1..}] at @s run function sf:tool/contain/channel
execute as @a[tag=spectral.sf_init,scores={sf.flashlight_on=1..}] at @s run function sf:tool/flashlight/tick

# Idle roaming is dispatched exactly once.
execute as @e[type=marker,tag=sf.ghost,tag=!sf.forgotten,tag=sf.state.idle,tag=sf.roaming] at @s run function sf:ghost/roam/drift

execute as @a[tag=sf.forgotten_witness,scores={sf.forgotten_phase=3}] at @s run function sf:forgotten/choice_tick