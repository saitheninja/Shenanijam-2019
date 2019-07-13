extends Position2D

const SCREEN_SIZE = Vector2(160,144)
var grid_pos = Vector2()

# this var doesn't load in for some reason, so i just put it in the function
#onready var parent = get_parent() 

func _ready():
	set_as_toplevel(true)
	get_grid_pos()

func _physics_process(delta):
	get_grid_pos()

func get_grid_pos():
	# screen pos / screen size = no. of screens away
	var x = floor(get_parent().position.x / SCREEN_SIZE.x)
	var y = floor(get_parent().position.y / SCREEN_SIZE.y)
	var player_grid_pos = Vector2(x,y)
	if grid_pos == player_grid_pos:
		return Vector2(x,y)
	grid_pos = player_grid_pos
	position = grid_pos * SCREEN_SIZE
	return Vector2(x,y)