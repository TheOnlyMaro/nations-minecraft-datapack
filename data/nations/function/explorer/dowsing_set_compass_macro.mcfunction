# nations:explorer/dowsing_set_compass_macro
# Macro function - uses $(tx), $(ty), $(tz) to set compass target coordinates

# if offhand clear, give compass pointing to target

$execute if entity @s[nbt={Inventory:[{Slot:-106b}]}] run item replace entity @s weapon.offhand with compass[custom_name={"text":"Dowsing Compass","color":"aqua","italic":false},lodestone_tracker={target:{dimension:"minecraft:overworld",pos:[$(tx),$(ty),$(tz)]},tracked:false}]

# if offhand occupied, give compass to inventory (or drop if full)
$execute unless entity @s[nbt={Inventory:[{Slot:-106b}]}] run give @s compass[custom_name={"text":"Dowsing Compass","color":"aqua","italic":false},lodestone_tracker={target:{dimension:"minecraft:overworld",pos:[$(tx),$(ty),$(tz)]},tracked:false}]
