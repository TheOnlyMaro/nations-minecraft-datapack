# nations:explorer/dowsing/wall_x_pos_loop_y
# Y loop for right wall

# Early exit if found or past Y range
execute if score #found nations_pid matches 1.. run return 0
execute if score #scan_y nations_pid > #scan_y_max nations_pid run return 0

# Initialize Z counter
$scoreboard players set #scan_z nations_pid $(r_neg)
$scoreboard players set #scan_z_max nations_pid $(r)

# Store current Y for macro
execute store result storage nations:dowsing y int 1 run scoreboard players get #scan_y nations_pid

# Start Z loop
function nations:explorer/dowsing/wall_x_pos_loop_z with storage nations:dowsing

# Increment Y and continue
scoreboard players add #scan_y nations_pid 1
execute if score #found nations_pid matches 0 run function nations:explorer/dowsing/wall_x_pos_loop_y with storage nations:dowsing
