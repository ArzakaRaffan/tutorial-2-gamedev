extends RigidBody2D

@onready var sprite: Sprite2D = $Sprite2D

var normal_texture: Texture2D
var hover_texture: Texture2D

func _ready() -> void:
	normal_texture = preload("res://assets/UI/_Try Again_.png")
	hover_texture = preload("res://assets/UI/Try Again Hover.png")
	sprite.texture = normal_texture
	freeze = true


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	
	if event is InputEventMouseMotion:
		sprite.texture = hover_texture
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			freeze = false
