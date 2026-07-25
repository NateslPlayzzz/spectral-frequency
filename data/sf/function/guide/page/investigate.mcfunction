# guide/page/investigate.mcfunction

tellraw @s ""
tellraw @s [{"text":"─ ","color":"dark_gray"},{"text":"HOW TO INVESTIGATE","color":"#D8C8A0","bold":true}]

tellraw @s [{"text":"Something is in here with you. Your task is to learn ","color":"gray"},{"text":"what","color":"white","italic":true},{"text":" it is.","color":"gray"}]

tellraw @s [{"text":"1. ","color":"#D8C8A0"},{"text":"Gather evidence with your instruments. Each standard fragment leaves three signs.","color":"gray"}]

tellraw @s [{"text":"2. ","color":"#D8C8A0"},{"text":"Open the Guidebook's Current Case Journal to review confirmed signs.","color":"gray"}]

tellraw @s [{"text":"3. ","color":"#D8C8A0"},{"text":"Compare those signs with the registered fingerprints and file a classification.","color":"gray"}]

tellraw @s [{"text":"4. ","color":"#D8C8A0"},{"text":"Hold the Containment Focus near the manifestation to test and bind what you named.","color":"gray"}]

tellraw @s [{"text":"Beware: when your Memory fails, your instruments may ","color":"gray"},{"text":"lie","color":"red","italic":true},{"text":". Confirm uncertain readings before you classify.","color":"gray"}]

tellraw @s [{"text":"  ◀ back","color":"dark_gray","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 7"}}]