# guide/page/investigate.mcfunction

tellraw @s ""
tellraw @s [{"text":"─ ","color":"dark_gray"},{"text":"INVESTIGATION PROCEDURE","color":"#D8C8A0","bold":true}]
tellraw @s [{"text":"A manifestation is the active entity in the field. Your classification identifies the fragment behind it.","color":"gray"}]
tellraw @s [{"text":"1. ","color":"#D8C8A0","bold":true},{"text":"Follow the Field Radio signal and open the investigation source.","color":"gray"}]
tellraw @s [{"text":"2. ","color":"#D8C8A0","bold":true},{"text":"Use your instruments near the manifestation. Every fragment has exactly three evidence types.","color":"gray"}]
tellraw @s [{"text":"3. ","color":"#D8C8A0","bold":true},{"text":"Open the Current Case Journal and confirm that all three evidence types are recorded.","color":"gray"}]
tellraw @s [{"text":"4. ","color":"#D8C8A0","bold":true},{"text":"Compare the evidence fingerprint with the Fragment Registry and file one classification.","color":"gray"}]
tellraw @s [{"text":"5. ","color":"#D8C8A0","bold":true},{"text":"Hold the Containment Focus near the calm manifestation. The Focus tests both your classification and confirmed evidence.","color":"gray"}]
tellraw @s [{"text":"At reduced Memory, some instrument readings become unstable. Repeat uncertain results before trusting them. Physical UV Traces remain authoritative.","color":"#FFC36B","italic":true}]
tellraw @s [{"text":"Containment does not identify the fragment for you. A wrong classification is rejected without revealing which conclusion failed.","color":"#8A8A98","italic":true}]
tellraw @s [{"text":"  ◀ back","color":"dark_gray","underlined":true,"click_event":{"action":"run_command","command":"/trigger sf.guide set 7"}}]