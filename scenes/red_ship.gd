extends RigidBody2D

@onready var endpoint: Marker2D = $endpoint

const BULLET = preload("res://scenes/bullet.tscn")
const ROT_SPEED := 30.0
const MIN_DIST := 10.0
var aim_angle := 0.0	
@export var BASE_SPEED := 500.0
@export var MAX_BOUNCE_ANGLE := 0.9


func _ready():
	lock_rotation = true
	gravity_scale = 1 
	linear_velocity = Vector2.ZERO


func _physics_process(delta):
	if Input.is_action_just_pressed("click"):
		shoot()
	
	mirrored()

	var mouse_pos = get_global_mouse_position()
	var dir = mouse_pos - global_position
	
	if dir.length() > MIN_DIST:
		aim_angle = lerp_angle(aim_angle, dir.angle(), ROT_SPEED * delta)

func _integrate_forces(state):
	var pos = state.transform.origin

	state.transform = Transform2D(aim_angle, pos)
	state.angular_velocity = 0
	
	for i in range(state.get_contact_count()):
		var collider = state.get_contact_collider_object(i)
		
		if collider is Platform:

			# Hit position relatif terhadap tengah paddle (-1 sampai 1)
			var relative = (global_position.x - collider.global_position.x) / 60.0
			relative = clamp(relative, -1.0, 1.0)

			# Tentukan sudut pantulan
			var angle = relative * MAX_BOUNCE_ANGLE

			# Buat arah baru
			var new_velocity = Vector2(
				sin(angle),
				-abs(cos(angle))
			)

			state.linear_velocity = new_velocity.normalized() * BASE_SPEED


func shoot():
	var bullet = BULLET.instantiate()
	bullet.global_position = endpoint.global_position
	bullet.global_rotation = aim_angle
	get_parent().add_child(bullet)

func mirrored():
	var screen_width = get_viewport_rect().size.x
	
	if global_position.x > screen_width:
		global_position.x = 0
	elif global_position.x < 0:
		global_position.x = screen_width
