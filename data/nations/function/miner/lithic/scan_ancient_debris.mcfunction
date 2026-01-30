# nations:miner/lithic/scan_ancient_debris
# Scan for ancient debris within 16 blocks

tellraw @s [{"text":"[DEBUG] Starting ancient debris scan...","color":"dark_purple"}]

tag @s remove lithic_found

execute positioned ~ ~ ~ run function nations:miner/lithic/check_ancient_debris_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~1 ~ run function nations:miner/lithic/check_ancient_debris_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-1 ~ run function nations:miner/lithic/check_ancient_debris_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~2 ~ run function nations:miner/lithic/check_ancient_debris_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-2 ~ run function nations:miner/lithic/check_ancient_debris_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~3 ~ run function nations:miner/lithic/check_ancient_debris_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-3 ~ run function nations:miner/lithic/check_ancient_debris_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~4 ~ run function nations:miner/lithic/check_ancient_debris_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-4 ~ run function nations:miner/lithic/check_ancient_debris_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~5 ~ run function nations:miner/lithic/check_ancient_debris_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-5 ~ run function nations:miner/lithic/check_ancient_debris_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~6 ~ run function nations:miner/lithic/check_ancient_debris_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-6 ~ run function nations:miner/lithic/check_ancient_debris_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~7 ~ run function nations:miner/lithic/check_ancient_debris_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-7 ~ run function nations:miner/lithic/check_ancient_debris_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~8 ~ run function nations:miner/lithic/check_ancient_debris_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-8 ~ run function nations:miner/lithic/check_ancient_debris_layer

execute if entity @s[tag=!lithic_found] run tellraw @s [{"text":"♦ ","color":"dark_purple"},{"text":"No ancient debris detected nearby...","color":"gray"}]
tag @s remove lithic_found
