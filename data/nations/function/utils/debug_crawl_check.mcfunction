# nations:utils/debug_crawl_check
# Runs on each player to debug crawling detection

# Check Water
execute if predicate nations:in_water run tellraw @a[tag=nations_debug] [{"text":"- In Water","color":"blue"}]

# Check Position/Hitbox
# Crawling is 0.6m. Check at 0.75m.
execute positioned ~ ~0.75 ~ if entity @s[dx=0,dy=0,dz=0] run tellraw @a[tag=nations_debug] [{"text":"- Hitbox collision at 0.75m (Not Crawling)","color":"red"}]
execute positioned ~ ~0.75 ~ unless entity @s[dx=0,dy=0,dz=0] run tellraw @a[tag=nations_debug] [{"text":"- No intersection at 0.75m (Maybe Crawling)","color":"green"}]

# Final Logic
execute unless entity @s[nbt={FallFlying:1b}] unless entity @s[nbt={Sleeping:1b}] unless predicate nations:in_water positioned ~ ~0.75 ~ unless entity @s[dx=0,dy=0,dz=0] run tag @s add nations.crawling

# Announce result
execute if entity @s[tag=nations.crawling] run tellraw @a [{"text":"Status: CRAWLING","color":"gold"}]
