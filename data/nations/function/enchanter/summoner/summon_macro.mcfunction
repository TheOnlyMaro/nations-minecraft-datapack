# Updated Strategy:
# 1. Summon with ID from macro
# 2. Merge NBT from storage

$summon $(id) ~ ~1 ~ {Tags:["summoned_mob","newly_summoned"],PersistenceRequired:0b}
data modify entity @e[tag=newly_summoned,limit=1] {} merge from storage nations:temp MobData

# Initialize despawn timer for newly summoned entity (score doesn't exist yet, so we must set it)
scoreboard players set @e[tag=newly_summoned,limit=1] nations_summon_age 0

tag @e[tag=newly_summoned] remove newly_summoned
