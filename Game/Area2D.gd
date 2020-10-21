extends Area2D

export var coin_speed = 400

func _process(delta):
	position.x -= coin_speed * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Coin_body_entered(body):
	get_tree().call_group("Player","coin_pickup")
	queue_free()
