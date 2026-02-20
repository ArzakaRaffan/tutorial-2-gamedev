extends CharacterBody2D

func _ready() -> void:
	$anim.play("idle")

func _on_enemy_area_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group('bullet'):
		area.get_parent().queue_free()
		$anim.play("explode")
		await $anim.animation_finished
		queue_free()
