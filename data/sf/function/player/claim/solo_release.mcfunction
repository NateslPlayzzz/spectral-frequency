# player/claim/solo_release.mcfunction
# Runs as the pending Taken player.

# A case that already ended needs no failure teardown.
execute unless data storage sf:case {state:"active"} run tag @s remove sf.solo_release_pending
execute unless data storage sf:case {state:"active"} run return 0

# A participant was revived during the dramatic delay.
execute if entity @a[tag=sf.case_participant,scores={sf.claimed=0}] run tag @s remove sf.solo_release_pending
execute if entity @a[tag=sf.case_participant,scores={sf.claimed=0}] run return 0

function sf:case/fail