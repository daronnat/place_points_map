extends Area2D

func _ready():
	print("added a point.")
	add_to_group("points")
	$spawning.interpolate_property(self, "scale",
		Vector2(0, 0), scale, 0.33,
		Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	$spawning.start()

func _on_point_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.get_button_index() == 2:
		delete_point()

func delete_point():
	queue_free()
