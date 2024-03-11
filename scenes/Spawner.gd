extends Node2D

export (PackedScene) var ammo
var spawned = null
export (float) var timer = 1.0
var timer_temp = -1

func spawn():
	spawned = ammo.instance()
	get_parent().add_child(spawned)

	var spawn_pos = global_position
	spawned.global_position = spawn_pos
	spawned.scale = scale

func _process(_delta):
	if is_instance_valid(spawned) and scale.x < 0:
		spawned.position.x *= -1
