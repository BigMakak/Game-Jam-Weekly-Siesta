extends KinematicBody2D

#Constantes do player como a velocidade da gravidade e do speed do jump
const GRAVITY = 10
const JUMP_SPEED = 400
#Começar o vector a [0,0]
var velocity = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Como o eixo é invertido queremos a gravidade a ser adicionada.
	velocity.y += GRAVITY
	
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = -JUMP_SPEED
	
	#Função especifica de KinematicBody2D  
	#Moves the body along a vector. If the body collides with another, it will slide along the other body rather than stop immediately
	move_and_slide(velocity)
