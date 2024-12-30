class_name Goal extends Area2D

signal scored


func _on_body_entered(body: Node2D) -> void:
	var ball: Ball = (body as Ball)
	if ball == null:
		return
	print("Score!")
	scored.emit()
