class_name GameHandler extends Node

@export var ball: Ball
@export var left_paddle: Paddle
@export var right_paddle: Paddle
@export var left_goal: Goal
@export var right_goal: Goal
@export var left_score_text: Label
@export var right_score_text: Label
var left_score: int = 0
var right_score: int = 0

func set_ball(_ball: Ball) -> void:
	ball = _ball
	
	
func spawn_ball() -> void:
	await get_tree().create_timer(2.0).timeout
	var screen_center: Vector2 = get_viewport().size / 2
	ball.position = screen_center
	

func _ready() -> void:
	left_goal.scored.connect(handle_score.bind(false))
	right_goal.scored.connect(handle_score.bind(true))
	
func handle_score(is_right: bool) -> void:
	if is_right:
		left_score += 1
		left_score_text.text = str(left_score)
	else: 
		right_score += 1
		right_score_text.text = str(right_score)
	spawn_ball()
