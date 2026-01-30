# nations:enchanter/blood_sacrifice
# Triggered by killing a pig named "Vessel"

# Checks for nearby Lectern with Book & Quill

# Revoke advancement
advancement revoke @s only nations:enchanter/sacrifice_trigger

# 1. Enchanter Only
execute unless entity @s[tag=role_enchanter] run return 0

# 2. Check overlap (Don't allow if already sacrificed)
execute if entity @s[tag=nations_sacrificed] run title @s actionbar {"text":"You have already performed the Blood Sacrifice!","color":"red"}
execute if entity @s[tag=nations_sacrificed] run particle minecraft:angry_villager ~ ~1 ~ 0.5 0.5 0.5 0 10
execute if entity @s[tag=nations_sacrificed] run summon minecraft:bat
execute if entity @s[tag=nations_sacrificed] run return 0

# 3. Check for Lectern nearby (Radius 5)
# We will check if the function 'check_lectern' finds one.
# We use a tag system: reset 'found_lectern', run scan, check 'found_lectern'.
tag @s remove found_lectern
execute run function nations:enchanter/blood_sacrifice/scan_lectern

# 4. If found, Apply Effects
execute if entity @s[tag=found_lectern] run function nations:enchanter/blood_sacrifice/blood_sacrifice_apply
execute unless entity @s[tag=found_lectern] run title @s actionbar {"text":"The ritual requires a Lectern with a Book & Quill nearby...","color":"dark_red"}
execute unless entity @s[tag=found_lectern] run particle minecraft:angry_villager ~ ~1 ~ 0.5 0.5 0.5 0 10
execute unless entity @s[tag=found_lectern] run playsound block.fire.extinguish


