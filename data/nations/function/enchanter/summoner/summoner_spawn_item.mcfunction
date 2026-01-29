# nations:enchanter/summoner_spawn_item
# Macro to summon item from storage
# Input: $(id), $(Count), $(components) from NewItem

$summon item ~ ~1 ~ {Tags:["captured_mob_item"],Item:{id:"$(id)",Count:$(Count),components:$(components)}}
