# guide/page/ghosts.mcfunction

tellraw @s ""
tellraw @s [{"text":"─ ","color":"#6A6A78"},{"text":"FRAGMENT IDENTIFICATION","color":"#D8C8A0","bold":true}]

execute if entity @s[tag=sf.seen_banshee] run tellraw @s [{"text":"Banshee","color":"white"},{"text":" — EMF, Spirit Box, Freezing","color":"#8A8A98"},{"text":" · singles out one listener","color":"#C89BFF","italic":true}]
execute unless entity @s[tag=sf.seen_banshee] run tellraw @s [{"text":"———","color":"#5A4A4A"},{"text":" — unremembered","color":"#5A4A4A","italic":true}]

execute if entity @s[tag=sf.seen_shadow] run tellraw @s [{"text":"Shadow","color":"white"},{"text":" — EMF, Freezing, UV Traces","color":"#8A8A98"},{"text":" · recoils from spectral light","color":"#C89BFF","italic":true}]
execute unless entity @s[tag=sf.seen_shadow] run tellraw @s [{"text":"———","color":"#5A4A4A"},{"text":" — unremembered","color":"#5A4A4A","italic":true}]

execute if entity @s[tag=sf.seen_specter] run tellraw @s [{"text":"Specter","color":"white"},{"text":" — EMF, Spirit Box, UV Traces","color":"#8A8A98"},{"text":" · appears where it is not","color":"#C89BFF","italic":true}]
execute unless entity @s[tag=sf.seen_specter] run tellraw @s [{"text":"———","color":"#5A4A4A"},{"text":" — unremembered","color":"#5A4A4A","italic":true}]

execute if entity @s[tag=sf.seen_poltergeist] run tellraw @s [{"text":"Poltergeist","color":"white"},{"text":" — EMF, Ghost Writing, UV Traces","color":"#8A8A98"},{"text":" · violent barrages spoil exposed pages","color":"#C89BFF","italic":true}]
execute unless entity @s[tag=sf.seen_poltergeist] run tellraw @s [{"text":"———","color":"#5A4A4A"},{"text":" — unremembered","color":"#5A4A4A","italic":true}]

execute if entity @s[tag=sf.seen_revenant] run tellraw @s [{"text":"Revenant","color":"white"},{"text":" — EMF, Freezing, Ghost Writing","color":"#8A8A98"},{"text":" · closes faster on failing Memory","color":"#C89BFF","italic":true}]
execute unless entity @s[tag=sf.seen_revenant] run tellraw @s [{"text":"———","color":"#5A4A4A"},{"text":" — unremembered","color":"#5A4A4A","italic":true}]

execute if entity @s[tag=sf.seen_mare] run tellraw @s [{"text":"Mare","color":"white"},{"text":" — Spirit Box, Ghost Writing, Freezing","color":"#8A8A98"},{"text":" · presses into unlit darkness","color":"#C89BFF","italic":true}]
execute unless entity @s[tag=sf.seen_mare] run tellraw @s [{"text":"———","color":"#5A4A4A"},{"text":" — unremembered","color":"#5A4A4A","italic":true}]

execute if entity @s[tag=sf.seen_whisper] run tellraw @s [{"text":"Whisper","color":"white"},{"text":" — Spirit Box, Ghost Writing, Veil Echo","color":"#8A8A98"},{"text":" · calls to isolated listeners","color":"#C89BFF","italic":true}]
execute unless entity @s[tag=sf.seen_whisper] run tellraw @s [{"text":"———","color":"#5A4A4A"},{"text":" — unremembered","color":"#5A4A4A","italic":true}]

execute if entity @s[tag=sf.seen_wraith] run tellraw @s [{"text":"Wraith","color":"white"},{"text":" — EMF, Freezing, Veil Echo","color":"#8A8A98"},{"text":" · darkness does not shorten its sight","color":"#C89BFF","italic":true}]
execute unless entity @s[tag=sf.seen_wraith] run tellraw @s [{"text":"———","color":"#5A4A4A"},{"text":" — unremembered","color":"#5A4A4A","italic":true}]

execute if entity @s[tag=sf.seen_phantom] run tellraw @s [{"text":"Phantom","color":"white"},{"text":" — EMF, Ghost Writing, Veil Echo","color":"#8A8A98"},{"text":" · reforms beside its observer","color":"#C89BFF","italic":true}]
execute unless entity @s[tag=sf.seen_phantom] run tellraw @s [{"text":"———","color":"#5A4A4A"},{"text":" — unremembered","color":"#5A4A4A","italic":true}]

execute if entity @s[tag=sf.seen_shade] run tellraw @s [{"text":"Shade","color":"white"},{"text":" — Ghost Writing, UV Traces, Veil Echo","color":"#8A8A98"},{"text":" · quiets when the team stays together","color":"#C89BFF","italic":true}]
execute unless entity @s[tag=sf.seen_shade] run tellraw @s [{"text":"———","color":"#5A4A4A"},{"text":" — unremembered","color":"#5A4A4A","italic":true}]

execute if entity @s[tag=sf.seen_hollow] run tellraw @s [{"text":"Hollow","color":"white"},{"text":" — Freezing, Spirit Box, Veil Echo","color":"#8A8A98"},{"text":" · empties nearby instrument channels","color":"#C89BFF","italic":true}]
execute unless entity @s[tag=sf.seen_hollow] run tellraw @s [{"text":"———","color":"#5A4A4A"},{"text":" — unremembered","color":"#5A4A4A","italic":true}]

execute if entity @s[tag=sf.seen_dread] run tellraw @s [{"text":"The Dread","color":"white"},{"text":" — EMF, UV Traces, Veil Echo","color":"#8A8A98"},{"text":" · its Hunt warning collapses early","color":"#FF8E8E","italic":true}]
execute unless entity @s[tag=sf.seen_dread] run tellraw @s [{"text":"———","color":"#5A4A4A"},{"text":" — unremembered","color":"#5A4A4A","italic":true}]

tellraw @s [{"text":"  ","color":"#6A6A78"},{"score":{"name":"@s","objective":"sf.shard_count"},"color":"#C89BFF"},{"text":" of 12 fragments remembered","color":"#6A6A78","italic":true}]
tellraw @s [{"text":"  ◀ back","color":"#6A6A78","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 7"}}]