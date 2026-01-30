# nations:explorer/mail_receive
# Executed AS the recipient - spawns the mailed item at their feet

# Summon item 3 blocks above recipient's location
summon item ~ ~3 ~ {Item:{id:"minecraft:stone",count:1},PickupDelay:0s,Tags:["nations_mail_item"]}

# Copy item data from storage
data modify entity @e[type=item,tag=nations_mail_item,limit=1,sort=nearest] Item set from storage nations:mail payload

# Feedback to recipient
title @s actionbar [{"text":"✉ You received mail!","color":"aqua","bold":true}]
playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1 0.8
