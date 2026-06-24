extends Area2D

@onready var level_completed: CanvasLayer = $"Level completed"
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		level_completed.show()
		timer.start()
		
func _on_timer_timeout() -> void:
	var current_scene_file = get_tree().current_scene.scene_file_path
	var next_level_number = current_scene_file.to_int() + 1
	var next_level_path = "res://scenes/Levels/lvl_" + str(next_level_number) + ".tscn"
	level_completed.hide()
	get_tree().change_scene_to_file(next_level_path)
