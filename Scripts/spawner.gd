extends Timer
# Timer yang memunculkan buah baru setiap `wait_time` detik.

@export var fruit_scene : PackedScene

func _ready():
	timeout.connect(_on_timeout)

func _on_timeout():
	# Aman kalau slot fruit_scene belum diisi di Inspector.
	if fruit_scene == null:
		return

	var fruit = fruit_scene.instantiate()
	var view_size = get_viewport().get_visible_rect().size

	# X acak, 50 piksel dari tepi kiri/kanan.
	fruit.position.x = randf_range(50, view_size.x - 50)
	# Mulai sedikit di atas layar.
	fruit.position.y = -50

	add_sibling(fruit)
