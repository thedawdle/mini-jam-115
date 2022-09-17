extends Node


signal start(origin, direction)
signal end()


const DIRECTION_RANGE:float = 1.0
const ORIGIN_RANGE:float = 0.001


static func get_random_direction() -> Vector3:
	return Vector3(
		randf_range(-DIRECTION_RANGE, DIRECTION_RANGE),
		randf_range(0.1, DIRECTION_RANGE),
		randf_range(-DIRECTION_RANGE, DIRECTION_RANGE)
	)


static func get_random_origin() -> Vector3:
	return Vector3(
		randf_range(-ORIGIN_RANGE, ORIGIN_RANGE),
		randf_range(-1.0, -1.0),
		randf_range(-ORIGIN_RANGE, ORIGIN_RANGE)
	)


static func get_random_wait() -> float:
	return randf_range(5.0, 8.0)


static func get_random_duration() -> float:
	return randf_range(1.0, 3.0)
