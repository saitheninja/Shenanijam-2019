extends StaticBody2D

onready var Camera = get_node("../Player/GridSnapper/Camera")
onready var GridSnapper = get_node("../Player/GridSnapper")
onready var Player = get_node("../Player")

func _ready():
	$anim.play("open")

func _process(_delta):
	if GridSnapper.grid_pos == GridSnapper.get_grid_pos():
		if Camera.get_enemies() == 0:
			if $anim.assigned_animation != "open":
				$anim.play("open")
		# check if 'area' is not overlapping with 'Player'; close if no overlap
		elif !$area.get_overlapping_bodies().has(Player):
			if $anim.assigned_animation != "close":
				$anim.play("close")
	# open if camera is not in door's grid position (so that you can always go back through a door you've opened)
	else:
		if $anim.assigned_animation != "open":
			$anim.play("open")
