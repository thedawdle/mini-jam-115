extends Camera3D


const OFFSET:Vector3 = Vector3(0, 2.0, 10.0)
const LERP_TRESHOLD:float = 0.1
const MAX_X_DISTANCE:float = 10.0
const MAX_Z_DISTANCE:float = 10.0
const MIN_Z_DISTANCE:float = 3.0
const MATCH_SPEED:float = 80.0
const SPRING_SPEED:float = 3.0

var target_node:Node3D = null


func _physics_process(delta):
	if is_instance_valid(target_node):
		var origin:Vector3 = global_transform.origin
		var target:Vector3 = target_node.global_transform.origin + OFFSET
		var distance = origin.distance_to(target)
		var speed_x:float = _get_speed(abs(origin.x - target.x), MAX_X_DISTANCE)
		
		# Calculate z speed separately so the leaf doesn't blow behind the cam
		var z_distance:float = origin.z - target.z
		var speed_z:float = _get_speed(abs(z_distance), MAX_Z_DISTANCE) if z_distance > 0 else \
			_get_speed(abs(z_distance), MIN_Z_DISTANCE)
			
		if origin.distance_to(target) > LERP_TRESHOLD:
			global_transform.origin = Vector3(
				lerp(origin.x, target.x, speed_x * delta),
				lerp(origin.y, target.y, MATCH_SPEED * delta),
				lerp(origin.z, target.z, speed_z * delta)
			)


func _get_speed(abs_distance:float, max_distance:float) -> float:
	return lerp(
		MATCH_SPEED,
		SPRING_SPEED,
		clamp(max_distance / max(abs_distance, 0.001), 0.0, 1.0))
