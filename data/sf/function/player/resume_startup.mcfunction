# player/resume_startup.mcfunction — as @s.
# Recovers an interrupted or migrated step-1 onboarding sequence.

tag @s add spectral.startup_pending
scoreboard players set @s sf.timer -40
function sf:player/welcome