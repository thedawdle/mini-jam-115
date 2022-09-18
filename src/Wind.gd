extends Node


signal start(origin, direction)
signal end()

const STEADY_RANGE:float = 0.1
const GUST_RANGE:float = 1.0
const ORIGIN_RANGE:float = 1.1

var steady:Vector3 = Vector3.ZERO

func _ready():
	steady = get_random_steady()


static func get_random_steady() -> Vector3:
	return Vector3(
		randf_range(-STEADY_RANGE, STEADY_RANGE),
		randf_range(-STEADY_RANGE, 0.0),
		randf_range(-STEADY_RANGE, STEADY_RANGE)
	)


static func get_random_gust() -> Vector3:
	return Vector3(
		randf_range(-GUST_RANGE, GUST_RANGE),
		randf_range(-GUST_RANGE, GUST_RANGE),
		randf_range(-GUST_RANGE, GUST_RANGE)
	)


static func get_random_origin() -> Vector3:
	return Vector3(
		randf_range(-ORIGIN_RANGE, ORIGIN_RANGE),
		randf_range(-1.0, -1.0),
		randf_range(-ORIGIN_RANGE, ORIGIN_RANGE)
	)


static func get_random_wait() -> float:
	return randf_range(10.0, 15.0)


static func get_random_duration() -> float:
	return randf_range(1.0, 3.0)
