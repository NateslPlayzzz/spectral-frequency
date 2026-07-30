# ghost/defs/register.mcfunction
# Spectral Frequency 1.0 standard manifestation registry.
#
# Evidence keys:
#   emf
#   freezing
#   spirit_box
#   ghost_writing
#   uv
#   veil_echo
#
# Signature keys provide restrained fragment-specific behavior without
# replacing the shared movement, evidence, or Hunt engines.

# ------------------------------------------------------------
# STANDARD REGISTRY
# ------------------------------------------------------------

data modify storage sf:ghost_defs banshee set value {evidence:["emf","spirit_box","freezing"],timing_tier:"aggressive",modules:["whisper","cold_breath"],signature:"banshee",theme:"banshee",shard:"grief"}
data modify storage sf:ghost_defs shadow set value {evidence:["emf","freezing","uv"],timing_tier:"normal",modules:["light_flicker","cold_breath"],signature:"shadow",theme:"shadow",shard:"fear"}
data modify storage sf:ghost_defs specter set value {evidence:["emf","spirit_box","uv"],timing_tier:"normal",modules:["object_rattle"],signature:"specter",theme:"specter",shard:"pride"}
data modify storage sf:ghost_defs poltergeist set value {evidence:["emf","ghost_writing","uv"],timing_tier:"aggressive",modules:["object_rattle","light_flicker"],signature:"poltergeist",theme:"poltergeist",shard:"rage"}
data modify storage sf:ghost_defs revenant set value {evidence:["emf","freezing","ghost_writing"],timing_tier:"aggressive",modules:["object_rattle","cold_breath"],signature:"revenant",theme:"revenant",shard:"vengeance"}
data modify storage sf:ghost_defs mare set value {evidence:["spirit_box","ghost_writing","freezing"],timing_tier:"normal",modules:["light_flicker","cold_breath"],signature:"mare",theme:"mare",shard:"despair"}

# ------------------------------------------------------------
# EXPANDED VEIL REGISTRY
# ------------------------------------------------------------

data modify storage sf:ghost_defs whisper set value {evidence:["spirit_box","ghost_writing","veil_echo"],timing_tier:"normal",modules:["whisper"],signature:"whisper",theme:"whisper",shard:"longing"}
data modify storage sf:ghost_defs wraith set value {evidence:["emf","freezing","veil_echo"],timing_tier:"aggressive",modules:["cold_breath","object_rattle"],signature:"wraith",theme:"wraith",shard:"guilt"}
data modify storage sf:ghost_defs phantom set value {evidence:["emf","ghost_writing","veil_echo"],timing_tier:"normal",modules:["whisper","light_flicker"],signature:"phantom",theme:"phantom",shard:"delusion"}
data modify storage sf:ghost_defs shade set value {evidence:["ghost_writing","uv","veil_echo"],timing_tier:"normal",modules:["whisper"],signature:"shade",theme:"shade",shard:"sorrow"}
data modify storage sf:ghost_defs hollow set value {evidence:["freezing","spirit_box","veil_echo"],timing_tier:"normal",modules:["cold_breath","whisper"],signature:"hollow",theme:"hollow",shard:"emptiness"}
data modify storage sf:ghost_defs dread set value {evidence:["emf","uv","veil_echo"],timing_tier:"aggressive",modules:["object_rattle","light_flicker"],signature:"dread",theme:"dread",shard:"terror"}

# All twelve fragments are available once the corresponding equipment and
# evidence routes have been unlocked.
data modify storage sf:ghost_defs index set value ["banshee","shadow","specter","poltergeist","revenant","mare","whisper","wraith","phantom","shade","hollow","dread"]
scoreboard players set #ghost_count sf.data 12

# Reconstruction target.
data modify storage sf:reconstruct all_shards set value ["grief","fear","pride","rage","vengeance","despair","longing","guilt","delusion","sorrow","emptiness","terror"]
scoreboard players set #shard_total sf.data 12