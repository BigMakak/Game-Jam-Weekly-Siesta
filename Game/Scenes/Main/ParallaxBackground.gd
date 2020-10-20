extends ParallaxBackground

export(int) var speed = 100
export(float) var rotation_speed = 0.3

#Direção para o vector. Tem de ser -1 para ir da direita para a esquerda
var direction = Vector2(-1,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset += direction * speed * delta
