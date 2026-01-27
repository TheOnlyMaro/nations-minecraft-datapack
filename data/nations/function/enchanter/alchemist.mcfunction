# nations:enchanter/alchemist
# Triggered by tick.mcfunction for players with role_enchanter
# Detection: Jumped + Within 5 blocks of Brewing Stand + Holding Ingredients

execute if score @s nations_jump matches 1.. if predicate nations:enchanter/alchemist_ingredients at @s run function nations:enchanter/alchemist_active

# Reset jump score
scoreboard players set @s nations_jump 0
