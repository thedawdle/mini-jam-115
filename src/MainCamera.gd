extends Camera3D


const OFFSET:Vector3 = Vector3(0, 2.0, 10.0)
const LERP_TRESHOLD:float = 0.1
const MAX_X_DISTANCE:float = 10.0
const MATCH_SPEED:float = 20.0
const SPRING_SPEED:float = 3.0

var target_node:Node3D = null


func _physics_process(delta):
	if is_instance_valid(target_node):
		var origin:Vector3 = global_transform.origin
		var target:Vector3 = target_node.global_transform.origin + OFFSET
		var distance = origin.distance_to(target)
		var speed:float = lerp(
			MATCH_SPEED,
			SPRING_SPEED,
			clamp(MAX_X_DISTANCE / abs(origin.x - target.x), 0.0, 1.0))
			
		if origin.distance_to(target) > LERP_TRESHOLD:
			global_transform.origin = Vector3(
				lerp(origin.x, target.x, speed * delta),
				lerp(origin.y, target.y, MATCH_SPEED * delta),
				lerp(origin.z, target.z, MATCH_SPEED * delta)
			)
