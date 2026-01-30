# nations:explorer/dowsing/wall_z_neg
# Scans back wall at Z = -$(r)
# XY grid, exclude X = ±r edges

# Initialize X counter: -(r-1) to +(r-1)
$scoreboard players set #scan_x nations_pid $(r_minus1_neg)
$scoreboard players set #scan_x_max nations_pid $(r_minus1)

# Start X loop
function nations:explorer/dowsing/wall_z_neg_loop_x with storage nations:dowsing
