# nations:explorer/dowsing/wall_z_pos_loop_y
# Y loop for front wall

# Early exit if found or past Y range
execute if score #found nations_pid matches 1.. run return 0
execute if score #scan_y nations_pid > #scan_y_max nations_pid run return 0

# Store Y for macro
execute store result storage nations:dowsing y int 1 run scoreboard players get #scan_y nations_pid

# Check this position at Z = +r
function nations:explorer/dowsing/check_position_z_pos with storage nations:dowsing

# Increment Y and continue
scoreboard players add #scan_y nations_pid 1
execute if score #found nations_pid matches 0 run function nations:explorer/dowsing/wall_z_pos_loop_y with storage nations:dowsing
