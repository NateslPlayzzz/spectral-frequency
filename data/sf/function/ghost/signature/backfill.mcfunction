# ghost/signature/backfill.mcfunction
# Restores the signature tag of an already-loaded manifestation after an
# upgrade or ordinary reload.

tag @s remove sf.sig.banshee
tag @s remove sf.sig.shadow
tag @s remove sf.sig.specter
tag @s remove sf.sig.poltergeist
tag @s remove sf.sig.revenant
tag @s remove sf.sig.mare
tag @s remove sf.sig.whisper
tag @s remove sf.sig.wraith
tag @s remove sf.sig.phantom
tag @s remove sf.sig.shade
tag @s remove sf.sig.hollow
tag @s remove sf.sig.dread

execute if data entity @s {data:{sf:{ghost_id:"banshee"}}} run tag @s add sf.sig.banshee
execute if data entity @s {data:{sf:{ghost_id:"shadow"}}} run tag @s add sf.sig.shadow
execute if data entity @s {data:{sf:{ghost_id:"specter"}}} run tag @s add sf.sig.specter
execute if data entity @s {data:{sf:{ghost_id:"poltergeist"}}} run tag @s add sf.sig.poltergeist
execute if data entity @s {data:{sf:{ghost_id:"revenant"}}} run tag @s add sf.sig.revenant
execute if data entity @s {data:{sf:{ghost_id:"mare"}}} run tag @s add sf.sig.mare
execute if data entity @s {data:{sf:{ghost_id:"whisper"}}} run tag @s add sf.sig.whisper
execute if data entity @s {data:{sf:{ghost_id:"wraith"}}} run tag @s add sf.sig.wraith
execute if data entity @s {data:{sf:{ghost_id:"phantom"}}} run tag @s add sf.sig.phantom
execute if data entity @s {data:{sf:{ghost_id:"shade"}}} run tag @s add sf.sig.shade
execute if data entity @s {data:{sf:{ghost_id:"hollow"}}} run tag @s add sf.sig.hollow
execute if data entity @s {data:{sf:{ghost_id:"dread"}}} run tag @s add sf.sig.dread