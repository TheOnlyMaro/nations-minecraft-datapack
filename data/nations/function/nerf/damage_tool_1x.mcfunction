# nations:nerf/damage_tool_1x
# Apply +1 Damage to Mainhand Tool (2x total durability loss)

# Calculate damage fraction: (1 / max_durability) * 1000 for scale 0.001
# Store as NEGATIVE integer to damage (positive values repair)
execute if entity @s[nbt={SelectedItem:{id:"minecraft:wooden_pickaxe"}}] run scoreboard players set @s nations_damage_fraction -17
execute if entity @s[nbt={SelectedItem:{id:"minecraft:stone_pickaxe"}}] run scoreboard players set @s nations_damage_fraction -8
execute if entity @s[nbt={SelectedItem:{id:"minecraft:iron_pickaxe"}}] run scoreboard players set @s nations_damage_fraction -4
execute if entity @s[nbt={SelectedItem:{id:"minecraft:golden_pickaxe"}}] run scoreboard players set @s nations_damage_fraction -30
execute if entity @s[nbt={SelectedItem:{id:"minecraft:diamond_pickaxe"}}] run scoreboard players set @s nations_damage_fraction -1
execute if entity @s[nbt={SelectedItem:{id:"minecraft:netherite_pickaxe"}}] run scoreboard players set @s nations_damage_fraction -1

# Apply the damage using item modifier
item modify entity @s weapon.mainhand nations:nerf/damage
