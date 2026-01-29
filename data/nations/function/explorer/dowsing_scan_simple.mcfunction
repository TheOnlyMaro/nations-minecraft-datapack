# nations:explorer/dowsing_scan_simple
# Dynamic recursive area scan with distance reporting + compass pointing
# Uses flood-fill style recursion to scan up to 32 blocks

# Run the recursive scan
function nations:explorer/dowsing_scan_recursive

# Report result with distance
execute if score #found nations_pid matches 1 run tellraw @s [{"text":"✓ ","color":"green","bold":true},{"text":"Storage detected ","color":"aqua"},{"text":"VERY CLOSE","color":"green","bold":true},{"text":" (within 10 blocks)","color":"gray"}]
execute if score #found nations_pid matches 2 run tellraw @s [{"text":"✓ ","color":"green","bold":true},{"text":"Storage detected ","color":"aqua"},{"text":"NEARBY","color":"yellow"},{"text":" (11-20 blocks away)","color":"gray"}]
execute if score #found nations_pid matches 3 run tellraw @s [{"text":"✓ ","color":"green","bold":true},{"text":"Storage detected ","color":"aqua"},{"text":"IN THE AREA","color":"gold"},{"text":" (21-32 blocks away)","color":"gray"}]
execute if score #found nations_pid matches 0 run tellraw @s [{"text":"✗ ","color":"red","bold":true},{"text":"No storage found within 32 blocks.","color":"yellow"}]

# If found, give compass in offhand pointing to target
execute if score #found nations_pid matches 1.. run function nations:explorer/dowsing_set_compass
execute if score #found nations_pid matches 1.. run tellraw @s [{"text":"🧭 ","color":"gold"},{"text":"Your compass now points to the storage!","color":"aqua"}]

