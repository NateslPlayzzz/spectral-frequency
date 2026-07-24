# tool/camera/capture_trace.mcfunction — photographed a revealed UV trace
scoreboard players add @s sf.coherence 4
execute if score @s sf.coherence matches 101.. run scoreboard players set @s sf.coherence 100
scoreboard players add @s sf.photo_count 1
title @s actionbar {"text":"a trace, preserved","color":"#C89BFF","italic":true}