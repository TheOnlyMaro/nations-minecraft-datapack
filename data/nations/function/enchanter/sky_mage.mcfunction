# nations:enchanter/sky_mage
# Triggered by consuming Sky Feather
# Applies Levitation II for 10s

# Revoke advancement
advancement revoke @s only nations:enchanter/sky_mage_trigger

# 1. Enchanter Only (if non-enchanter managed to keep the item)
execute unless entity @s[tag=role_enchanter] run return 0

# 2. Apply Effect
effect give @s minecraft:levitation 10 1
playsound item.firecharge.use player @s


