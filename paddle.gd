extends CharacterBody2D

const SPEED = 400.0

func _physics_process(delta):
	var direction = Input.get_axis("ui_up", "ui_down")
	position.y += direction * SPEED * delta
	position.y = clamp(position.y, 60, 588)
