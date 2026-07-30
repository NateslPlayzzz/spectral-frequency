# case/reward_participant.mcfunction
# Runs once as every online enrolled participant after successful containment
# and before the active case record is erased.

tag @s remove sf.fragment_new

# ------------------------------------------------------------
# FRAGMENT DISCOVERY
# ------------------------------------------------------------

data modify storage sf:temp seen.id set from storage sf:case id
function sf:guide/discover with storage sf:temp seen

# Store the emotional fragment for this participant.
# Duplicate cases remain successful but do not increase the unique total.
function sf:reconstruct/grant_shard

# ------------------------------------------------------------
# CASE RECOVERY
# ------------------------------------------------------------

scoreboard players add @s sf.coherence 25
execute if score @s sf.coherence matches 101.. run scoreboard players set @s sf.coherence 100

# Every participant receives personal residue rather than competing for
# shared drops at the containment operator's position.
loot give @s loot sf:material/ectoplasm
loot give @s loot sf:material/ectoplasm

execute if score @s sf.was_aggressive matches 1 run loot give @s loot sf:material/veil_shard

tellraw @s [{"text": "[","color": "dark_gray"},{"text": "FIELD RECOVERY","color": "#9BFFB0","bold": true},{"text": "] ","color": "dark_gray"},{"text": "Two Ectoplasm secured to your personal kit.","color": "gray"}]

execute if score @s sf.was_aggressive matches 1 run tellraw @s [{"text": "[","color": "dark_gray"},{"text": "FIELD RECOVERY","color": "#C89BFF","bold": true},{"text": "] ","color": "dark_gray"},{"text": "Aggressive residue crystallized into one Veil Shard.","color": "gray"}]

# ------------------------------------------------------------
# PERSONAL CASE PRESENTATION
# ------------------------------------------------------------

title @s times 5 50 20

execute if entity @s[tag=sf.fragment_new,tag=spectral.reconstructed] run title @s title {"text": "RECONSTRUCTION COMPLETE","color": "#C89BFF","bold": true}

execute if entity @s[tag=sf.fragment_new,tag=spectral.reconstructed] run title @s subtitle {"text": "twelve distinct fragments remembered","color": "white","italic": true}

execute if entity @s[tag=sf.fragment_new,tag=!spectral.reconstructed] run title @s title {"text": "BOUND","color": "#C89BFF","bold": true}

execute if entity @s[tag=sf.fragment_new,tag=!spectral.reconstructed] run title @s subtitle {"text": "a new fragment remembered","color": "white","italic": true}

execute unless entity @s[tag=sf.fragment_new] run title @s title {"text": "BOUND","color": "#C89BFF","bold": true}

execute unless entity @s[tag=sf.fragment_new] run title @s subtitle {"text": "this fragment was already remembered","color": "gray","italic": true}

# ------------------------------------------------------------
# ONBOARDING AND PERFORMANCE
# ------------------------------------------------------------

# Tutorial cases are private, so this still applies only to the onboarding
# Investigator during ordinary play.
execute if score @s sf.quest matches 4 run function sf:quest/step4_done

# Score each participant from their own photography, Hunt survival,
# low-Memory exposure, and the shared manifestation tier.
function sf:reward/score

advancement grant @s only sf:first_contain

tag @s remove sf.fragment_new
data remove storage sf:temp seen