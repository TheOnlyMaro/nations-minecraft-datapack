# Called when storage found within 5 blocks
scoreboard players set #found nations_pid 1

# Store target coordinates
execute store result storage nations:dowsing target_x int 1 run data get entity @s Pos[0]
execute store result storage nations:dowsing target_y int 1 run data get entity @s Pos[1]
execute store result storage nations:dowsing target_z int 1 run data get entity @s Pos[2]
