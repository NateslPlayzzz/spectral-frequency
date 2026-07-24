# ghost/roam/stop.mcfunction — as @s (ghost). Settle; set the next wander delay.
tag @s remove sf.roaming
execute store result score @s sf.roam_timer run random value 6..14