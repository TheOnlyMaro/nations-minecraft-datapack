# nations:explorer/dowsing/expand_layer_v2
# Expands to next shell and scans all surface blocks

# Early exit if already found
execute if score #found nations_pid matches 1.. run return 0

# Increment radius
scoreboard players add #dowsing_radius nations_pid 1

# Early exit if past max range
execute if score #dowsing_radius nations_pid > #dowsing_max nations_pid run return 0

# Store radius for macro
execute store result storage nations:dowsing r int 1 run scoreboard players get #dowsing_radius nations_pid

# Calculate negative radius
scoreboard players operation #temp nations_pid = #dowsing_radius nations_pid
scoreboard players operation #temp nations_pid *= #CONST_-1 nations_pid
execute store result storage nations:dowsing r_neg int 1 run scoreboard players get #temp nations_pid

# Calculate r-1 for edge exclusion
scoreboard players operation #temp nations_pid = #dowsing_radius nations_pid
scoreboard players remove #temp nations_pid 1
execute store result storage nations:dowsing r_minus1 int 1 run scoreboard players get #temp nations_pid

# Calculate -(r-1) - multiply the stored r-1 value
scoreboard players operation #temp nations_pid *= #CONST_-1 nations_pid
execute store result storage nations:dowsing r_minus1_neg int 1 run scoreboard players get #temp nations_pid

# Scan this complete shell
function nations:explorer/dowsing/check_shell_v2 with storage nations:dowsing

# If found, finish immediately
execute if score #found nations_pid matches 1.. run function nations:explorer/dowsing/complete
execute if score #found nations_pid matches 1.. run return 0

# If at max radius, finish
execute if score #dowsing_radius nations_pid >= #dowsing_max nations_pid run function nations:explorer/dowsing/complete
execute if score #dowsing_radius nations_pid >= #dowsing_max nations_pid run return 0

# Continue to next layer on next tick
schedule function nations:explorer/dowsing/continue_scan 1t append
