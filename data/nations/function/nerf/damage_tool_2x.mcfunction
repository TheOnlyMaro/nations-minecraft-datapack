# nations:nerf/damage_tool_2x
# Apply +2 Damage to Mainhand Tool (3x total durability loss)

tellraw @s [{"text":"[DEBUG] damage_tool_2x called!","color":"gold"}]

# Calculate damage fraction: (2 / max_durability) * 1000 for scale 0.001
# Store as NEGATIVE integer to damage (positive values repair)
execute if entity @s[nbt={SelectedItem:{id:"minecraft:wooden_pickaxe"}}] run scoreboard players set @s nations_damage_fraction -33
execute if entity @s[nbt={SelectedItem:{id:"minecraft:stone_pickaxe"}}] run scoreboard players set @s nations_damage_fraction -15
execute if entity @s[nbt={SelectedItem:{id:"minecraft:iron_pickaxe"}}] run scoreboard players set @s nations_damage_fraction -8
execute if entity @s[nbt={SelectedItem:{id:"minecraft:golden_pickaxe"}}] run scoreboard players set @s nations_damage_fraction -61
execute if entity @s[nbt={SelectedItem:{id:"minecraft:diamond_pickaxe"}}] run scoreboard players set @s nations_damage_fraction -1
execute if entity @s[nbt={SelectedItem:{id:"minecraft:netherite_pickaxe"}}] run scoreboard players set @s nations_damage_fraction -1

# Apply the damage using item modifier
item modify entity @s weapon.mainhand nations:nerf/damage
tellraw @s [{"text":"[DEBUG] Damage applied!","color":"green"}]
