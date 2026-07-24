# forgotten/authority/sync.mcfunction
# Runs only as the authoritative online witness.

tag @s add sf.forgotten_witness
tag @s add sf.forgotten_active
tag @s remove sf.at_threshold

scoreboard players set @s sf.recon_pull 0

execute if data storage sf:forgotten {state:"pull"} run scoreboard players set @s sf.forgotten_phase 1
execute if data storage sf:forgotten {state:"pull"} run scoreboard players set @s sf.recon_pull 1

execute if data storage sf:forgotten {state:"threshold"} run scoreboard players set @s sf.forgotten_phase 1
execute if data storage sf:forgotten {state:"threshold"} run tag @s add sf.at_threshold

execute if data storage sf:forgotten {state:"manifest"} run scoreboard players set @s sf.forgotten_phase 2
execute if data storage sf:forgotten {state:"vigil"} run scoreboard players set @s sf.forgotten_phase 3
execute if data storage sf:forgotten {state:"choice"} run scoreboard players set @s sf.forgotten_phase 4
execute if data storage sf:forgotten {state:"epilogue"} run scoreboard players set @s sf.forgotten_phase 5