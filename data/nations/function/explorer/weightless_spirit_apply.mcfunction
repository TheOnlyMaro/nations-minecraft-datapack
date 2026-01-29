# nations:explorer/weightless_spirit_apply
# Called as the arrow entity (@s = arrow)
# Applies no_gravity and marks as processed

# Apply no_gravity to this arrow
data modify entity @s NoGravity set value 1b

# Mark arrow as processed so we don't check it again
tag @s add weightless_processed
tag @s add weightless_arrow

# Signal to parent function that an arrow was processed
scoreboard players set #arrow_found nations_pid 1
