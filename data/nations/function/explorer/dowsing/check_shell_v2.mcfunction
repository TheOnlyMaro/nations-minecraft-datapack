# nations:explorer/dowsing/check_shell_v2
# Scans complete shell at radius $(r)
# Ensures no duplicate checks at corners/edges

# Scan left wall (X = -r): Full YZ grid
function nations:explorer/dowsing/wall_x_neg with storage nations:dowsing

# Scan right wall (X = +r): Full YZ grid
execute if score #found nations_pid matches 0 run function nations:explorer/dowsing/wall_x_pos with storage nations:dowsing

# Scan front wall (Z = +r): XY grid, exclude X = ±r edges
execute if score #found nations_pid matches 0 run function nations:explorer/dowsing/wall_z_pos with storage nations:dowsing

# Scan back wall (Z = -r): XY grid, exclude X = ±r edges
execute if score #found nations_pid matches 0 run function nations:explorer/dowsing/wall_z_neg with storage nations:dowsing

# Scan top (Y = +r): XZ grid, exclude X = ±r and Z = ±r edges
execute if score #found nations_pid matches 0 run function nations:explorer/dowsing/wall_y_pos with storage nations:dowsing

# Scan bottom (Y = -r): XZ grid, exclude X = ±r and Z = ±r edges
execute if score #found nations_pid matches 0 run function nations:explorer/dowsing/wall_y_neg with storage nations:dowsing
