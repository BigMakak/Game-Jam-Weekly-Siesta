extends Control

func _ready():
	if Global.curr_score > Global.high_score:
		Global.high_score = Global.curr_score
	#Dar o valor de high score e dar cast da int Global.high_score para string
	$HighScoreText.text = "HighScore: " + str(Global.high_score)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Jump_Keys"):
		get_tree().change_scene("res://Scenes/Main/Main.tscn")
