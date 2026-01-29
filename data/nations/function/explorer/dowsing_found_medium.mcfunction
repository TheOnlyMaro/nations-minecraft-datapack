# Called when storage found 6-10 blocks away
scoreboard players set #found nations_pid 2

# Store target coordinates using current execution position
# Summon a marker at the block position, read its coords, then remove it
summon marker ~ ~ ~ {Tags:["dowsing_temp"]}
execute store result storage nations:dowsing target_x int 1 run data get entity @e[type=marker,tag=dowsing_temp,limit=1] Pos[0]
execute store result storage nations:dowsing target_y int 1 run data get entity @e[type=marker,tag=dowsing_temp,limit=1] Pos[1]
execute store result storage nations:dowsing target_z int 1 run data get entity @e[type=marker,tag=dowsing_temp,limit=1] Pos[2]
kill @e[type=marker,tag=dowsing_temp]
