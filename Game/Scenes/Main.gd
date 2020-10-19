extends Node

const OBSTACLE = preload("res://Scenes/Obstacles/Obstacle.tscn")

func _on_Timer_timeout():
	var obstacle = OBSTACLE.instance()
	add_child(obstacle)    #Basicamente colocou-se uma scene dentro de uma scene
