# ui/actionbar.mcfunction
# Runs as @s every player tick.
#
# Renders one managed actionbar message by priority:
#
# 1. Revive channel
# 2. Containment channel
# 3. Transient tool reading
# 4. Held Field Radio navigation
# 5. Nothing

# Highest priority: revive.
execute if score @s sf.revive_progress matches 1.. run return run function sf:ui/ab/revive

# Containment progress.
execute if score @s sf.contain_active matches 1.. run return run function sf:ui/ab/contain

# Temporary evidence-tool reading.
execute if score @s sf.read_timer matches 1.. run return run function sf:ui/ab/reading

# Signal guidance is deliberately visible only while holding the Radio.
execute if entity @s[tag=sf.seeking] if items entity @s weapon.mainhand *[custom_data~{sf:{item:"radio"}}] run return run function sf:ui/ab/signal

# Otherwise leave the actionbar clear.