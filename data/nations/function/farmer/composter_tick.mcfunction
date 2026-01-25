# nations:farmer/composter_tick
# Run BY the marker (nations_composter_marker)

# 1. Check Validity (Must be inside a composter)
execute unless block ~ ~ ~ minecraft:composter run kill @s
execute unless block ~ ~ ~ minecraft:composter run return 0

# 2. Timer Logic
scoreboard players add @s nations_timer 1
execute if score @s nations_timer matches 100.. run function nations:farmer/composter_scan
