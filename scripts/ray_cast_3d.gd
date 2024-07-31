extends RayCast3D

#@export var currentCamera : Camera3D
#@export var targetposition : int
#
#@export var isColliding : bool
#@export var collisionObject3D : CollisionObject3D
#@export var collisionPosition : Vector3
#@export var collisionNormal : Vector3
#
#func _physics_process(delta: float) -> void:
	## Get Mouse Position
	#var mousePosition = get_viewport().get_mouse_position()
	#print(mousePosition)
	#
	## Project a ray using the camera's normal based on the mouse position
	#var normal = currentCamera.project_ray_normal(mousePosition)
	#var length = 100;
	#
	## Define target position of this RayCast node
	#var targetPosition = normal * length
	#isColliding = is_colliding()
	#if (isColliding):
		#collisionObject3D = get_collider() as CollisionObject3D
		#collisionPosition = get_collision_point()
		#collisionNormal = get_collision_normal()
		#print(collisionObject3D.name, collisionPosition, collisionNormal)
	#else:
		#pass
		#
#func _input(event: InputEvent) -> void:
	#if event is InputEventMouseButton:
		#if event.button_index == MOUSE_BUTTON_LEFT:
			#print("Got clicked")
