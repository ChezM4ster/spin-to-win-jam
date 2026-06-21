extends CharacterBody2D
@export var walkSpeed = 200
@export var jumpSpeed = 300
@export var gravity = 500
@export var playerSprite: Sprite2D

@export var isSpinning: bool = false
@export var currentSpinner: Node2D
@export var projectileSpawnArea: Node2D
@export var projectile: PackedScene
@export var currentProjectile: SpinnerProjectile

func get_input():
	var input_velocity = velocity
	if(is_on_floor()):
		input_velocity = Vector2(Input.get_axis("Move_Left","Move_Right") * walkSpeed, velocity.y)
		
## poop
	if (Input.is_action_just_pressed("Jump") && is_on_floor()):
		input_velocity += Vector2(0, -jumpSpeed)
	elif (Input.is_action_just_released("Jump") && velocity.y < 0):
		input_velocity.y = 0
	
		#input_velocity.x = velocity.x 
	
	velocity = input_velocity
	
	##anyspin section
	if(Input.is_action_just_pressed("Interact")):
		if(!isSpinning && currentProjectile == null):
			var newProjectile := projectile.instantiate() as SpinnerProjectile
			add_child(newProjectile)
			currentProjectile = newProjectile
			newProjectile.position = projectileSpawnArea.transform.get_origin()
			return
		else:
			
			currentSpinner = null


func _physics_process(delta: float) -> void:
	get_input()
	if velocity.y > 500:
		velocity.y = 500
	velocity.y += gravity * delta
	move_and_slide()
