# Updated Strategy:
# 1. Summon with ID from macro
# 2. Merge NBT from storage

$summon $(id) ~ ~1 ~ {Tags:["summoned_mob","newly_summoned"],PersistenceRequired:0b}
data modify entity @e[tag=newly_summoned,limit=1] {} merge from storage nations:temp MobData
tag @e[tag=newly_summoned] remove newly_summoned

# Add despawn timer (using scoreboard)
scoreboard players set @e[tag=summoned_mob,scores={nations_summon_age=0}] nations_summon_age 0
