extends Camera2D

#const SCREEN_SIZE = Vector2(160,144)
#const HUD_THICKNESS = 16

# camera shake stuff
onready var timer = get_node("Timer")

export var amplitude : = 6.0
export var duration : = 0.8
export(float, EASE) var DAMP_EASING : = 1.0
export var enabled : = false
var shake : = false


func _ready():
	$area.connect("body_entered",self,"body_entered")
	$area.connect("body_exited",self,"body_exited")
	#$area.connect("area_exited",self,"area_exited")
	set_duration(duration)
	connect_to_shakers()

func _process(delta):
	if shake:
		var damping : = ease(timer.time_left / timer.wait_time, DAMP_EASING)
		randomize()
		offset = Vector2(
			rand_range(amplitude, -amplitude) * damping,
			rand_range(amplitude, -amplitude) * damping)

# camera shake stuff
# turn camera shake off once duration is done, from Timer signal
func _on_Timer_timeout() -> void:
	set_shake(false)

# when signal is received, turn on shake
func _on_camera_shake_requested() -> void:
	print("signal received")
	if not enabled:
		return
	set_shake(true)

# set duration of camera shake
func set_duration(value: float) -> void:
	duration = value
	timer.wait_time = duration

# turns on shaker
func set_shake(value: bool) -> void:
	shake = value
	offset = Vector2()
	print(offset)
	if shake:
		timer.start()
		print(offset)
	
func connect_to_shakers() -> void:
	# connect emmiters to this receiver
	# emitters are all nodes in camera_shaker group
	for camera_shaker in get_tree().get_nodes_in_group("camera_shaker"):
		camera_shaker.connect("camera_shake_requested", self, "_on_camera_shake_requested")
			


func get_enemies():
	var enemies = []
	# for all bodies overlapping camera2d area
	for body in $area.get_overlapping_bodies():
		# use get so it doesn't crash if there is no type
		# if body type is enemy, and it is not already in the array
		if body.get("TYPE") == "ENEMY" && enemies.find(body) == -1:
			# add enemies to array
			enemies.append(body)
	return enemies.size()
	print(enemies)

# turn enemies on when they are in frame
func body_entered(body):
	if body.get("TYPE") == "ENEMY":
		body.set_physics_process(true)

# turn enemies off if they are out of frame
func body_exited(body):
	if body.get("TYPE") == "ENEMY":
		body.set_physics_process(false)

#func area_exited(area):
#	if area.get("disappears") == true:
#		area.queue_free()