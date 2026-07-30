# requisition/bench_info.mcfunction
# Displays the three Attuned Bench assembly divisions using final 1.0 equipment names.

tellraw @s ""
tellraw @s [{"text":"── ","color":"dark_gray"},{"text":"ATTUNED BENCH POLICY","color":"#C89BFF","bold":true},{"text":" ──","color":"dark_gray"}]

tellraw @s [{"text":"  CALIBRATION INSTRUMENTS","color":"#D8C8A0","bold":true}]
tellraw @s [{"text":"  EMF Detector · Thermometer · Spirit Box · UV Light · Writing Detector · Containment Focus","color":"gray"}]
tellraw @s [{"text":"  Ordinary conductive materials only: Iron, Redstone, Glass, and Amethyst.","color":"#8A8A98","italic":true}]

tellraw @s ""
tellraw @s [{"text":"  ATTUNED FIELD DEVICES","color":"#5AC8C8","bold":true}]
tellraw @s [{"text":"  Spectral Flashlight · Photo Camera · Motion Sensor · Resonance Key · Field Radio · Emergency Beacon","color":"gray"}]
tellraw @s [{"text":"  These permanent devices add Ectoplasm to ordinary mechanical materials.","color":"#8A8A98","italic":true}]

tellraw @s ""
tellraw @s [{"text":"  RESTRICTED FORMULAS","color":"#FFC36B","bold":true}]
tellraw @s [{"text":"  Warding Totem · Soul Incense · Echo Lens","color":"gray"}]
tellraw @s [{"text":"  Restricted formulas require Veil Shards, Ectoplasm, and the appropriate field authorization.","color":"#8A8A98","italic":true}]

tellraw @s ""
tellraw @s [{"text":"  Emergency recovery protects new Investigators from equipment loss. It is not a renewable equipment source.","color":"#D8C8A0","italic":true}]

playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.35 0.7