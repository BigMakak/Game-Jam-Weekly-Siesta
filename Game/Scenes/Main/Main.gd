extends Node

const OBSTACLE = preload("res://Scenes/Obstacles/Obstacle.tscn")

func _ready():
	$Player_Kine.hide()

func _on_Timer_timeout():
	var obstacle = OBSTACLE.instance()
	add_child(obstacle)    #Basicamente colocou-se uma scene dentro de uma scene

func start_game():
	$Player_Kine.start_player()
	$SpawnTimer.start()
	

#Basicamente esta função vai desligar o SpawnTimer e dizer ao hud para mostrar o game over.
#É necessário apagar todos os obstaculos que se encontrem on screen.
func _on_Player_hit():
	#Parar o SpawmTimer 
	$SpawnTimer.stop()
	#Fazer com que todos os obstacle desapareçam
	get_tree().call_group("obstacle","queue_free")
	#Dizer ao HUD para mostrar o game over.
	$HUD.show_game_over()
