extends Node3D

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.keycode == KEY_R:
			get_tree().reload_current_scene()
