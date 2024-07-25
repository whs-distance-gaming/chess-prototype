extends "res://scripts/game.gd"

enum PieceColor {WHITE, BLACK}
# WHITE: Color(221, 227, 227)
# BLACK: Color(6, 7, 7)

@export var color : PieceColor

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if color == PieceColor.BLACK:
		var material = StandardMaterial3D.new()
		material.albedo_color = Color(0.06, 0.07, 0.07, 1)
		material.roughness = 0.5
		material.cull_mode = BaseMaterial3D.CULL_DISABLED
		$MeshInstance3D.set_surface_override_material(0, material)
		
		if $MeshInstance3D.get_surface_override_material_count() > 1:
			$MeshInstance3D.set_surface_override_material(1, material)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
