extends CharacterBody2D

@onready var ball = get_node("../Ball")

func _physics_process(delta):
	var diff = ball.position.y - position.y
	var ball_coming = ball.velocity.x > 0 and ball.position.x > 400
	var dir = 0.0
	if ball_coming and abs(diff) > 30:
		dir = sign(diff)
	position.y += dir * Global.ai_speed * delta
	position.y = clamp(position.y, 60, 588)
