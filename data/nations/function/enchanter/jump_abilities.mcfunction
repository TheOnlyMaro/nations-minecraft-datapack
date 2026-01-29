# nations:enchanter/jump_abilities
# Called when Enchanter jumps

# 1. Alchemist Check (Gold + Lapis)
execute if predicate nations:enchanter/alchemist_ingredients at @s run function nations:enchanter/alchemist/alchemist_active

# 2. Blood Mend Check (XP Bottle + Damaged Item)
execute if predicate nations:enchanter/mend_items at @s run function nations:enchanter/blood_mend/check_mend_raycast

# 3. Reset Jump
scoreboard players set @s nations_jump 0
