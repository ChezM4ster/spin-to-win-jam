extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -300.0
@export var coyote_t: float = 0.1
@export var jump_buffer_t: float = 0.05
var jump_pressed = false
var jump_buffer_timer = Timer
var was_on_floor = false
var can_coyote_jump = false
@onready var corporate_guy_sprite: AnimatedSprite2D = $AnimatedSprite2D

#Shooting variables
@export var currentSpinner: SpinnerObject
@export var isSpinning: bool = false
@export var projectileSpawnArea: Node2D
@export var projectile: PackedScene
@export var currentProjectile: SpinnerProjectile
@export var laserPointer: Line2D


func _ready() -> void:
	jump_buffer_timer = Timer.new()
	jump_buffer_timer.one_shot = true
	jump_buffer_timer.timeout.connect(func(): jump_pressed = false)
	add_child(jump_buffer_timer)
	laserPointer = $Line2D
	laserPointer.clear_points()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		if was_on_floor and velocity.y >= 0 :
			can_coyote_jump = true
			get_tree().create_timer(coyote_t).timeout.connect(func(): can_coyote_jump = false)
		else:
			if jump_pressed:
				velocity.y = JUMP_VELOCITY
				jump_pressed=false
				jump_buffer_timer.stop()
	
	if Input.is_action_just_pressed("Jump"):
		if is_on_floor() or can_coyote_jump:
			velocity.y = JUMP_VELOCITY
			can_coyote_jump = false
		else:
			jump_pressed = true
			jump_buffer_timer.start(jump_buffer_t)
	if Input.is_action_just_released("Jump") and velocity.y < 0:
		velocity.y = JUMP_VELOCITY/4

	
	var direction := Input.get_axis("Move_Left", "Move_Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if direction < 0 :
		corporate_guy_sprite.flip_h = true
		projectileSpawnArea.position.x = -7.0
	if direction > 0 :
		corporate_guy_sprite.flip_h = false
		projectileSpawnArea.position.x = 7.0

	move_and_slide()
	
		##anyspin section
	if(Input.is_action_just_pressed("Interact")):
		if(!isSpinning && currentProjectile == null):
			var newProjectile := projectile.instantiate() as SpinnerProjectile
			add_child(newProjectile)
			currentProjectile = newProjectile
			newProjectile.position = projectileSpawnArea.transform.get_origin()
			newProjectile.spinnerHit.connect(_on_spinner_hit)
			if(corporate_guy_sprite.flip_h == true): newProjectile.speed *= -1
			return
		elif(currentSpinner != null): cancelSpinning()
##Laser Pointer Section
	if (currentSpinner != null):
		laserPointer.clear_points()
		laserPointer.add_point(projectileSpawnArea.position)
		#while (laserPointer.get_point_position(laserPointer.get_point_count()-1).distance_to(currentSpinner.spinCoreSprite.global_position) > 16):
		laserPointer.add_point(currentSpinner.spinCoreSprite.global_position - global_position)


func cancelSpinning():
	currentSpinner.setSpin(false)
	currentSpinner = null
	isSpinning = false
	laserPointer.clear_points()

#line.add_point(some_global_pos - line.global_position)
#region signal catcher
func _on_spinner_hit(newSpinner: SpinnerObject) -> void:
	currentSpinner = newSpinner
	newSpinner.setSpin(true)
	isSpinning = true
	pass
#endregion
