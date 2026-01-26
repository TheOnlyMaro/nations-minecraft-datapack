# nations:warrior/remove_illegal_war_horn
# Removes War Horns from non-warriors

# Revoke advancement so it can trigger again
advancement revoke @s only nations:warrior/detect_illegal_war_horn

# Try multiple clear syntax options
# Option 1: Direct component match
clear @s minecraft:goat_horn[minecraft:custom_data~{nations_war_horn:1b}]

# Notify player
tellraw @s {"text":"The War Horn crumbles in your hands... Only warriors may wield it.","color":"red","italic":true}
