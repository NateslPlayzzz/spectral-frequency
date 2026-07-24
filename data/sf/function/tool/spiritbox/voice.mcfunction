# tool/spiritbox/voice.mcfunction — the box answers
playsound minecraft:entity.warden.tendril_clicks ambient @s ~ ~ ~ 0.7 0.8
playsound minecraft:block.sculk_sensor.clicking ambient @s ~ ~ ~ 0.5 0.6
execute store result score #line sf.data run random value 1..4
execute if score #line sf.data matches 1 run title @s actionbar {"text":"\u201c\u2026here\u2026\u201d","color":"#9BFFB0","italic":true}
execute if score #line sf.data matches 2 run title @s actionbar {"text":"\u201c\u2026cold\u2026\u201d","color":"#9BFFB0","italic":true}
execute if score #line sf.data matches 3 run title @s actionbar {"text":"\u201c\u2026leave\u2026\u201d","color":"#9BFFB0","italic":true}
execute if score #line sf.data matches 4 run title @s actionbar {"text":"\u201c\u2026you\u2026\u201d","color":"#9BFFB0","italic":true}