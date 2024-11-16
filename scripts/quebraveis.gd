extends StaticBody2D
class_name Quebraveis

var _is_dead: bool = false

@export_category("Variables")
@export var _health: int
@export var _min_health: int = 10
@export var _max_health: int = 20

func _ready() -> void:
	_health = randi_range(_min_health, _max_health)

func update_health(_damage_range: Array) -> void:
	_health -= randi_range(_damage_range[0], _damage_range[1])

	if _health <= 0:
		_is_dead = true
		var jogo_node = get_tree().root.get_node("Jogo")
		if jogo_node:
			jogo_node.emit_signal("item_quebrado")
		queue_free()
		return
	print("hit")
