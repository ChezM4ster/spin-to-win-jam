extends Node2D
@export var rotationSpeed = 3
@export var canSpin: bool = false
func _physics_process(delta: float) -> void:
	if(canSpin):
		rotate(Input.get_axis("Spin_CounterCW","Spin_CW") * rotationSpeed * delta)

##Use this script for static bodies or parents of static bodies only
