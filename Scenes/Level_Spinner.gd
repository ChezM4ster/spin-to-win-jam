extends Node2D
@export var rotationSpeed = 3

func _physics_process(delta: float) -> void:
	rotate(Input.get_axis("Spin_CounterCW","Spin_CW") * rotationSpeed * delta)
