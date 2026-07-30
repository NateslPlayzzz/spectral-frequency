# evidence/reset_pending.mcfunction
# Clears transient unconfirmed readings for the one global active case.

scoreboard players set #pending_emf sf.data 0
scoreboard players set #pending_thermo sf.data 0
scoreboard players set #pending_box sf.data 0
scoreboard players set #pending_writing sf.data 0

scoreboard players set #scan_near sf.data 0