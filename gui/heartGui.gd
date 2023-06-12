extends Panel

@onready var sprite_2d = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update(whole: bool):
	if whole:
		sprite_2d.frame = 0
	else:
		sprite_2d.frame = 4
