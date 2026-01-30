# nations:miner/lithic_resonance
# Detect nearby ores by holding gemstones
# Called per miner every 10 seconds



# Check which purified material is held and scan for corresponding ore

execute if predicate nations:miner/holding_diamond run function nations:miner/lithic/scan_diamond

execute if predicate nations:miner/holding_redstone run function nations:miner/lithic/scan_redstone

execute if predicate nations:miner/holding_emerald run function nations:miner/lithic/scan_emerald

execute if predicate nations:miner/holding_lapis run function nations:miner/lithic/scan_lapis

execute if predicate nations:miner/holding_coal run function nations:miner/lithic/scan_coal

execute if predicate nations:miner/holding_iron_ingot run function nations:miner/lithic/scan_iron

execute if predicate nations:miner/holding_gold_ingot run function nations:miner/lithic/scan_gold

execute if predicate nations:miner/holding_copper_ingot run function nations:miner/lithic/scan_copper

execute if predicate nations:miner/holding_quartz run function nations:miner/lithic/scan_quartz

execute if predicate nations:miner/holding_netherite_ingot run function nations:miner/lithic/scan_ancient_debris
