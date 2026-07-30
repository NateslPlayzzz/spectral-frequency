# tool/flashlight/tick.mcfunction
# Runs every two ticks while sf.flashlight_on is active.

execute if score @s sf.claimed matches 1.. run return run function sf:tool/flashlight/off
execute if entity @s[gamemode=spectator] run return run function sf:tool/flashlight/off

# Functional light requires the Flashlight to remain in the main hand.
execute unless items entity @s weapon.mainhand *[custom_data~{sf:{item:"flashlight"}}] run return run function sf:tool/flashlight/off

# A stale participant cannot provide or receive case-local light behavior.
execute if data storage sf:case {state:"active"} if entity @s[tag=sf.case_participant] unless score @s sf.case_gen = #case_serial sf.data run return run function sf:tool/flashlight/off

tag @s add spectral.lit

# Temporary visual beam pending the final resource-pack presentation pass.
particle minecraft:end_rod ^ ^ ^1.5 0.05 0.05 0.05 0.0 1