extends ParallaxBackground


export var speed = 100

#A cada frame vamos mudar o speed e decrementar 
func _process(delta):
	offset.x -= speed * delta
	set_scroll_offset(Vector2(offset.x,0))
	
