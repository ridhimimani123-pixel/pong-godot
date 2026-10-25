extends CharacterBody2D

const SPEED = 400.0
const WIN_SCORE = 5
var score_left: int = 0
var score_right: int = 0
var game_over: bool = false

func _ready():
	reset_ball()

func reset_ball():
	position = Vector2(576, 324)
	var dir_x = 1 if randf() > 0.5 else -1
	var dir_y = randf_range(-0.5, 0.5)
	velocity = Vector2(dir_x, dir_y).normalized() * SPEED

func end_game(winner: String):
	game_over = true
	velocity = Vector2.ZERO
	$ScoreSound.play()
	var label = get_node("../GameOverLabel")
	label.text = winner + " wins!\nEnter = play again"
	label.visible = true

func _physics_process(delta):
	if game_over:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().reload_current_scene()
		return

	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		if collision.get_collider() is CharacterBody2D:
			$HitSound.play()

	if position.x < 0:
		score_right += 1
		get_node("../ScoreRight").text = str(score_right)
		if score_right >= WIN_SCORE:
			end_game("Right")
		else:
			reset_ball()
		return
	elif position.x > 1152:
		score_left += 1
		get_node("../ScoreLeft").text = str(score_left)
		if score_left >= WIN_SCORE:
			end_game("Left")
		else:
			reset_ball()
		return
