extends Area2D

#Vai determinar um numero random quando intaciamos um obstacle na main scene do jogo 
onready var obs_speed = rand_range(450,550)

#Lista de nomes das sprites nas animated sprites
var obstacle_sprites = ["box","fence","stone"]

func _ready():
	#Dizer ao engine para escolher numeros random para a função randi()
	#Senao a cada vez que se joga os numeros vao ser sempre os mesmo random
	randomize()
	#Escolher uma localizao random da lista. O randi vai de 0 ate ao maximo da lista
	var curr_obstacle = obstacle_sprites[randi() % obstacle_sprites.size()]
	
	#Dizer a Animatedsprite qual vai ser 
	$ObstacleSprites.animation = curr_obstacle

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
