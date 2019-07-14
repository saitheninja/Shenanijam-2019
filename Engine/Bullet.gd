extends "res://Engine/entity.gd" 

const DAMAGE = 1


func _ready():
	set_process(true)

func process(delta):
	var speed_x = -1
	var speed_y = 0
	var motion = Vector2(speed_x,speed_y) * SPEED
	self.position = self.position + motion * delta
	print()
#	movement_loop()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()