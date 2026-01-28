# nations:enchanter/jump_handler
# Triggered every tick for Enchanters
# Checks for Jump Score and runs ability logic

execute if score @s nations_jump matches 1.. run function nations:enchanter/jump_abilities
