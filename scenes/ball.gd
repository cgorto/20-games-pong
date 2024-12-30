class_name Ball extends CharacterBody2D

@export var speed: float = 600.0
@export var game_handler: GameHandler


func _ready() -> void:
	velocity = Vector2.LEFT.rotated(randf_range(0,2* PI)) * speed

func _physics_process(delta: float) -> void:
	var collision_data: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision_data != null:
		var normal = collision_data.get_normal()
		var reflect_velocity: Vector2 = velocity - 2 * (velocity.dot(normal)) * normal
		velocity = reflect_velocity
