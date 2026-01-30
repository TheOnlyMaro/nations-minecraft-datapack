# nations:utils/debug_crawl_check
# Runs on each player to debug crawling detection

# Check Water

# Check Position/Hitbox
# Crawling is 0.6m. Check at 0.75m.



# Final Logic
execute unless entity @s[nbt={FallFlying:1b}] unless entity @s[nbt={Sleeping:1b}] unless predicate nations:in_water positioned ~ ~0.75 ~ unless entity @s[dx=0,dy=0,dz=0] run tag @s add nations.crawling

# Announce result

