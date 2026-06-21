extends RigidBody2D
class_name SpinnerProjectile

@export var speed = 500
func _physics_process(_delta: float) -> void:
	linear_velocity = Vector2(speed,0)



func _on_body_entered(body: Node) -> void:
	print_debug(body.name)
	
	queue_free()
	pass # Replace with function body.
