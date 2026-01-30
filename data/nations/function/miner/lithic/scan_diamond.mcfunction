# nations:miner/lithic/scan_diamond
# Scan for diamond ore or deepslate diamond ore within 16 blocks
# Finds nearest ore by scanning in expanding layers from player

tellraw @s [{"text":"[DEBUG] Starting diamond scan...","color":"aqua"}]

# Tag player to track if ore found
tag @s remove lithic_found

# Scan from Y-8 to Y+8 (closest layers first for nearest detection)
execute positioned ~ ~ ~ run function nations:miner/lithic/check_diamond_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~1 ~ run function nations:miner/lithic/check_diamond_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-1 ~ run function nations:miner/lithic/check_diamond_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~2 ~ run function nations:miner/lithic/check_diamond_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-2 ~ run function nations:miner/lithic/check_diamond_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~3 ~ run function nations:miner/lithic/check_diamond_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-3 ~ run function nations:miner/lithic/check_diamond_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~4 ~ run function nations:miner/lithic/check_diamond_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-4 ~ run function nations:miner/lithic/check_diamond_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~5 ~ run function nations:miner/lithic/check_diamond_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-5 ~ run function nations:miner/lithic/check_diamond_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~6 ~ run function nations:miner/lithic/check_diamond_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-6 ~ run function nations:miner/lithic/check_diamond_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~7 ~ run function nations:miner/lithic/check_diamond_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-7 ~ run function nations:miner/lithic/check_diamond_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~8 ~ run function nations:miner/lithic/check_diamond_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-8 ~ run function nations:miner/lithic/check_diamond_layer

# Feedback if nothing found
execute if entity @s[tag=!lithic_found] run tellraw @s [{"text":"♦ ","color":"aqua"},{"text":"No diamond ore detected nearby...","color":"gray"}]
tag @s remove lithic_found
