# nations:miner/lithic/scan_copper
# Scan for copper ore or deepslate copper ore within 16 blocks

tag @s remove lithic_found

execute positioned ~ ~ ~ run function nations:miner/lithic/check_copper_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~1 ~ run function nations:miner/lithic/check_copper_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-1 ~ run function nations:miner/lithic/check_copper_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~2 ~ run function nations:miner/lithic/check_copper_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-2 ~ run function nations:miner/lithic/check_copper_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~3 ~ run function nations:miner/lithic/check_copper_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-3 ~ run function nations:miner/lithic/check_copper_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~4 ~ run function nations:miner/lithic/check_copper_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-4 ~ run function nations:miner/lithic/check_copper_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~5 ~ run function nations:miner/lithic/check_copper_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-5 ~ run function nations:miner/lithic/check_copper_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~6 ~ run function nations:miner/lithic/check_copper_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-6 ~ run function nations:miner/lithic/check_copper_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~7 ~ run function nations:miner/lithic/check_copper_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-7 ~ run function nations:miner/lithic/check_copper_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~8 ~ run function nations:miner/lithic/check_copper_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-8 ~ run function nations:miner/lithic/check_copper_layer

execute if entity @s[tag=!lithic_found] run tellraw @s [{"text":"♦ ","color":"#B87333"},{"text":"No copper ore detected nearby...","color":"gray"}]
tag @s remove lithic_found
