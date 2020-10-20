extends Area2D

export var obs_speed = 500

func _process(delta):
	position.x -= obs_speed * delta #Permite deslocar até a esquerda. Multiplicar por delta para manter coerência entre
							  #framerates (principalmente, entre player framerate e obstaculo framerate). 500 É
							  # O VALOR DA VELOCIDADE DO OBSTACULO, PODE-SE ALTERAR <<<<<<<<<<

#Eliminar obstáculos que saem do ecrã
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

#So queremos que isto aconteça quando o obstaculo entra em contacto com o player
#Para isto o Player e o obstaculo tem de estar na mesma Mask
func _on_Obstacle_body_entered(body):
	get_tree().call_group("Player","end_game")
