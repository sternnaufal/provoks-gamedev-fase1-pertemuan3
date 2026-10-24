extends Area2D
# Player memakai Area2D supaya buah bisa mendeteksi sentuhan.

@export var speed : float = 400.0

func _process(delta):
	var direction = Input.get_axis("move_left", "move_right")
	position.x += direction * speed * delta

	# Jangan keluar layar.
	var view_size = get_viewport_rect().size
	position.x = clamp(position.x, 0, view_size.x)
