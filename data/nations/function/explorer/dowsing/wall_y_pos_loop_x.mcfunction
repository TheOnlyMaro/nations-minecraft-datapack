# nations:explorer/dowsing/wall_y_pos_loop_x
# X loop for top

# Early exit if found or past X range
execute if score #found nations_pid matches 1.. run return 0
execute if score #scan_x nations_pid > #scan_x_max nations_pid run return 0

# Initialize Z counter: -(r-1) to +(r-1)
$scoreboard players set #scan_z nations_pid $(r_minus1_neg)
$scoreboard players set #scan_z_max nations_pid $(r_minus1)

# Store current X for macro
execute store result storage nations:dowsing x int 1 run scoreboard players get #scan_x nations_pid

# Start Z loop
function nations:explorer/dowsing/wall_y_pos_loop_z with storage nations:dowsing

# Increment X and continue
scoreboard players add #scan_x nations_pid 1
execute if score #found nations_pid matches 0 run function nations:explorer/dowsing/wall_y_pos_loop_x with storage nations:dowsing
