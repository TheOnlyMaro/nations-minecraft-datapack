# nations:warrior/thou_shalt_bleed_activate
# Triggered when warrior right-clicks with shield
# Adds Sharpness II to mainhand sword with NBT tag

# Revoke advancement immediately
advancement revoke @s only nations:warrior/use_shield

# Check if player is warrior
execute unless predicate nations:is_warrior run return 0

# Check if holding sword in mainhand
execute unless items entity @s weapon.mainhand #minecraft:swords run return 0

# Check if sword already has our buff tag (prevents re-activation)
execute if data entity @s SelectedItem.components."minecraft:custom_data".nations_blessed_blade run return 0

# [DISABLED] Check if sword already has natural Sharpness enchantment
# execute if data entity @s SelectedItem.components."minecraft:enchantments"."minecraft:sharpness" run return 0

# Apply attack damage boost with custom tag (attribute modifier = no grindstone XP)
item modify entity @s weapon.mainhand nations:add_blessed_blade

# Audio feedback
playsound minecraft:block.grindstone.use master @s ~ ~ ~ 1 1.2

# Particle effect
particle minecraft:enchant ~ ~1 ~ 0.5 0.5 0.5 1 20
