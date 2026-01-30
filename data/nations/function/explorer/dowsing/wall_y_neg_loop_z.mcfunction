# nations:explorer/dowsing/wall_y_neg_loop_z
# Z loop for bottom

# Early exit if found or past Z range
execute if score #found nations_pid matches 1.. run return 0
execute if score #scan_z nations_pid > #scan_z_max nations_pid run return 0

# Store Z for macro
execute store result storage nations:dowsing z int 1 run scoreboard players get #scan_z nations_pid

# Check this position at Y = -r
function nations:explorer/dowsing/check_position_y_neg with storage nations:dowsing

# Increment Z and continue
scoreboard players add #scan_z nations_pid 1
execute if score #found nations_pid matches 0 run function nations:explorer/dowsing/wall_y_neg_loop_z with storage nations:dowsing
