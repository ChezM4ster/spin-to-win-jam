extends CharacterBody2D
@export var walkSpeed = 200
@export var jumpSpeed = 300
@export var gravity = 500
@export var playerSprite: Sprite2D
var  isGrounded = false

func get_input():
	var input_velocity = velocity
	if(is_on_floor()):
		input_velocity = Vector2(Input.get_axis("Move_Left","Move_Right") * walkSpeed, velocity.y)
		

	if (Input.is_action_just_pressed("Jump") && is_on_floor()):
		input_velocity += Vector2(0, -jumpSpeed)
	elif (Input.is_action_just_released("Jump") && velocity.y < 0):
		input_velocity.y = 0
	
		#input_velocity.x = velocity.x 
	
	
	velocity = input_velocity


func _physics_process(delta: float) -> void:
	get_input()
	if velocity.y > 500:
		velocity.y = 500
	velocity.y += gravity * delta
	move_and_slide()
