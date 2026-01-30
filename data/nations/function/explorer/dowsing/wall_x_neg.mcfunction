# nations:explorer/dowsing/wall_x_neg
# Scans left wall at X = -$(r)
# Full YZ grid from -$(r) to +$(r)

# Initialize Y counter
$scoreboard players set #scan_y nations_pid $(r_neg)
$scoreboard players set #scan_y_max nations_pid $(r)

# Start Y loop
function nations:explorer/dowsing/wall_x_neg_loop_y with storage nations:dowsing
