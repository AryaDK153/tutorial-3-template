extends StaticBody2D
func _ready():
	$AnimationPlayer.play("attack")
	yield(get_tree().create_timer(1), "timeout")
	queue_free()
