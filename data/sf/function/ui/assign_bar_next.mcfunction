# ui/assign_bar_next.mcfunction
execute if score #bar_next sf.data matches 8.. run return 0
execute unless entity @a[tag=spectral.sf_init,tag=!spectral.bar_assigned] run return 0
execute as @a[tag=spectral.sf_init,tag=!spectral.bar_assigned,sort=arbitrary,limit=1] run function sf:ui/assign_bar_current
