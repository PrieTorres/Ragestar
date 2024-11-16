extends Node2D

signal just_broken


func on_item_broken():
	# Emitir sinal 'just_broken' quando o item for quebrado
	emit_signal("just_broken")
	just_broken.emit
