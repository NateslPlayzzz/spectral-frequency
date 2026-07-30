# guide/page/evidence.mcfunction

tellraw @s ""
tellraw @s [{"text":"─ ","color":"dark_gray"},{"text":"EVIDENCE REFERENCE","color":"#D8C8A0","bold":true}]
tellraw @s [{"text":"EMF Level 5","color":"#7A5CFF","bold":true},{"text":" — scan near the manifestation. A Level 5 result confirms electromagnetic activity.","color":"gray"}]
tellraw @s [{"text":"Freezing Temperatures","color":"#5AC8C8","bold":true},{"text":" — sample the air where the manifestation is currently active.","color":"gray"}]
tellraw @s [{"text":"Spirit Box","color":"#9BFFB0","bold":true},{"text":" — communicate in darkness while remaining near the manifestation.","color":"gray"}]
tellraw @s [{"text":"Ghost Writing","color":"#FFC36B","bold":true},{"text":" — expose the Writing Detector page near the manifestation for five uninterrupted seconds.","color":"gray"}]
tellraw @s [{"text":"UV Traces","color":"#C89BFF","bold":true},{"text":" — sweep the manifestation's recent path. Revealed physical residue fades quickly.","color":"gray"}]
tellraw @s [{"text":"Veil Echo","color":"#C89BFF","bold":true},{"text":" — use the Echo Lens at Thinning Memory or worse. Each valid exposure costs Memory.","color":"gray"}]
tellraw @s [{"text":"CONFIRMATION  ","color":"#6A6A78","bold":true},{"text":"At reduced Memory, unstable instrument results require a matching repeat before the Case Journal accepts them.","color":"#FFC36B","italic":true}]
tellraw @s [{"text":"EXCEPTIONS     ","color":"#6A6A78","bold":true},{"text":"Physical UV Traces confirm immediately. At Erased Memory, the Echo Lens also becomes stable—but you do not.","color":"#8A8A98","italic":true}]
tellraw @s [{"text":"  ◀ back","color":"dark_gray","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 7"}}]