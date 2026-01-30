# nations:explorer/dowsing/set_compass_macro
# Macro function - uses $(tx), $(ty), $(tz) to set compass target coordinates

# If offhand empty, replace with compass pointing to target
$execute unless items entity @s weapon.offhand * run return run item replace entity @s weapon.offhand with compass[custom_name={"text":"Dowsing Compass","color":"aqua","italic":false},lodestone_tracker={target:{dimension:"minecraft:overworld",pos:[$(tx),$(ty),$(tz)]},tracked:false}]

# If offhand occupied, give compass to inventory (or drop if full)
$execute if items entity @s weapon.offhand * run give @s compass[custom_name={"text":"Dowsing Compass","color":"aqua","italic":false},lodestone_tracker={target:{dimension:"minecraft:overworld",pos:[$(tx),$(ty),$(tz)]},tracked:false}]
