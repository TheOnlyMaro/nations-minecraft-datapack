# nations:nerf/break_tool
# Break the tool in mainhand

playsound minecraft:entity.item.break master @s ~ ~ ~ 1 1
item replace entity @s weapon.mainhand with minecraft:air
return 1
