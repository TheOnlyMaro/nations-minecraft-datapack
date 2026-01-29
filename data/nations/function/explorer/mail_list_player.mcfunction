# nations:explorer/mail_list_player
# Executed AS each potential recipient
# We need to display this player's name AND make it clickable with their PID

# Tag self temporarily for selector
tag @s add nations_mail_target

# Store PID for macro
execute store result storage nations:temp pid int 1 run scoreboard players get @s nations_pid

# Call macro - it will display to sender, using @a[tag=nations_mail_target] for name
function nations:explorer/mail_list_player_macro with storage nations:temp

# Remove tag
tag @s remove nations_mail_target
