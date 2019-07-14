extends "res://Engine/entity.gd" 

export(int) var wait_time

const BULLET_SCENE = preload("res://Engine/Bullet.tscn")
#onready const PLAYER = $../../Player
onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	$anim.play("wiggle")
	timer.set_one_shot(true)
	set_process(true)
	

func _process(delta):
	damage_loop()
	if timer.is_stopped():
		create_bullet()
		restart_timer()

func create_bullet():
	var bullet = BULLET_SCENE.instance()
	bullet.position.x = self.get_global_position().x
	bullet.position.y = self.get_global_position().y
	$"/root/1Entry/bullets".add_child(bullet)

func restart_timer():
	timer.set_wait_time(wait_time)
	timer.start()