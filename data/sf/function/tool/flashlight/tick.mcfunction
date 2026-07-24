# tool/flashlight/tick.mcfunction
# Runs as the player every two ticks while sf.flashlight_on is active.

# Claimed and spectator players cannot remain functionally lit.
execute if score @s sf.claimed matches 1.. run return run function sf:tool/flashlight/off
execute if entity @s[gamemode=spectator] run return run function sf:tool/flashlight/off

# The flashlight functions only while it remains in the main hand.
# Validate before adding spectral.lit so an invalid item cannot produce
# one extra protected cycle.
execute unless items entity @s weapon.mainhand *[custom_data~{sf:{item:"flashlight"}}] run return run function sf:tool/flashlight/off

tag @s add spectral.lit

# Temporary vanilla visual until the resource-pack and display pass.
particle minecraft:end_rod ^ ^ ^1.5 0.05 0.05 0.05 0.0 1