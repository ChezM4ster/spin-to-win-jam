extends RigidBody2D
class_name SpinnerProjectile
signal spinnerHit(newSpinner: SpinnerObject)
@export var speed = 500



func _physics_process(_delta: float) -> void:
	linear_velocity = Vector2(speed,0)



func _on_body_entered(body: Node) -> void:
	print_debug(body)
	if(body.is_in_group('Spin_Objects')):
		if (body is SpinnerObject):
			spinnerHit.emit(body as SpinnerObject)
		elif (body.get_parent() is SpinnerObject):
			spinnerHit.emit(body.get_parent() as SpinnerObject)
		elif (body.is_in_group('Spin_Objects')):
			spinnerHit.emit(body as SpinnerObject)
	queue_free()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	queue_free()
