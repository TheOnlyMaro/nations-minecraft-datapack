# nations:enchanter/refund_sky_feather
# Refunding the Sky Feather 1 tick later to prevent client desync (Ghost Items)

loot give @a[tag=nations_pending_refund] loot nations:items/sky_feather
tag @a[tag=nations_pending_refund] remove nations_pending_refund
