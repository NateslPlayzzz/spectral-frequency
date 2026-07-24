# core/purge/remove_storage.mcfunction
# Removes every currently known persistent and temporary storage field.
#
# purge_remove_gear is deliberately preserved when present so offline players
# can be cleaned when they first return after reinstall.

# ------------------------------------------------------------
# CONFIGURATION
# ------------------------------------------------------------

data remove storage sf:config ambient_drain
data remove storage sf:config bench_catalog_v1
data remove storage sf:config contain_drain
data remove storage sf:config contain_need
data remove storage sf:config dispatch_radio_v1
data remove storage sf:config flashlight_warmth
data remove storage sf:config hunt_cooldown
data remove storage sf:config hunt_grace
data remove storage sf:config incense_cooldown
data remove storage sf:config initialized
data remove storage sf:config offer_chance
data remove storage sf:config photo_cooldown
data remove storage sf:config photo_reward
data remove storage sf:config radio_cooldown
data remove storage sf:config recover_rate
data remove storage sf:config requisition_claims_v1
data remove storage sf:config requisition_limit
data remove storage sf:config revive_cost
data remove storage sf:config revive_interaction_v1
data remove storage sf:config revive_need
data remove storage sf:config sensor_radius
data remove storage sf:config sight_drain
data remove storage sf:config totem_duration
data remove storage sf:config totem_radius
data remove storage sf:config totem_recover
data remove storage sf:config world_forget

# ------------------------------------------------------------
# PLAYER, CASE, AND PROGRESSION DATA
# ------------------------------------------------------------

data remove storage sf:player_data entries

data remove storage sf:case state
data remove storage sf:case id
data remove storage sf:case mode
data remove storage sf:case owner
data remove storage sf:case dimension
data remove storage sf:case spawn
data remove storage sf:case participants
data remove storage sf:case resolver
data remove storage sf:case result
data remove storage sf:case ghost

data remove storage sf:reconstruct all_shards
data remove storage sf:signal target
data remove storage sf:forgotten thin
data remove storage sf:world ending

# ------------------------------------------------------------
# GENERATED DEFINITIONS AND RECIPES
# ------------------------------------------------------------

data remove storage sf:ghost_defs index
data remove storage sf:ghost_defs banshee
data remove storage sf:ghost_defs dread
data remove storage sf:ghost_defs hollow
data remove storage sf:ghost_defs mare
data remove storage sf:ghost_defs phantom
data remove storage sf:ghost_defs poltergeist
data remove storage sf:ghost_defs revenant
data remove storage sf:ghost_defs shade
data remove storage sf:ghost_defs shadow
data remove storage sf:ghost_defs specter
data remove storage sf:ghost_defs whisper
data remove storage sf:ghost_defs wraith

data remove storage sf:recipes list

# ------------------------------------------------------------
# BENCH TRANSACTIONS
# ------------------------------------------------------------

data remove storage sf:bench candidate
data remove storage sf:bench consume
data remove storage sf:bench current
data remove storage sf:bench cursor
data remove storage sf:bench scan
data remove storage sf:bench scoop

# Legacy transaction fields.
data remove storage sf:bench crafter
data remove storage sf:bench cursor_used
data remove storage sf:bench give_one
data remove storage sf:bench input

# ------------------------------------------------------------
# SHARED TEMPORARY STORAGE
# ------------------------------------------------------------

data remove storage sf:temp barslot
data remove storage sf:temp case
data remove storage sf:temp compile
data remove storage sf:temp contain
data remove storage sf:temp grant
data remove storage sf:temp idx
data remove storage sf:temp profile
data remove storage sf:temp qstep
data remove storage sf:temp quuid
data remove storage sf:temp release
data remove storage sf:temp remnant
data remove storage sf:temp requisition
data remove storage sf:temp revive
data remove storage sf:temp roam
data remove storage sf:temp ruuid
data remove storage sf:temp seen
data remove storage sf:temp shards
data remove storage sf:temp signal
data remove storage sf:temp spawn
data remove storage sf:temp uchk
data remove storage sf:temp uuid
data remove storage sf:temp vline

# ------------------------------------------------------------
# SYSTEM TOMBSTONE
# ------------------------------------------------------------

data remove storage sf:system version
data remove storage sf:system build
data remove storage sf:system schema
data remove storage sf:system enabled
data remove storage sf:system purged
data remove storage sf:system last_action
data remove storage sf:system purge_armed

data modify storage sf:system version set value "1.0"
data modify storage sf:system build set value "purged"
data modify storage sf:system schema set value 0
data modify storage sf:system enabled set value false
data modify storage sf:system purged set value true
data modify storage sf:system last_action set value "full_purge"