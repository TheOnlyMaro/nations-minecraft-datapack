# nations:enchanter/summoner_summon
# Triggered by Blocking with Captured Soul Shield

# 1. Revoke Trigger
advancement revoke @s only nations:enchanter/summon_trigger

# 2. Identify Hand
# Trigger doesn't tell us WHICH hand blocked. We check Mainhand first.
execute if data entity @s SelectedItem.components."minecraft:custom_data".nations_summon_item run function nations:enchanter/summoner/summoner_summon_mainhand
