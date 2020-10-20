extends Camera2D

export var scroll_speed = 100

func _process(delta):
	#scroll_speed *= delta
	set_position(Vector2(position.x + scroll_speed,position.y))
