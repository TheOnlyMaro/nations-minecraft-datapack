# nations:utils/detect_crawl
# Detects players who are crawling (hitbox height < 0.75m).

# Reset tag
tag @a remove nations.crawling

# Add tag to crawling players
# Criteria:
# 1. Not gliding (FallFlying:1b)
# 2. Not sleeping (Sleeping:1b)
# 3. Height check: If player is smaller than 0.75m, they will NOT intersect a volume at ~ ~0.75 ~.
#    We use 'unless entity' at that position to confirm they are small.
# Note: This will also tag swimming players, which is acceptable or even desired if they are "crawling" through water tunnels.

execute as @a at @s unless entity @s[nbt={FallFlying:1b}] unless entity @s[nbt={Sleeping:1b}] positioned ~ ~0.75 ~ unless entity @s[dx=0,dy=0,dz=0] run tag @s add nations.crawling
