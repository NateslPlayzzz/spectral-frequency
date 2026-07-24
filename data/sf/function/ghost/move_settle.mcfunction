# ghost/move_settle.mcfunction — positioned at proposed (x,z), ghost's current Y.
# Require the step space passable (feet + head):
execute unless block ~ ~ ~ #sf:seethrough run return 0
execute unless block ~ ~0.5 ~ #sf:seethrough run return 0
# Find the floor within 1 up / 3 down. Commit at the first solid found, placing ghost atop it.
execute unless block ~ ~-0.1 ~ #sf:seethrough run return run function sf:ghost/move_commit
execute unless block ~ ~-1 ~ #sf:seethrough positioned ~ ~-1 ~ run return run function sf:ghost/move_commit
execute unless block ~ ~-2 ~ #sf:seethrough positioned ~ ~-2 ~ run return run function sf:ghost/move_commit
execute unless block ~ ~-3 ~ #sf:seethrough positioned ~ ~-3 ~ run return run function sf:ghost/move_commit
# No ground within 3 below -> it's a ledge/void. Refuse the step (don't move).
return 0