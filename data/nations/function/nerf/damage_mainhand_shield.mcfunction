# nations:nerf/damage_mainhand_shield
# Apply +1 Damage to Mainhand Shield

# 1. Get Current Damage
execute store result score @s nations_temp run data get entity @s SelectedItem.components."minecraft:damage"

# 2. Increment
scoreboard players add @s nations_temp 1

# 3. Check Breakage (Max 336)
execute if score @s nations_temp matches 337.. run playsound minecraft:item.shield.break master @s ~ ~ ~ 1 1
execute if score @s nations_temp matches 337.. run item replace entity @s weapon.mainhand with minecraft:air
execute if score @s nations_temp matches 337.. run return 1

# 4. Save Back
execute store result entity @s SelectedItem.components."minecraft:damage" int 1 run scoreboard players get @s nations_temp
