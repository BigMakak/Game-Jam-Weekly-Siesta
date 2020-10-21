extends Node

const OBSTACLE = preload("res://Scenes/Obstacles/Obstacle.tscn")

func _ready():
	start_game()
	
func _process(delta):
	#A cada frame vamos actualizar o socre do jogador
	$ScoreLabel.text = "Score: " + str(Global.curr_score)

func _on_Timer_timeout():
	var obstacle = OBSTACLE.instance()
	add_child(obstacle)    #Basicamente colocou-se uma scene dentro de uma scene
	#Mudar o wait time do spawner entre 1.5 a 4 segundos
	$SpawnTimer.wait_time = rand_range(1.5,3.5)

func start_game():
	#Ligar o timer do Spawner
	$SpawnTimer.start()
	#Ligar o timer do score
	$ScoreTimer.start()
	#Mudar o score current para 0 a cada vez que o jogo começa
	Global.curr_score = 0
	

#Basicamente esta função vai desligar o SpawnTimer e dizer ao hud para mostrar o game over.
#É necessário apagar todos os obstaculos que se encontrem on screen.
func _on_Player_hit():
	#Parar o SpawmTimer 
	$SpawnTimer.stop()
	#Desligar o score timer
	$ScoreTimer.stop()
	#Fazer com que todos os obstacle desapareçam
	get_tree().call_group("obstacle","queue_free")
	#Mudar de cena para o TittleScreen
	get_tree().change_scene("res://Scenes/TittleScreen/TittleScreen.tscn")


func _on_ScoreTimer_timeout():
	#Ao passar o tempo do ScoreTimer vamos incrementar o current score do jogador
	Global.curr_score += 1
