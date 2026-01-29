# nations:enchanter/scan_lectern_layer
# Checks 5x5 layer for Lectern with Book
# Unrolling is safest for simplicity in datapacks without macros.

# We will use "fill" command to check for ANY lectern? No, we need NBT check (Book & Quill).
# NBT check is expensive.
# Optimization: Check if block IS lectern first, THEN check data.
# 5x5 = 25 checks.

# Actually, I'll just write a recursive "check_block" function and call it 25 times? No.
# I'll write a Python script in my head to unroll this... or just copy paste.
# Or use `clone` to move blocks to a test chamber? No.
# Creating a marker at every lectern? 
# `execute as @e[type=interaction]...` No.

# Let's use `fill` with `masked` to a temp area? No.
# Let's just do `execute if block` with offsets.
# If I do 25 lines it's fine.

execute if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt
execute positioned ~1 ~ ~ if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt
execute positioned ~2 ~ ~ if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt
execute positioned ~3 ~ ~ if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt
execute positioned ~4 ~ ~ if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt

# Row 2 (Z+1)
execute positioned ~ ~ ~1 if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt
execute positioned ~1 ~ ~1 if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt
execute positioned ~2 ~ ~1 if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt
execute positioned ~3 ~ ~1 if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt
execute positioned ~4 ~ ~1 if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt

# Row 3 (Z+2)
execute positioned ~ ~ ~2 if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt
execute positioned ~1 ~ ~2 if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt
execute positioned ~2 ~ ~2 if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt
execute positioned ~3 ~ ~2 if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt
execute positioned ~4 ~ ~2 if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt

# Row 4 (Z+3)
execute positioned ~ ~ ~3 if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt
execute positioned ~1 ~ ~3 if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt
execute positioned ~2 ~ ~3 if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt
execute positioned ~3 ~ ~3 if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt
execute positioned ~4 ~ ~3 if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt

# Row 5 (Z+4)
execute positioned ~ ~ ~4 if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt
execute positioned ~1 ~ ~4 if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt
execute positioned ~2 ~ ~4 if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt
execute positioned ~3 ~ ~4 if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt
execute positioned ~4 ~ ~4 if block ~ ~ ~ minecraft:lectern[has_book=true] run function nations:enchanter/blood_sacrifice/check_lectern_nbt
