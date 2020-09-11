extends "res://Engine/entity.gd"

const DAMAGE = 0.5

var movetimer_length = 30
var movetimer = 0

func _ready():
	$anim.play("down")
	movedir = dir.rand()

func _physics_process(_delta):
	movement_loop()
	damage_loop()

	if movetimer > 0:
		movetimer -= 1
	if movetimer == 0 || is_on_wall():
		movedir = dir.rand()
		movetimer = movetimer_length
