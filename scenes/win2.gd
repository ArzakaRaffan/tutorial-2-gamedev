extends Node2D
var one_time: bool = true
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label2.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if visible and one_time:
		one_time = false
		animation_player.play("typing")
		await animation_player.animation_finished
		$Label2.show()
		animation_player.play("idling")
		await get_tree().create_timer(0.75).timeout
		$TextureButton.show()

func _on_continue_button_pressed() -> void:
	Transition.play("close")
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://scenes/MainLevel.tscn")
