extends RigidBody2D
@export var rotation_speed = 300
@export var rigid_body_2d: RigidBody2D

func _physics_process(delta: float) -> void:
	#var radius = spinnerRigidBody.global_position - originBody.global_position
	# Perpendicular vector (90° rotation)
	#var tangent = Vector2(-radius.y, radius.x).normalized()
	#spinnerRigidBody.apply_central_force(tangent * Input.get_axis("Spin_CounterCW","Spin_CW") * rotationSpeed * delta)
	
	
	rigid_body_2d.angular_velocity = (Input.get_axis("Spin_CounterCW","Spin_CW") * rotation_speed * delta)
	#rotate()
	rigid_body_2d.move_and_collide(rigid_body_2d.linear_velocity * delta)
	return
