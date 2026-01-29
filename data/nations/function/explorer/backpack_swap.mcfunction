# nations:explorer/backpack_swap
# Prepares UUID macro arguments for the swap logic

data modify storage nations:temp macro_args set value {}
data modify storage nations:temp macro_args.uuid0 set from entity @s UUID[0]
data modify storage nations:temp macro_args.uuid1 set from entity @s UUID[1]
data modify storage nations:temp macro_args.uuid2 set from entity @s UUID[2]
data modify storage nations:temp macro_args.uuid3 set from entity @s UUID[3]

function nations:explorer/backpack_swap_macro with storage nations:temp macro_args
