extends Area2D
@onready var platform_blue: Node2D = $"../PlatformBlue"
@onready var win: Node2D = $"../win"

func _on_ObjectiveArea_body_entered(body: RigidBody2D):
	if (body.name == "BlueShip"):
		platform_blue.can_move = false
		win.show()
		#Transition.play("close")
		#await get_tree().create_timer(2.0).timeout
		#get_tree().change_scene_to_file("res://scenes/2nd_level.tscn")
