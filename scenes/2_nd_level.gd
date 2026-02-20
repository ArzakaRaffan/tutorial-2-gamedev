extends Node
var win: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$finish.hide()
	$finish/CollisionShape2D.disabled = true
	$red_ship.freeze = true
	Transition.play("open")
	await get_tree().create_timer(1.2).timeout
	$red_ship.freeze = false

func _process(delta: float) -> void:
	if get_tree().get_nodes_in_group("enemy").is_empty() and not win:
		win = true
		$finish/CollisionShape2D.disabled = false
		$finish.show()
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == 'red_ship' and not win:
		body.queue_free()
		for bullet in get_tree().get_nodes_in_group('bullet'):
			bullet.queue_free()
		$lose.show()
	if(body.name == 'Try Again'):
		Transition.play("close")
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://scenes/2nd_level.tscn")


func _on_finish_body_entered(body: Node2D) -> void:
	if body.name == 'red_ship' and win:
		$Area2D/CollisionShape2D.disabled = true
		$win.show()


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/MainLevel.tscn")
