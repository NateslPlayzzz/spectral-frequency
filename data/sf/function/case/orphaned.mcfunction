# case/orphaned.mcfunction — the case's ghost vanished without a proper end
data modify storage sf:case state set value "inactive"
data remove storage sf:case id
tellraw @a [{"text":"\u25c8 ","color":"#7A5CFF"},{"text":"","color":"#6A6A78"},{"text":"The presence is gone. The trail goes cold.","color":"#8A8A98"}]