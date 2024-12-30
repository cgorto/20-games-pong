class_name Paddle extends CharacterBody2D

@export var is_player: bool = false
@export var movement_speed: float = 500.0
@export var game_handler: GameHandler

func _physics_process(delta: float) -> void:
	if is_player:
		handle_player(delta)
	else:
		handle_ai(delta)

func handle_player(delta: float) -> void:
	var movement: float = Input.get_axis("down","up")
	velocity = Vector2.UP * movement * movement_speed
	move_and_slide()

func handle_ai(delta:float) -> void:
	var ball_pos: Vector2 = game_handler.ball.global_position
	if ball_pos.y < global_position.y:
		velocity = Vector2.UP * movement_speed
	else:
		velocity = Vector2.DOWN * movement_speed
	#random strength so that it's not perfect
	velocity *= randf_range(0.6,0.9)
	move_and_slide()
