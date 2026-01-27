# nations:farmer/convert_held_beetroots
# Checks if the player is holding a raw beetroot (mainhand or offhand)
# If so, modifies it to be the "Super Beetroot" (always edible, fast eat) using item_modifier
# Triggered by tick.mcfunction for Farmers

# 1. Mainhand Check
# If holding beetroot AND it doesn't have the nations_modified tag
execute if entity @s[nbt={SelectedItem:{id:"minecraft:beetroot"}}] unless entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{nations_modified:1b}}}}] run item modify entity @s weapon.mainhand nations:super_beetroot

# 2. Offhand Check
# Inventory Slot -106b is Offhand
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:beetroot"}]}] unless entity @s[nbt={Inventory:[{Slot:-106b,components:{"minecraft:custom_data":{nations_modified:1b}}}]}] run item modify entity @s weapon.offhand nations:super_beetroot
