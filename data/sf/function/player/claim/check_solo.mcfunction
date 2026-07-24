# player/claim/check_solo.mcfunction
# Fail only when no living participant remains online.

execute unless entity @a[tag=sf.case_participant,scores={sf.claimed=0}] run function sf:player/claim/solo_fail