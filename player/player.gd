extends CharacterBody2D

@export var speed: int = 55
@onready var animation_player = $AnimationPlayer

func handleInput():
	var moveDirection = Input.get_vector("left", "right", "up", "down")
	velocity = moveDirection * speed
	
func updateAnimation():
	if velocity == Vector2.ZERO:
		if animation_player.is_playing():
			animation_player.stop()
	else:
		var direction = "down"
		if velocity.x < 0: 
			direction = "left"
		elif velocity.x > 0:
			direction = "right"
		elif velocity.y < 0:
			direction = "up"
		animation_player.play("walk_" + direction)

func handleCollision():
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		print_debug(collider.name)

func _physics_process(delta):
	handleInput()
	move_and_slide()
	handleCollision()
	updateAnimation()


func _on_hurtbox_area_entered(area):
	if area.name == "hitbox":
		print_debug(area.get_parent().name)
