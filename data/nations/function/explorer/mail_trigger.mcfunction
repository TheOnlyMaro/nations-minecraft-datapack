# nations:explorer/mail_trigger
# Display list of online players to send item to

# Check: Holding an item in main hand
execute unless data entity @s SelectedItem run tellraw @s {"text":"Hold an item in your main hand to send!","color":"red"}
execute unless data entity @s SelectedItem run return fail

# Check: Has 5+ XP levels
execute unless entity @s[level=5..] run tellraw @s {"text":"You need 5 XP levels to send mail!","color":"red"}
execute unless entity @s[level=5..] run return fail

# Display Header
tellraw @s [{"text":"━━━━━━━━━━━━ ","color":"dark_aqua","bold":true},{"text":"SEND MAIL","color":"aqua","bold":true},{"text":" ━━━━━━━━━━━━","color":"dark_aqua","bold":true}]
tellraw @s {"text":"Type: /trigger nations_mail_id set <number>","color":"gray","italic":true}
tellraw @s {"text":""}

# List all online players with their IDs
execute as @a run tellraw @a[predicate=nations:is_explorer,scores={nations_mail_trigger=1..},limit=1] [{"text":"  ","color":"gray"},{"score":{"name":"@s","objective":"nations_pid"},"color":"gold","bold":true},{"text":" - ","color":"gray"},{"selector":"@s","color":"yellow"}]

# Footer
tellraw @s {"text":""}
tellraw @s [{"text":"Cost: ","color":"gray"},{"text":"5 XP Levels","color":"gold"}]
tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_aqua","bold":true}
