# nations:nerf/damage_mainhand_shield
# Apply +1 Damage to Mainhand Shield

# 1. Get Current Damage
execute store result score @s nations_temp run data get entity @s SelectedItem.tag.Damage

# 2. Increment
scoreboard players add @s nations_temp 1

# 3. Check Breakage (Max 336)
execute if score @s nations_temp matches 337.. run playsound minecraft:item.shield.break master @s ~ ~ ~ 1 1
execute if score @s nations_temp matches 337.. run replaceitem entity @s weapon.mainhand minecraft:air
execute if score @s nations_temp matches 337.. run return 1

# 4. Save Back
execute store result entity @s SelectedItem.tag.Damage int 1 run scoreboard players get @s nations_temp
