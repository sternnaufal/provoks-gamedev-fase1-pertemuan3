extends Area2D
# Buah jatuh ke bawah dan hilang saat tersentuh atau lewat bawah layar.

@export var fall_speed : float = 200.0

func _ready():
	area_entered.connect(_on_area_entered)

func _process(delta):
	position.y += fall_speed * delta

	# Lewat bawah layar -> hapus.
	if position.y > get_viewport_rect().size.y + 50:
		queue_free()

func _on_area_entered(area):
	queue_free()
