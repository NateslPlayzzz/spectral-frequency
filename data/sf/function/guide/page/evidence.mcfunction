# guide/page/evidence.mcfunction

tellraw @s ""
tellraw @s [{"text":"─ ","color":"dark_gray"},{"text":"EVIDENCE TYPES","color":"#D8C8A0","bold":true}]

tellraw @s [{"text":"EMF Level 5","color":"#7A5CFF"},{"text":" — scan near the manifestation. Level 5 confirms electromagnetic activity.","color":"gray"}]

tellraw @s [{"text":"Freezing Temperatures","color":"#5AC8C8"},{"text":" — sample the air where the manifestation lingers.","color":"gray"}]

tellraw @s [{"text":"Spirit Box","color":"#9BFFB0"},{"text":" — communicate in darkness while remaining near the manifestation.","color":"gray"}]

tellraw @s [{"text":"Ghost Writing","color":"#FFC36B"},{"text":" — hold the Writing Detector nearby and expose its page for five seconds.","color":"gray"}]

tellraw @s [{"text":"UV Traces","color":"#C89BFF"},{"text":" — sweep the manifestation's recent path. Revealed residue fades quickly.","color":"gray"}]

tellraw @s [{"text":"Veil Echo","color":"#C89BFF"},{"text":" — use the Echo Lens at Thinning Memory or worse. Each exposure costs Memory; deeper loss produces clearer readings.","color":"gray"}]

tellraw @s [{"text":"At reduced Memory, unstable instrument results must be repeated before the Journal accepts them.","color":"#FFC36B","italic":true}]

tellraw @s [{"text":"Physical UV residue confirms immediately. At Erased Memory, the Echo Lens also becomes stable—but you do not.","color":"#8A8A98","italic":true}]

tellraw @s [{"text":"  ◀ back","color":"dark_gray","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 7"}}]