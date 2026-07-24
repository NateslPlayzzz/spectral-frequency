# signal/seek.mcfunction
# Loads this Investigator's UUID-owned signal and updates tracking once
# per second.

data remove storage sf:temp signal.record
data modify storage sf:temp signal.uuid set from entity @s UUID
function sf:signal/data/load with storage sf:temp signal

# ------------------------------------------------------------
# INVALID OR MISSING RECORD
# ------------------------------------------------------------

execute unless data storage sf:temp signal.record{active:true} run tag @s remove sf.seeking
execute unless data storage sf:temp signal.record{active:true} run tag @s remove sf.signal_wrong_dimension
execute unless data storage sf:temp signal.record{active:true} run tag @s remove sf.signal_suspended
execute unless data storage sf:temp signal.record{active:true} run function sf:signal/clear_hud_tags
execute unless data storage sf:temp signal.record{active:true} run scoreboard players set @s sf.sig_miss 0
execute unless data storage sf:temp signal.record{active:true} run return 0

# ------------------------------------------------------------
# GLOBAL CASE SUSPENSION
# ------------------------------------------------------------
#
# Signals remain persistently assigned while another live investigation is
# open, but navigation feedback pauses until that case closes.

execute if data storage sf:case {state:"active"} run tag @s add sf.signal_suspended
execute if data storage sf:case {state:"active"} run tag @s remove sf.signal_wrong_dimension
execute if data storage sf:case {state:"active"} run function sf:signal/clear_hud_tags
execute if data storage sf:case {state:"active"} run scoreboard players set @s sf.sig_miss 0
execute if data storage sf:case {state:"active"} run return 0

tag @s remove sf.signal_suspended

# ------------------------------------------------------------
# ACTIVE TRACKING
# ------------------------------------------------------------

function sf:signal/seek_loaded with storage sf:temp signal.record