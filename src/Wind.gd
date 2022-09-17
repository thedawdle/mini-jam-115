extends Node


signal start(origin, direction)
signal end()


const DURATION:float = 1.5

const DIRECTION_X_RANGE:float = 1.0
const DIRECTION_Y_RANGE:float = 1.0
const DIRECTION_Z_RANGE:float = 1.0

const ORIGIN_RANGE:float = 0.001


static func get_random_direction() -> Vector3:
	return Vector3(
		randf_range(-DIRECTION_X_RANGE, DIRECTION_X_RANGE),
		randf_range(0.1, DIRECTION_Y_RANGE),
		randf_range(-DIRECTION_Z_RANGE, DIRECTION_Z_RANGE)
	)


static func get_random_origin() -> Vector3:
	return Vector3(
		randf_range(-ORIGIN_RANGE, ORIGIN_RANGE),
		randf_range(-1.0, -1.0),
		randf_range(-ORIGIN_RANGE, ORIGIN_RANGE)
	)
