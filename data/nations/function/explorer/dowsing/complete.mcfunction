# nations:explorer/dowsing/complete
# Called when scan finishes (found or reached max radius)

# Give appropriate feedback based on result
execute if score #found nations_pid matches 1 as @a[predicate=nations:is_explorer] run title @s actionbar [{"text":"✓ ","color":"green","bold":true},{"text":"Storage detected ","color":"aqua"},{"text":"VERY CLOSE","color":"green","bold":true},{"text":" (within 10 blocks)","color":"gray"}]
execute if score #found nations_pid matches 2 as @a[predicate=nations:is_explorer] run title @s actionbar [{"text":"✓ ","color":"green","bold":true},{"text":"Storage detected ","color":"aqua"},{"text":"NEARBY","color":"yellow"},{"text":" (within 10 blocks)","color":"gray"}]
execute if score #found nations_pid matches 3 as @a[predicate=nations:is_explorer] run title @s actionbar [{"text":"✓ ","color":"green","bold":true},{"text":"Storage detected ","color":"aqua"},{"text":"IN THE AREA","color":"gold"},{"text":" (within 10 blocks)","color":"gray"}]
execute if score #found nations_pid matches 0 as @a[predicate=nations:is_explorer] run title @s actionbar [{"text":"✗ ","color":"red","bold":true},{"text":"No storage found within 10 blocks.","color":"yellow"}]

# If found, give compass
execute if score #found nations_pid matches 1.. as @a[predicate=nations:is_explorer] at @s run function nations:explorer/dowsing/set_compass
