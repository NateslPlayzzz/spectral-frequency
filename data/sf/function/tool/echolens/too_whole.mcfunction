# tool/echolens/too_whole.mcfunction
# The Investigator remains too coherent to perceive the Veil.

title @s actionbar {"text":"your reflection is too whole · the Lens opens at Thinning Memory","color":"dark_gray","italic":true}

playsound minecraft:block.amethyst_block.step player @s ~ ~ ~ 0.4 0.6
particle minecraft:dust{color:[0.55,0.55,0.62],scale:0.8} ~ ~1 ~ 0.2 0.2 0.2 0.0 4