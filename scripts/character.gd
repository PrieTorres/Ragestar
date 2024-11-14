extends CharacterBody2D

var _can_attack: bool = true
var _move_speed: float = 128

@export_category("Objects")
@export var _sprite2D: Sprite2D
@export var _animation: AnimationPlayer
@export var _hitbox: CollisionShape2D

func _physics_process(delta: float) -> void:
	_move()
	_attack()
	_animate()

func _move():
	var _direction: Vector2 = Input.get_vector(
		"move_left", "move_right", "move_up", "move_down")
	velocity = _direction * _move_speed
	move_and_slide()

func _attack():
	if Input.is_action_just_pressed("attack") and _can_attack:
		_can_attack = false

func _animate():
	if velocity.x > 0:
		_sprite2D.flip_h = false
		_hitbox.position.x = 20
	if velocity.x < 0:
		_sprite2D.flip_h = true
		_hitbox.position.x = -20
	
	if _can_attack == false:
		_animation.play("attack")
		return
	
	if velocity:
		_animation.play("walk")
		return
	_animation.play("idle")

func _on_animation_animation_finished(_anim_name: StringName) -> void:
	if _anim_name == "attack":
		_can_attack = true
