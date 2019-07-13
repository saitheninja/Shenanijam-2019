extends StaticBody2D

onready var Camera = get_node("../Camera")
onready var Player = get_node("../Player")

func _ready():
    $anim.play("open")

func _process(delta):
    # make sure that doors are always open becuase then we won't walk up to it on the wrong side and not be able to get through
	# if you've already opened it from one side
	if Camera.grid_pos == Camera.get_grid_pos(global_position):
		if Camera.get_enemies() == 0:
			if $anim.assigned_animation != "open":
				$anim.play("open")
		# check if player is standing in the way
		elif !$area.get_overlapping_bodies().has(Player):
			if $anim.assigned_animation != "close":
                $anim.play("close")
	else:
		if $anim.assigned_animation != "open":
            $anim.play("open")