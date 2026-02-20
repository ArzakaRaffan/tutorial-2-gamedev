extends Node2D

@export var speed = 500.0
@export var can_move: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Platform initialized")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_move:
		if Input.is_action_pressed("move_up"):
			move_local_y(-speed * delta, false)
		
		if Input.is_action_pressed("move_down"):
			move_local_y(speed * delta, false)
