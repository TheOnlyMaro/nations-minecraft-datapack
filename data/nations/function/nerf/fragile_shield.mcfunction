# nations:nerf/fragile_shield
# Triggered by blocking damage as a Non-Warrior
# Adds +1 Durability Damage (Simulating 2x total, as vanilla adds ~1)

# 1. Revoke Advancement
advancement revoke @s only nations:nerf/shield_block

# 2. Identify Shield Slot & Apply Damage
# Check Mainhand
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:shield"}]}] run function nations:nerf/damage_offhand_shield
execute unless entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:shield"}]}] if entity @s[nbt={SelectedItem:{id:"minecraft:shield"}}] run function nations:nerf/damage_mainhand_shield

# Note: Priority is usually given to the shielding hand. 
# Identifying *exactly* which hand blocked is tricky in vanilla without complex predicates.
# However, usually Offhand is priority for blocking if both have shields, or Mainhand if blocking.
# A simple check: If Offhand has shield, assume it blocked (standard behavior).
