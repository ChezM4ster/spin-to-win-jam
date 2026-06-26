extends Node2D
class_name SpinnerObject
@export var rotationSpeed: float = 300
@export var spinnerRigidBody: RigidBody2D
#@export var originBody: StaticBody2D

@export var staticSpinner: Node2D
@export var canSpin: bool = false
@export var spinCoreSprite: AnimatedSprite2D


func _ready() -> void:
	if(spinCoreSprite == null):
		print_debug("You're missing a spin core sprite")

func _physics_process(delta: float) -> void:
	
	if(canSpin):
		##For spinning rigidbodies
		if(spinnerRigidBody != null):
			spinnerRigidBody.angular_velocity = (Input.get_axis("Spin_CounterCW","Spin_CW") * rotationSpeed * delta)
			spinnerRigidBody.move_and_collide(spinnerRigidBody.linear_velocity * delta)
		##For spinning static objects
		elif (staticSpinner != null):
			rotate(Input.get_axis("Spin_CounterCW","Spin_CW") * rotationSpeed * delta)
			##USE SMALLER NUMBERS FOR ROTATING STATIC OBJECTS
	return

func setSpin (canISpinNowPLease: bool):
	if(canISpinNowPLease):
		spinCoreSprite.play()
	else: spinCoreSprite.stop()
	canSpin = canISpinNowPLease
	pass


func _on_rigid_body_2d_body_entered(_body: Node) -> void:
	
	pass # Replace with function body.
