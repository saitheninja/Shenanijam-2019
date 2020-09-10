extends "res://Engine/entity.gd"

const DAMAGE = 1

func _ready():
	set_process(true)
	movedir = Vector2(-1,0)

func _process(_delta):
	damage_loop()
	movement_loop()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
