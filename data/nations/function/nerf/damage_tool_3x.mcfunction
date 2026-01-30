# nations:nerf/damage_tool_3x
# Apply +3 Damage to Mainhand Tool (4x total durability loss)

# Calculate damage fraction: (3 / max_durability) * 1000 for scale 0.001
# Store as NEGATIVE integer to damage (positive values repair)
execute if entity @s[nbt={SelectedItem:{id:"minecraft:wooden_pickaxe"}}] run scoreboard players set @s nations_damage_fraction -50
execute if entity @s[nbt={SelectedItem:{id:"minecraft:stone_pickaxe"}}] run scoreboard players set @s nations_damage_fraction -23
execute if entity @s[nbt={SelectedItem:{id:"minecraft:iron_pickaxe"}}] run scoreboard players set @s nations_damage_fraction -12
execute if entity @s[nbt={SelectedItem:{id:"minecraft:golden_pickaxe"}}] run scoreboard players set @s nations_damage_fraction -91
execute if entity @s[nbt={SelectedItem:{id:"minecraft:diamond_pickaxe"}}] run scoreboard players set @s nations_damage_fraction -2
execute if entity @s[nbt={SelectedItem:{id:"minecraft:netherite_pickaxe"}}] run scoreboard players set @s nations_damage_fraction -1

# Apply the damage using item modifier
item modify entity @s weapon.mainhand nations:nerf/damage
