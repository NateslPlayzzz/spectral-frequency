# epilogue_doc_protocol.mcfunction — as @s. The Protocol ending's final document.
loot give @s loot sf:reward/lore/ending_protocol
title @s actionbar {"text":"\u2709 a final transmission","color":"#5AC8C8","italic":true}
playsound minecraft:item.book.page_turn player @s ~ ~ ~ 1 0.9
