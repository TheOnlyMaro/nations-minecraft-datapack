# nations:enchanter/summoner_apply_name
# Macro to apply name string
# Input: $(CustomName) from storage

$data modify entity @e[tag=captured_mob_item,limit=1] Item.components."minecraft:item_name" set value '$(CustomName)'
