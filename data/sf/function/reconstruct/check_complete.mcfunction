# reconstruct/check_complete.mcfunction
# Runs after a NEW fragment is stored.

# Three unique fragments unlock the Warding Totem formula after onboarding.
execute if score @s sf.quest matches 100 if score @s sf.oq_totem matches 0 if score @s sf.shard_count matches 3.. run function sf:quest/opt/totem_done

# Twelve unique fragments complete Reconstruction exactly once.
execute if score @s sf.shard_count >= #shard_total sf.data run return run function sf:reconstruct/complete

# Anything below twelve receives an ordinary progress message.
function sf:reconstruct/progress_msg