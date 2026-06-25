extends Node2D
@export var rotation_speed = 300
@export var rot_gear: RigidBody2D
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var line_2d: Line2D = $RayCast2D/Line2D

func _process(delta: float) -> void:
	line_2d.clear_points()
	if ray_cast_2d.is_colliding():
		line_2d.add_point(line_2d.to_local(rot_gear.global_position))
		line_2d.add_point(line_2d.to_local(ray_cast_2d.get_collision_point()))
	
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
