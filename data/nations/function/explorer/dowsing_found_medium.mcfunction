# Called when storage found 6-10 blocks away
scoreboard players set #found nations_pid 2

# Store target coordinates
execute store result storage nations:dowsing target_x int 1 run data get entity @s Pos[0]
execute store result storage nations:dowsing target_y int 1 run data get entity @s Pos[1]
execute store result storage nations:dowsing target_z int 1 run data get entity @s Pos[2]
