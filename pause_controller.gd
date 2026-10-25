extends Node

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = not get_tree().paused
		get_node("../PauseLabel").visible = get_tree().paused
	elif event is InputEventKey and event.pressed and event.keycode == KEY_R:
		get_tree().paused = false
		get_tree().reload_current_scene()
	elif event is InputEventKey and event.pressed and event.keycode == KEY_M:
		get_tree().paused = false
		get_tree().change_scene_to_file("res://menu.tscn")
