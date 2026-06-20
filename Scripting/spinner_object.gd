extends Node2D

@export var rotationSpeed = 300
@export var spinnerRigidBody: RigidBody2D
@export var originBody: StaticBody2D
var canSpin = true


func _physics_process(delta: float) -> void:
	#var radius = spinnerRigidBody.global_position - originBody.global_position
	# Perpendicular vector (90° rotation)
	#var tangent = Vector2(-radius.y, radius.x).normalized()
	#spinnerRigidBody.apply_central_force(tangent * Input.get_axis("Spin_CounterCW","Spin_CW") * rotationSpeed * delta)
	
	
	spinnerRigidBody.angular_velocity = (Input.get_axis("Spin_CounterCW","Spin_CW") * rotationSpeed * delta)
	#rotate()
	spinnerRigidBody.move_and_collide(spinnerRigidBody.linear_velocity * delta)
	return


func _on_rigid_body_2d_body_entered(body: Node) -> void:
	
	pass # Replace with function body.
