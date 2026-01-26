# nations:explorer/rapid_transit
#
# Trigger: Ticking check for role_explorer tag + mounted entity + holding stick (main or offhand).
# Effect: Applies minecraft:speed (1 level) while conditions met.

# Check Mainhand
execute if data entity @s RootVehicle if entity @s[nbt={SelectedItem:{id:"minecraft:stick"}}] run effect give @s minecraft:speed 2 0 true

# Check Offhand
execute if data entity @s RootVehicle if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:stick"}]}] run effect give @s minecraft:speed 2 0 true
