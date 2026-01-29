# nations:tick — run each tick
# call role handlers, cooldown processors, and periodic checks
function nations:utils/detect_crawl

# Miner Abilities
execute as @a[predicate=nations:is_miner] at @s run function nations:miner/cave_dweller
execute as @a[predicate=nations:is_miner] at @s run function nations:miner/tunnel_rat


# Reschedule this function to run next tick (workaround for tick tag issues)
schedule function nations:tick 1t replace
