extends RayCast2D

@onready var ray_cast_2d: RayCast2D = $"."

@onready var line_2d: Line2D = $Line2D

@onready var rot_gear: RigidBody2D = $".."
@onready var area_2d: Area2D = $Area2D

func _process(delta: float) -> void:
	line_2d.clear_points()
	if ray_cast_2d.is_colliding():
		line_2d.add_point(line_2d.to_local(rot_gear.global_position))
		line_2d.add_point(line_2d.to_local(ray_cast_2d.get_collision_point()))
		var collider = ray_cast_2d.get_collider()
		if collider.is_in_group("Button"):
			if collider.has_method("activated"):
				collider.activated()
	
#func _physics_process(delta: float) -> void:
#	area_2d.global_position = ray_cast_2d.get_collision_point()
