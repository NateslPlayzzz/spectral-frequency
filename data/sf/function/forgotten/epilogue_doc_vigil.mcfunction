# epilogue_doc_vigil.mcfunction — as @s. The Vigil ending's final document.
loot give @s loot sf:reward/lore/ending_vigil
title @s actionbar {"text":"\u2709 a letter, unsent","color":"#C89BFF","italic":true}
playsound minecraft:item.book.page_turn player @s ~ ~ ~ 1 0.9
