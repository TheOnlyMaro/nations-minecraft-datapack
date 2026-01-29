# nations:nerf/fragile_tool_ore
# Triggered when Non-Miner mines ore/obsidian with pickaxe
# Applies +2 Durability Damage (3x total: 1 vanilla + 2 extra)

# 1. Revoke Advancement
advancement revoke @s only nations:nerf/mine_ore

# 2. Apply +2 Durability to Pickaxe
function nations:nerf/damage_tool_2x
