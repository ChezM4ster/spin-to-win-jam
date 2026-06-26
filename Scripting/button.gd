extends Node2D
@onready var button_off: Sprite2D = $Sprite2D
@onready var button_on: Sprite2D = $Sprite2D2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Laser"):
		button_off.hide()
		button_on.show()
