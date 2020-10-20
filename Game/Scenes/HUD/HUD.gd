extends CanvasLayer

signal start_game

func show_message(message):
	$Message.text = message
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over")
	
	yield($MessageTimer,"timeout")
	
	$Tittle.show()
	
	yield(get_tree().create_timer(1),"timeout")
	$Button_Start.show()


func _on_Button_Start_pressed():
	$Button_Start.hide()
	$Tittle.hide()
	emit_signal("start_game")
	


func _on_MessageTimer_timeout():
	$Message.hide()
