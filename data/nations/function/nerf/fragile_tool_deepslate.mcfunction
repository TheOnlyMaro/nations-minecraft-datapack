# nations:nerf/fragile_tool_deepslate
# Triggered when Non-Miner mines deepslate with pickaxe
# Applies +1 Durability Damage (2x total: 1 vanilla + 1 extra)

# 1. Revoke Advancement
advancement revoke @s only nations:nerf/mine_deepslate

# 2. Apply +1 Durability to Pickaxe
function nations:nerf/damage_tool_1x
