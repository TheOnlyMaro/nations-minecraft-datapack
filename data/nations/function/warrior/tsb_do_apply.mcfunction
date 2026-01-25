# nations:warrior/tsb_do_apply
# Adds Sharpness I if not present

# 1. Safety Checks
# If already has our tag, done.
execute if entity @s[nbt={SelectedItem:{tag:{nations_added_sharpness:1b}}}] run return 0
# If has natural Sharpness (and no tag), abort.
execute if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:sharpness"}]}}}] run return 0

# 2. Structure Initialization
execute unless data entity @s SelectedItem.tag run data modify entity @s SelectedItem.tag set value {}
execute unless data entity @s SelectedItem.tag.Enchantments run data modify entity @s SelectedItem.tag.Enchantments set value []

# 3. Apply Effect
data modify entity @s SelectedItem.tag.Enchantments append value {id:"minecraft:sharpness",lvl:1s}
data modify entity @s SelectedItem.tag.nations_added_sharpness set value 1b
