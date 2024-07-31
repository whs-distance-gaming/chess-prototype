extends Camera3D

var selected_object = null
var original_position = Vector3.ZERO
var height_offset = 2.5  # adjust this value to change the height offset
var mouse_offset = Vector3.ZERO

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			var ray_origin = global_transform.origin
			var ray_direction = project_ray_normal(event.position)
			var space_state = get_world_3d().direct_space_state
			var query = PhysicsRayQueryParameters3D.new()
			query.from = ray_origin
			query.to = ray_origin + ray_direction * 1000.0
			var result = space_state.intersect_ray(query)
			
			if result:
				selected_object = result.collider
				original_position = selected_object.global_transform.origin
				var intersection_point = ray_origin + ray_direction * ((original_position - ray_origin).dot(Vector3.UP) / ray_direction.dot(Vector3.UP))
				mouse_offset = original_position - intersection_point
				selected_object.global_transform.origin += Vector3.UP * height_offset
				mouse_offset.y += height_offset
				selected_object.freeze = true  # disable physics simulation
				print("Selected object: ", selected_object.name)
		elif not event.pressed and selected_object:
			# selected_object.global_transform.origin = original_position
			selected_object.freeze = false # enable physics simulation
			# selected_object.apply_central_impulse(Vector3.DOWN * 10)  # adjust this value to change the drop force
			selected_object = null
	elif event is InputEventMouseMotion and selected_object:
		var ray_origin = global_transform.origin
		var ray_direction = project_ray_normal(event.position)
		var plane_normal = Vector3.UP
		var plane_point = original_position  # use the original position instead of the current position
		var intersection_point = ray_origin + ray_direction * ((plane_point - ray_origin).dot(plane_normal) / ray_direction.dot(plane_normal))
		selected_object.global_transform.origin = intersection_point + mouse_offset

#func _input(event):
	#if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		#if event.pressed:
			#var ray_origin = global_transform.origin
			#var ray_direction = project_ray_normal(event.position)
			#var space_state = get_world_3d().direct_space_state
			#var query = PhysicsRayQueryParameters3D.new()
			#query.from = ray_origin
			#query.to = ray_origin + ray_direction * 1000.0
			#var result = space_state.intersect_ray(query)
			#
			#if result:
				#selected_object = result.collider
				#original_position = selected_object.global_transform.origin
				#selected_object.global_transform.origin += Vector3.UP * height_offset
				#selected_object.freeze = true  # disable physics simulation
				#print("Selected object: ", selected_object.name)
		#elif not event.pressed and selected_object:
			## selected_object.global_transform.origin = original_position
			#selected_object.freeze = false # enable physics simulation
			## selected_object.apply_central_impulse(Vector3.DOWN * 10)  # adjust this value to change the drop force
			#selected_object = null

#func _input(event):
	#if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		#var ray_origin = global_transform.origin
		#var ray_direction = project_ray_normal(event.position)
		#var space_state = get_world_3d().direct_space_state
		#var query = PhysicsRayQueryParameters3D.new()
		#query.from = ray_origin
		#query.to = ray_origin + ray_direction * 1000.0
		#var result = space_state.intersect_ray(query)
		#
		#if result:
			## Here, result.collider will be the object that was clicked
			#print("Clicked on: ", result.collider.name)
			## You can add logic here to "select" the object, e.g., by changing its material
			#if result.collider is MeshInstance3D:
				#var mesh_instance = result.collider
				## Example: Change the material to a selected material
				## mesh_instance.set_surface_override_material(0, load("res://selected_material.tres"))
