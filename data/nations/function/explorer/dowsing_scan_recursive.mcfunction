# nations:explorer/dowsing_scan_recursive
# Dynamic recursive area scan with shell-based sampling
# Starts at radius 1 and expands outward up to 32 blocks

# Initialize
scoreboard players set #found nations_pid 0
scoreboard players set #dowsing_radius nations_pid 1

# Start recursive shell expansion
function nations:explorer/dowsing_expand_shell
