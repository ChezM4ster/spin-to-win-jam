extends Node2D
class_name  SpinnerObject
@export var rotationSpeed: float = 300
@export var spinnerRigidBody: RigidBody2D
#@export var originBody: StaticBody2D

@export var staticSpinner: Node2D
@export var canSpin: bool = false


func _physics_process(delta: float) -> void:
	
	if(Input.get_axis("Spin_CounterCW","Spin_CW") != 0 && canSpin):
		if(spinnerRigidBody != null):
			spinnerRigidBody.angular_velocity = (Input.get_axis("Spin_CounterCW","Spin_CW") * rotationSpeed * delta)
		elif (staticSpinner != null):
			rotate(Input.get_axis("Spin_CounterCW","Spin_CW") * rotationSpeed * delta)
			##USE SMALLER NUMBERS FOR ROTATING STATIC OBJECTS
	if(spinnerRigidBody != null):
		spinnerRigidBody.move_and_collide(spinnerRigidBody.linear_velocity * delta)
	return


func _on_rigid_body_2d_body_entered(_body: Node) -> void:
	
	pass # Replace with function body.
