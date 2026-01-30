# nations:miner/lithic/scan_emerald
# Scan for emerald ore or deepslate emerald ore within 16 blocks

tag @s remove lithic_found

execute positioned ~ ~ ~ run function nations:miner/lithic/check_emerald_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~1 ~ run function nations:miner/lithic/check_emerald_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-1 ~ run function nations:miner/lithic/check_emerald_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~2 ~ run function nations:miner/lithic/check_emerald_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-2 ~ run function nations:miner/lithic/check_emerald_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~3 ~ run function nations:miner/lithic/check_emerald_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-3 ~ run function nations:miner/lithic/check_emerald_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~4 ~ run function nations:miner/lithic/check_emerald_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-4 ~ run function nations:miner/lithic/check_emerald_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~5 ~ run function nations:miner/lithic/check_emerald_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-5 ~ run function nations:miner/lithic/check_emerald_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~6 ~ run function nations:miner/lithic/check_emerald_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-6 ~ run function nations:miner/lithic/check_emerald_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~7 ~ run function nations:miner/lithic/check_emerald_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-7 ~ run function nations:miner/lithic/check_emerald_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~8 ~ run function nations:miner/lithic/check_emerald_layer
execute if entity @s[tag=!lithic_found] positioned ~ ~-8 ~ run function nations:miner/lithic/check_emerald_layer

execute if entity @s[tag=!lithic_found] run title @s actionbar [{"text":"♦ ","color":"green"},{"text":"No emerald ore detected nearby...","color":"gray"}]
tag @s remove lithic_found
