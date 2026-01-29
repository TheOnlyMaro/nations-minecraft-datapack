# nations:enchanter/raycast_mend
# Recursive raycast to find Enchanting Table (5 blocks)
# Uses tracking score to limit distance to 5 blocks (10 steps of 0.5)

# Check for table at current position
execute if block ~ ~ ~ minecraft:enchanting_table run function nations:enchanter/blood_mend/blood_mend
execute if block ~ ~ ~ minecraft:enchanting_table run return 1

# Increment distance tracker
scoreboard players add #raycast_temp nations_temp 1

# Continue if distance < 10 (5 blocks)
execute if score #raycast_temp nations_temp matches ..10 positioned ^ ^ ^0.5 run function nations:enchanter/blood_mend/raycast_mend
