extends Control

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass

func _on_voltar_pressed() -> void:
	var _game: bool = get_tree().change_scene_to_file("res://scenes/UI/menu.tscn")
