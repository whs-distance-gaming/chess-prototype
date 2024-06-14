extends Node3D

signal color_set(color)

enum PieceColor {WHITE, BLACK}

@export var color : PieceColor

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color_set.emit(color)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
