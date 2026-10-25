extends Control

func _ready():
	$VBoxContainer/EasyButton.pressed.connect(start_game.bind(100.0))
	$VBoxContainer/MediumButton.pressed.connect(start_game.bind(150.0))
	$VBoxContainer/ExtremeButton.pressed.connect(start_game.bind(250.0))

func start_game(speed):
	Global.ai_speed = speed
	get_tree().change_scene_to_file("res://main.tscn")
