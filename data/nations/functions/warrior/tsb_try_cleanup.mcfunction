# Check if any item in inventory has the added sharpness tag
execute if entity @s[nbt={Inventory:[{tag:{nations_added_sharpness:1b}}]}] run function nations:warrior/tsb_cleanup_recursive
