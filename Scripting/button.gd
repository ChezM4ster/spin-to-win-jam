extends Node2D
@onready var button_off: Sprite2D = $Sprite2D
@onready var button_on: Sprite2D = $Sprite2D2


func _on_area_2d_area_entered(area: Area2D) -> void:
	button_off.hide()
	button_off.show()



func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	button_off.hide()
	button_off.show()
