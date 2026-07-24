# tool/contain/success.mcfunction
# Runs as the authoritative containment operator.

# Stop player channel state while preserving the target until it dissolves.
scoreboard players set @s sf.contain_active 0
scoreboard players set @s sf.contain_progress 0

tag @s remove sf.contain_operator
tag @s remove sf.contain_probe

scoreboard players set @s sf.was_aggressive 0
tag @s remove sf.fragment_new

# Preserve the contained identity before case teardown.
data modify storage sf:temp seen.id set from storage sf:case id
function sf:guide/discover with storage sf:temp seen

# Capture difficulty from the exact target.
execute if entity @e[type=minecraft:marker,tag=sf.contain_target,tag=sf.tier.aggressive,distance=..6,limit=1] run scoreboard players set @s sf.was_aggressive 1

# Resolve the selected physical manifestation.
execute at @s run function sf:ghost/contain/resolve
function sf:tool/contain/release_target

function sf:sfx/contain_success

# Successful containment restores Memory.
scoreboard players add @s sf.coherence 25
execute if score @s sf.coherence matches 101.. run scoreboard players set @s sf.coherence 100

# Record the unique fragment while sf:case id still exists.
function sf:reconstruct/grant_shard

title @s times 5 50 20

execute if entity @s[tag=sf.fragment_new,tag=spectral.reconstructed] run title @s title {"text":"RECONSTRUCTION COMPLETE","color":"#C89BFF","bold":true}
execute if entity @s[tag=sf.fragment_new,tag=spectral.reconstructed] run title @s subtitle {"text":"twelve distinct fragments remembered","color":"white","italic":true}

execute if entity @s[tag=sf.fragment_new,tag=!spectral.reconstructed] run title @s title {"text":"BOUND","color":"#C89BFF","bold":true}
execute if entity @s[tag=sf.fragment_new,tag=!spectral.reconstructed] run title @s subtitle {"text":"a new fragment remembered","color":"white","italic":true}

execute unless entity @s[tag=sf.fragment_new] run title @s title {"text":"BOUND","color":"#C89BFF","bold":true}
execute unless entity @s[tag=sf.fragment_new] run title @s subtitle {"text":"this fragment was already remembered","color":"gray","italic":true}

# Aggressive cases can award a physical Veil Shard.
execute if score @s sf.was_aggressive matches 1 at @s run loot spawn ~ ~1 ~ loot sf:material/veil_shard

# Residue from the bound fragment.
execute at @s run loot spawn ~ ~1 ~ loot sf:material/ectoplasm
execute at @s run loot spawn ~ ~1 ~ loot sf:material/ectoplasm

# Teardown only after persistent progression is written.
function sf:case/reset
function sf:case/resolve

# First containment completes guided onboarding.
execute if score @s sf.quest matches 4 run function sf:quest/step4_done

function sf:reward/score
advancement grant @s only sf:first_contain

tag @s remove sf.fragment_new