extends StaticBody2D
class_name Platform

const SPEED := 1000
var velocity := Vector2.ZERO

func _physics_process(delta):
	var x_dir = Input.get_axis("left", "right")
	
	velocity = Vector2(x_dir, 0) * SPEED
	position += velocity * delta
	
	mirrored()

func mirrored():
	var screen_width = get_viewport_rect().size.x
	
	if global_position.x > screen_width:
		global_position.x = 0
	elif global_position.x < 0:
		global_position.x = screen_width
