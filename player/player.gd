extends CharacterBody2D

@export var speed: int = 35

func handleInput():
	var moveDirection = Input.get_vector("left", "right", "up", "down")
	velocity = moveDirection * speed
	
func _physics_process(delta):
	handleInput()
	move_and_slide()
