# nations:nerf/fragile_tool_deepslate_ore
# Triggered when Non-Miner mines deepslate ore with pickaxe
# Applies +3 Durability Damage (4x total: 1 vanilla + 3 extra)

# 1. Revoke Advancement
advancement revoke @s only nations:nerf/mine_deepslate_ore

# 2. Apply +3 Durability to Pickaxe
function nations:nerf/damage_tool_3x
