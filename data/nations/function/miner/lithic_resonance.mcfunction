# nations:miner/lithic_resonance
# Detect nearby ores by holding gemstones
# Called per miner every 10 seconds

tellraw @s [{"text":"[DEBUG] Lithic function called","color":"yellow"}]

# Check which purified material is held and scan for corresponding ore
execute if predicate nations:miner/holding_diamond run tellraw @s [{"text":"[DEBUG] Holding diamond","color":"aqua"}]
execute if predicate nations:miner/holding_diamond run function nations:miner/lithic/scan_diamond
execute if predicate nations:miner/holding_redstone run tellraw @s [{"text":"[DEBUG] Holding redstone","color":"dark_red"}]
execute if predicate nations:miner/holding_redstone run function nations:miner/lithic/scan_redstone
execute if predicate nations:miner/holding_emerald run tellraw @s [{"text":"[DEBUG] Holding emerald","color":"green"}]
execute if predicate nations:miner/holding_emerald run function nations:miner/lithic/scan_emerald
execute if predicate nations:miner/holding_lapis run tellraw @s [{"text":"[DEBUG] Holding lapis","color":"blue"}]
execute if predicate nations:miner/holding_lapis run function nations:miner/lithic/scan_lapis
execute if predicate nations:miner/holding_coal run tellraw @s [{"text":"[DEBUG] Holding coal","color":"dark_gray"}]
execute if predicate nations:miner/holding_coal run function nations:miner/lithic/scan_coal
execute if predicate nations:miner/holding_iron_ingot run tellraw @s [{"text":"[DEBUG] Holding iron ingot","color":"white"}]
execute if predicate nations:miner/holding_iron_ingot run function nations:miner/lithic/scan_iron
execute if predicate nations:miner/holding_gold_ingot run tellraw @s [{"text":"[DEBUG] Holding gold ingot","color":"gold"}]
execute if predicate nations:miner/holding_gold_ingot run function nations:miner/lithic/scan_gold
execute if predicate nations:miner/holding_copper_ingot run tellraw @s [{"text":"[DEBUG] Holding copper ingot","color":"#B87333"}]
execute if predicate nations:miner/holding_copper_ingot run function nations:miner/lithic/scan_copper
execute if predicate nations:miner/holding_quartz run tellraw @s [{"text":"[DEBUG] Holding quartz","color":"white"}]
execute if predicate nations:miner/holding_quartz run function nations:miner/lithic/scan_quartz
execute if predicate nations:miner/holding_netherite_ingot run tellraw @s [{"text":"[DEBUG] Holding netherite ingot","color":"dark_purple"}]
execute if predicate nations:miner/holding_netherite_ingot run function nations:miner/lithic/scan_ancient_debris
