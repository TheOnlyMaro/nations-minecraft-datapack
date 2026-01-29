# nations:explorer/mail_list_player_macro
# Macro: displays clickable player entry to sender
# Input: $(pid)
# NOTE: The target player is tagged with nations_mail_target

$tellraw @a[tag=nations_mail_sender] [{"text":"[✉ Send] ","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/trigger nations_mail_id set $(pid)"},"hoverEvent":{"action":"show_text","contents":"Click to send"}},{"selector":"@a[tag=nations_mail_target,limit=1]","color":"yellow"}]
