# nations:warrior/tsb_cleanup_recursive
# 1. Remove Sharpness logic from ONE item instance (or all matched)
data remove entity @s Inventory[{tag:{nations_added_sharpness:1b}}].tag.Enchantments[{id:"minecraft:sharpness"}]
data remove entity @s Inventory[{tag:{nations_added_sharpness:1b}}].tag.nations_added_sharpness

# 2. Recurse if there are still items with the tag
execute if entity @s[nbt={Inventory:[{tag:{nations_added_sharpness:1b}}]}] run function nations:warrior/tsb_cleanup_recursive
