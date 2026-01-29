# nations:explorer/dowsing_set_compass_macro
# Macro function - uses $(tx), $(ty), $(tz) to set compass target coordinates

$item replace entity @s weapon.offhand with compass[custom_name='{"text":"Dowsing Compass","color":"aqua","italic":false}',lodestone_tracker={target:{dimension:"minecraft:overworld",pos:[$(tx),$(ty),$(tz)]},tracked:false}]
