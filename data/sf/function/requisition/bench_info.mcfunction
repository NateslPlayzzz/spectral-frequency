# requisition/bench_info.mcfunction

tellraw @s ""
tellraw @s [{"text":"── ","color":"dark_gray"},{"text":"ATTUNED BENCH MATERIAL TIERS","color":"#C89BFF","bold":true},{"text":" ──","color":"dark_gray"}]

tellraw @s [{"text":"  CALIBRATION INSTRUMENTS","color":"#D8C8A0","bold":true}]
tellraw @s [{"text":"  EMF · Thermometer · Spirit Box · UV · Writing · Containment","color":"gray"}]
tellraw @s [{"text":"  Iron, Redstone, Glass, and Amethyst. The attuned barrel itself supplies the resonance.","color":"#8A8A98","italic":true}]

tellraw @s [{"text":"\n  ATTUNED FIELD DEVICES","color":"#5AC8C8","bold":true}]
tellraw @s [{"text":"  Flashlight · Camera · Sensor · Radio · Key · Emergency Beacon","color":"gray"}]
tellraw @s [{"text":"  These designs add Ectoplasm to ordinary mechanical materials.","color":"#8A8A98","italic":true}]

tellraw @s [{"text":"\n  RESTRICTED EQUIPMENT","color":"#FFC36B","bold":true}]
tellraw @s [{"text":"  Warding Totem · Soul Incense · Echo Lens","color":"gray"}]
tellraw @s [{"text":"  These formulas require Veil Shards and explicit field authorization.","color":"#8A8A98","italic":true}]

tellraw @s [{"text":"\nTwo emergency claims protect new Investigators from permanent equipment loss. They are not a renewable supply source.","color":"#D8C8A0","italic":true}]

playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.35 0.7