extends Position2D

const SCREEN_SIZE = Vector2(160,144)
var grid_pos = Vector2()

onready var parent = $'..' 

func _ready():
	set_as_toplevel(true)
	get_grid_pos()

func _physics_process(delta):
	get_grid_pos()

func get_grid_pos():
	# screen pos / screen size = no. of screens away
	var x = floor(parent.position.x / SCREEN_SIZE.x)
	var y = floor(parent.position.y / SCREEN_SIZE.y)
	var player_grid_pos = Vector2(x,y)
	if grid_pos == player_grid_pos:
		return
	grid_pos = player_grid_pos
	position = grid_pos * SCREEN_SIZE
	return Vector2(x,y)