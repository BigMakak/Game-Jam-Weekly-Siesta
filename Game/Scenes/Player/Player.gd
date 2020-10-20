extends KinematicBody2D

#Constantes do player como a velocidade da gravidade e do speed do jump
const GRAVITY = 10
const JUMP_SPEED = 400
#Começar o vector a [0,0]
var velocity = Vector2.ZERO

signal hit

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Como o eixo é invertido queremos a gravidade a ser adicionada.
	velocity.y += GRAVITY
	
	#Podiamos usar a função is_on_wall() e o engine verifica se o player esta a bater num static body.
	if Input.is_action_just_pressed("Jump_Keys") and is_on_floor():
		#Jump speed é negativo porque o eixo do jogo é invertido da nossa norma. Para subir temos de decrementar o Y.
		velocity.y = -JUMP_SPEED
	
	if is_on_floor():
		$AnimatedSprite.play("walk")
	else:
		$AnimatedSprite.play("jump")
	
	#Função especifica de KinematicBody2D  
	#Moves the body along a vector. If the body collides with another, it will slide along the other body rather than stop immediately
	#Inserimos o Vecto2.UP para dizermos que estamos a aumentar a velocidade para cima na perspectiva do nosso jogo
	#Assim a função is_on_floor() sabe onde fica o chao, fica no valor negativo da velocity, e começa a funcionar da maneira que queremos para este jogo
	move_and_slide(velocity,Vector2.UP)

#Criação da funçao para acabar o jogo.
#O node player vai pertencer a um grupo para ser mais facil de chamar as funçoes necessárias
func end_game():
	hide()
	emit_signal("hit")

func start_player():
	show()
	
	
