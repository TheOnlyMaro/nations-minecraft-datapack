# nations:explorer/dowsing_found
# Called when a dowsing target is found
# Stores the block coordinates and shows feedback

# Mark as found
data modify storage nations:dowsing found set value 1b

# Store the found position
execute store result storage nations:dowsing target_x int 1 run data get entity @s Pos[0]
execute store result storage nations:dowsing target_y int 1 run data get entity @s Pos[1]
execute store result storage nations:dowsing target_z int 1 run data get entity @s Pos[2]

# Feedback
title @s actionbar [{"text":"Dowsing detected a target ","color":"aqua"},{"text":"[","color":"gray"},{"storage":"nations:dowsing","nbt":"target_x","color":"gold"},{"text":", ","color":"gray"},{"storage":"nations:dowsing","nbt":"target_y","color":"gold"},{"text":", ","color":"gray"},{"storage":"nations:dowsing","nbt":"target_z","color":"gold"},{"text":"]","color":"gray"}]
