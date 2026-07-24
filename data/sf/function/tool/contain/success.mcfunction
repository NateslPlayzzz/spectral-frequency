# tool/contain/success.mcfunction
# Runs as the player who completed containment.

# Stop the active channel immediately.
scoreboard players set @s sf.contain_active 0
scoreboard players set @s sf.contain_progress 0
scoreboard players set @s sf.was_aggressive 0
tag @s remove sf.fragment_new

# Preserve the contained ghost identity before the case is torn down.
data modify storage sf:temp seen.id set from storage sf:case id
function sf:guide/discover with storage sf:temp seen

# Capture difficulty before the ghost entity is removed.
execute if entity @e[type=marker,tag=sf.ghost,tag=sf.tier.aggressive,distance=..6] run scoreboard players set @s sf.was_aggressive 1

# Resolve the physical manifestation.
execute at @s run function sf:ghost/contain/resolve
function sf:sfx/contain_success

# Successful containment restores Memory, capped at the normal maximum.
scoreboard players add @s sf.coherence 25
execute if score @s sf.coherence matches 101.. run scoreboard players set @s sf.coherence 100

# Record the unique remembered fragment while sf:case id still exists.
function sf:reconstruct/grant_shard

# Containment feedback reflects whether this was a new fragment, a duplicate,
# or the twelfth unique fragment that completed Reconstruction.
title @s times 5 50 20

execute if entity @s[tag=sf.fragment_new,tag=spectral.reconstructed] run title @s title {"text":"RECONSTRUCTION COMPLETE","color":"#C89BFF","bold":true}
execute if entity @s[tag=sf.fragment_new,tag=spectral.reconstructed] run title @s subtitle {"text":"twelve distinct fragments remembered","color":"white","italic":true}

execute if entity @s[tag=sf.fragment_new,tag=!spectral.reconstructed] run title @s title {"text":"BOUND","color":"#C89BFF","bold":true}
execute if entity @s[tag=sf.fragment_new,tag=!spectral.reconstructed] run title @s subtitle {"text":"a new fragment remembered","color":"white","italic":true}

execute unless entity @s[tag=sf.fragment_new] run title @s title {"text":"BOUND","color":"#C89BFF","bold":true}
execute unless entity @s[tag=sf.fragment_new] run title @s subtitle {"text":"this fragment was already remembered","color":"gray","italic":true}

# Aggressive cases can still award a physical Veil Shard.
execute if score @s sf.was_aggressive matches 1 at @s run loot spawn ~ ~1 ~ loot sf:material/veil_shard

# Ectoplasm reward — residue of the bound fragment.
execute at @s run loot spawn ~ ~1 ~ loot sf:material/ectoplasm
execute at @s run loot spawn ~ ~1 ~ loot sf:material/ectoplasm

# End the shared case only after persistent progression has been written.
function sf:case/reset
function sf:case/resolve

# The first containment completes guided onboarding.
execute if score @s sf.quest matches 4 run function sf:quest/step4_done

# Score and issue the case reward.
function sf:reward/score
advancement grant @s only sf:first_contain

tag @s remove sf.fragment_new