# forgotten/threshold_reached.mcfunction — the sacrifice is made; he surfaces
tag @s remove sf.at_threshold
scoreboard players set @s sf.forgotten_phase 2
tag @s add sf.forgotten_active
# Lock the world: no dispatch/cases/offers during the finale
scoreboard players set @s sf.recon_pull 0
# Begin manifestation sequence
function sf:forgotten/manifest