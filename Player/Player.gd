extends "res://Engine/entity.gd"

var state = "default"

func _init():
	TYPE = "PLAYER"

func _physics_process(_delta):
	damage_loop()
	match state:
		"default":
			state_default()
		"swing":
			state_swing()
#		"throw":
#			state_throw()

func state_default():
	controls_loop()
	movement_loop()
	spritedir_loop()

	# if we are not standing still, choose the correct animation
	if movedir != Vector2(0, 0):
		anim_switch("walk")
	else:
		anim_switch("idle")

	if Input.is_action_just_pressed("a"):
		use_item(preload("res://Player/WrenchSwing.tscn"))

	if Input.is_action_just_pressed("b"):
#		use_item(preload("res://items/bomb.tscn"))
		pass

func state_swing():
	anim_switch("idle")
	movement_loop()
	damage_loop()
	movedir = dir.centre

func state_throw():
	anim_switch("idle")
	movement_loop()

func controls_loop():
	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	var UP = Input.is_action_pressed("ui_up")
	var DOWN = Input.is_action_pressed("ui_down")

	# sets bool to integer, and then makes it a negative; 0 if not being pressed
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
