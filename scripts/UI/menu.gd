extends Control

func _ready() -> void:
	pass


func _on_iniciar_pressed() -> void:
	var _game: bool = get_tree().change_scene_to_file("res://scenes/jogo.tscn")

func _on_creditos_pressed() -> void:
	var _game: bool = get_tree().change_scene_to_file("res://scenes/UI/creditos.tscn")

func _on_sair_pressed() -> void:
	get_tree().quit()
