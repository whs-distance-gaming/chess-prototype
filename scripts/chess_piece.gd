extends Node3D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pawn_color_set(color) -> void:
	if color == 0:
		$White_OR_Black.get_child(1).queue_free()
	else:
		$White_OR_Black.get_child(0).queue_free()
