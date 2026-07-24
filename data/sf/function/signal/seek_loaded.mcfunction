# signal/seek_loaded.mcfunction
# Macro context:
# {
#   active:true,
#   x:<int>,
#   y:<int>,
#   z:<int>,
#   dimension:"namespace:id"
# }

# Derived HUD state is recalculated every second.
function sf:signal/clear_hud_tags

# ------------------------------------------------------------
# DIMENSION GUARD
# ------------------------------------------------------------

$execute unless dimension $(dimension) run tag @s add sf.signal_wrong_dimension

# Wrong-dimension static only sounds while the Radio is being held.
$execute unless dimension $(dimension) if items entity @s weapon.mainhand *[custom_data~{sf:{item:"radio"}}] run scoreboard players add @s sf.sig_miss 1
$execute unless dimension $(dimension) unless items entity @s weapon.mainhand *[custom_data~{sf:{item:"radio"}}] run scoreboard players set @s sf.sig_miss 0

$execute unless dimension $(dimension) if score @s sf.sig_miss matches 4.. if items entity @s weapon.mainhand *[custom_data~{sf:{item:"radio"}}] run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 0.35 0.5
$execute unless dimension $(dimension) if score @s sf.sig_miss matches 4.. if items entity @s weapon.mainhand *[custom_data~{sf:{item:"radio"}}] run particle minecraft:smoke ~ ~1 ~ 0.2 0.3 0.2 0.01 5
$execute unless dimension $(dimension) if score @s sf.sig_miss matches 4.. run scoreboard players set @s sf.sig_miss 0

$execute unless dimension $(dimension) run return 0

tag @s remove sf.signal_wrong_dimension

# ------------------------------------------------------------
# SIGNED HORIZONTAL OFFSET
# ------------------------------------------------------------
#
# Positive X = east.
# Negative X = west.
# Positive Z = south.
# Negative Z = north.

execute store result score #px sf.sig_dist run data get entity @s Pos[0] 1
execute store result score #pz sf.sig_dist run data get entity @s Pos[2] 1

$scoreboard players set #tx sf.sig_dist $(x)
$scoreboard players set #tz sf.sig_dist $(z)

scoreboard players operation #dx sf.sig_dist = #tx sf.sig_dist
scoreboard players operation #dx sf.sig_dist -= #px sf.sig_dist

scoreboard players operation #dz sf.sig_dist = #tz sf.sig_dist
scoreboard players operation #dz sf.sig_dist -= #pz sf.sig_dist

# ------------------------------------------------------------
# ABSOLUTE OFFSETS AND RANGE
# ------------------------------------------------------------

scoreboard players operation #adx sf.sig_dist = #dx sf.sig_dist
execute if score #adx sf.sig_dist matches ..-1 run scoreboard players operation #adx sf.sig_dist *= #neg sf.data

scoreboard players operation #adz sf.sig_dist = #dz sf.sig_dist
execute if score #adz sf.sig_dist matches ..-1 run scoreboard players operation #adz sf.sig_dist *= #neg sf.data

# Manhattan horizontal range.
scoreboard players operation @s sf.sig_dist = #adx sf.sig_dist
scoreboard players operation @s sf.sig_dist += #adz sf.sig_dist

# ------------------------------------------------------------
# ARRIVAL
# ------------------------------------------------------------

execute if score @s sf.sig_dist matches ..10 run return run function sf:signal/arrive

# ------------------------------------------------------------
# SIGNAL STRENGTH
# ------------------------------------------------------------

execute if score @s sf.sig_dist matches 11..25 run tag @s add sf.signal_close
execute if score @s sf.sig_dist matches 26..55 run tag @s add sf.signal_mid
execute if score @s sf.sig_dist matches 56.. run tag @s add sf.signal_far

# ------------------------------------------------------------
# CARDINAL DIRECTION
# ------------------------------------------------------------
#
# Start with the dominant axis.

execute if score #adx sf.sig_dist >= #adz sf.sig_dist if score #dx sf.sig_dist matches 1.. run tag @s add sf.signal_e
execute if score #adx sf.sig_dist >= #adz sf.sig_dist if score #dx sf.sig_dist matches ..-1 run tag @s add sf.signal_w

execute if score #adz sf.sig_dist > #adx sf.sig_dist if score #dz sf.sig_dist matches 1.. run tag @s add sf.signal_s
execute if score #adz sf.sig_dist > #adx sf.sig_dist if score #dz sf.sig_dist matches ..-1 run tag @s add sf.signal_n

# ------------------------------------------------------------
# DIAGONAL DIRECTION
# ------------------------------------------------------------
#
# Use a diagonal when neither axis is more than twice the other.
# This prevents tiny side offsets from constantly producing diagonal labels.

scoreboard players set #two sf.sig_dist 2

scoreboard players operation #twodx sf.sig_dist = #adx sf.sig_dist
scoreboard players operation #twodx sf.sig_dist *= #two sf.sig_dist

scoreboard players operation #twodz sf.sig_dist = #adz sf.sig_dist
scoreboard players operation #twodz sf.sig_dist *= #two sf.sig_dist

scoreboard players set #diag sf.sig_dist 0

execute if score #twodx sf.sig_dist >= #adz sf.sig_dist if score #twodz sf.sig_dist >= #adx sf.sig_dist if score #adx sf.sig_dist matches 1.. if score #adz sf.sig_dist matches 1.. run scoreboard players set #diag sf.sig_dist 1

# Remove the default cardinal direction before assigning a diagonal.
execute if score #diag sf.sig_dist matches 1 run tag @s remove sf.signal_n
execute if score #diag sf.sig_dist matches 1 run tag @s remove sf.signal_e
execute if score #diag sf.sig_dist matches 1 run tag @s remove sf.signal_s
execute if score #diag sf.sig_dist matches 1 run tag @s remove sf.signal_w

execute if score #diag sf.sig_dist matches 1 if score #dx sf.sig_dist matches 1.. if score #dz sf.sig_dist matches ..-1 run tag @s add sf.signal_ne
execute if score #diag sf.sig_dist matches 1 if score #dx sf.sig_dist matches 1.. if score #dz sf.sig_dist matches 1.. run tag @s add sf.signal_se
execute if score #diag sf.sig_dist matches 1 if score #dx sf.sig_dist matches ..-1 if score #dz sf.sig_dist matches 1.. run tag @s add sf.signal_sw
execute if score #diag sf.sig_dist matches 1 if score #dx sf.sig_dist matches ..-1 if score #dz sf.sig_dist matches ..-1 run tag @s add sf.signal_nw

# ------------------------------------------------------------
# RADIO-ONLY PULSE CADENCE
# ------------------------------------------------------------
#
# Putting the Radio away preserves the assignment but silences its pulse.

execute unless items entity @s weapon.mainhand *[custom_data~{sf:{item:"radio"}}] run scoreboard players set @s sf.sig_miss 0
execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"radio"}}] run scoreboard players add @s sf.sig_miss 1

# Close: every 2 seconds.
execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"radio"}}] if entity @s[tag=sf.signal_close] if score @s sf.sig_miss matches 2.. run function sf:signal/ping_close

# Mid: every 3 seconds.
execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"radio"}}] if entity @s[tag=sf.signal_mid] if score @s sf.sig_miss matches 3.. run function sf:signal/ping_mid

# Far: every 4 seconds.
execute if items entity @s weapon.mainhand *[custom_data~{sf:{item:"radio"}}] if entity @s[tag=sf.signal_far] if score @s sf.sig_miss matches 4.. run function sf:signal/ping_far