# nations:enchanter/blood_mend
# Triggered by interacting with Enchanting Table
# Repairs item in mainhand using XP Bottle in offhand
# Reverts Max Health (Soul Sickness)

# Revoke advancement
advancement revoke @s only nations:enchanter/mend_trigger


# 1. Enchanter Only
execute unless entity @s[tag=role_enchanter] run return 0

# 2. Calculation (Macro)
# Store damage to score
execute store result score #current_damage nations_temp run data get entity @s SelectedItem.components."minecraft:damage"
# Check if damage > 0
execute if score #current_damage nations_temp matches 1.. run function nations:enchanter/blood_mend/blood_mend_apply

