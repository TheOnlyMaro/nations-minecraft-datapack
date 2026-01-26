# nations:explorer/backpack_swap_macro
# Updated to force linter refresh
# Swaps player hotbar slots 1-5 (0-4) with storage using invisible void carts

# 1. Safety Cleanup and Summon Invisible Carts at Void
kill @e[type=chest_minecart,tag=nations_swap_cart]
summon chest_minecart ~ ~-64 ~ {Tags:["nations_swap_cart","cart_store"],Silent:1b}
summon chest_minecart ~ ~-64 ~ {Tags:["nations_swap_cart","cart_player"],Silent:1b}

# 2. Load STORAGE into CART_STORE (Get items OUT of backpack)
# We only care about items that fit in the "backpack" slots (which we map to 0-4 of storage)
$data modify entity @e[type=chest_minecart,tag=cart_store,limit=1] Items set from storage nations:data backpacks.$(uuid0)_$(uuid1)_$(uuid2)_$(uuid3)

# 3. Load PLAYER into CART_PLAYER (Put items INTO backpack)
item replace entity @e[type=chest_minecart,tag=cart_player,limit=1] container.0 from entity @s container.0
item replace entity @e[type=chest_minecart,tag=cart_player,limit=1] container.1 from entity @s container.1
item replace entity @e[type=chest_minecart,tag=cart_player,limit=1] container.2 from entity @s container.2
item replace entity @e[type=chest_minecart,tag=cart_player,limit=1] container.3 from entity @s container.3
item replace entity @e[type=chest_minecart,tag=cart_player,limit=1] container.4 from entity @s container.4

# 4. Save CART_PLAYER to STORAGE (Overwrite storage with new items)
# This effectively saves what was in your hand into the backpack
$data modify storage nations:data backpacks.$(uuid0)_$(uuid1)_$(uuid2)_$(uuid3) set from entity @e[type=chest_minecart,tag=cart_player,limit=1] Items

# 5. Give CART_STORE to PLAYER (Receive items from backpack)
# Overwrites your hand with what was in storage
item replace entity @s container.0 from entity @e[type=chest_minecart,tag=cart_store,limit=1] container.0
item replace entity @s container.1 from entity @e[type=chest_minecart,tag=cart_store,limit=1] container.1
item replace entity @s container.2 from entity @e[type=chest_minecart,tag=cart_store,limit=1] container.2
item replace entity @s container.3 from entity @e[type=chest_minecart,tag=cart_store,limit=1] container.3
item replace entity @s container.4 from entity @e[type=chest_minecart,tag=cart_store,limit=1] container.4

# 6. Cleanup
kill @e[type=chest_minecart,tag=nations_swap_cart]
title @s actionbar {"text":"Backpack Swapped!","color":"green"}
playsound minecraft:item.armor.equip_leather master @s ~ ~ ~ 1 1
