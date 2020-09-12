extends Node2D

var point_scene = load("point.tscn")

func add_point(p):
	var point_instance = point_scene.instance()
	point_instance.set_position(p)
	get_parent().add_child(point_instance)
	
func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.get_button_index() == 1:
		# spawn point if left click only
		add_point(event.position)

func get_all_points_info():
	print("### RECAP ###")
	var i=1
	for p in get_tree().get_nodes_in_group("points"):
		prints(p,"no",i,"at",p.position)
		i+=1
	print("### END ###")
	return get_tree().get_nodes_in_group("points")

var counter_delta = 0
func _process(delta):
	if counter_delta > 3:
		counter_delta = 0
		get_all_points_info()
	counter_delta+=delta

func get_targets():
	"""
	to implement:
	- result = []
	- wait until all points are placed
	- add all target to one group and get the group in target_to_match array:
	- for each point x:
		if not target_to_match.empty():
			- check distance compared to all targets
			- get target y with lowest distance
			- store distance associated with point x to target y:
				[target x, distance, target y]
			- append to result array
			- remove target y from group of point-target to match
	return result
	"""	 

	pass
