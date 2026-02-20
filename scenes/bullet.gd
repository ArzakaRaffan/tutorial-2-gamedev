extends CharacterBody2D

func _ready() -> void:
	$AnimatedSprite2D.play("idle")

func _process(delta): #ini bullet yang dipake, yang fire_bulllet cuma buat coba coba hehe
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * 500 * delta
