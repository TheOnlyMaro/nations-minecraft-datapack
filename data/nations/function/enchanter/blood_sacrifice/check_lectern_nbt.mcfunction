# nations:enchanter/check_lectern_nbt
# Validates if the lectern at current position has a book
# (Actually, 'has_book=true' block state check handles it, but this function sets the tag)

tag @s add found_lectern
# Stop recursion if found?
# Tags are boolean, so adding it multiple times is fine.
# But for performance we could return.
