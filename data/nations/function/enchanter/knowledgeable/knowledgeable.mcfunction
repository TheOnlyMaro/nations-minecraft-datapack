# nations:enchanter/knowledgeable
# Triggered by advancement when enchanting an item
# Refunds 1 XP level to Enchanters only

# Check if player is enchanter
execute if entity @s[tag=role_enchanter] run xp add @s 1 levels
execute if entity @s[tag=role_enchanter] run playsound entity.experience_orb.pickup player @s

# Revoke advancement so it can be triggered again
advancement revoke @s only nations:enchanter/enchant_trigger
