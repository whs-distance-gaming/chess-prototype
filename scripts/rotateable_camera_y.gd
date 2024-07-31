extends Node3D

#@export var rotation_speed: float = 0.005 # Speed at which the 3D object rotates
#var rotating: bool = false
#var last_mouse_position: Vector2
#
## Called when the node enters the scene tree for the first time.
#func _ready():
	## Capture mouse input | NOT NEEDED
	## Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	#pass
	#
#func _input(event):
	## Check if the left mouse button is pressed
	#if event is InputEventMouseButton:
		#if event.button_index == MOUSE_BUTTON_LEFT:
			#rotating = event.pressed
			#if rotating:
				#last_mouse_position = event.position
			#else:
				#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	#
	## Check for mouse motion if we are rotating
	#if rotating and event is InputEventMouseMotion:
		#var delta = event.position - last_mouse_position
		#last_mouse_position = event.position
		#rotate_cylinder(delta.x)
#
#func rotate_cylinder(delta_x: float):
	## Rotate the cylinder around the Y axis
	#$MeshInstance3D.rotate_y( -1 * (delta_x * rotation_speed))
#
## Optional: Handle window focus loss to stop rotation
#func _notification(what):
	#if what == NOTIFICATION_APPLICATION_FOCUS_OUT:
		#rotating = false
		#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
