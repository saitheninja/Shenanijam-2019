extends "res://Engine/entity.gd"

const DAMAGE = 0.5

func _ready():
	$anim.play("wiggle")
	movedir = dir.rand()
	if $Sprite.texture != null:
		texture_default = $Sprite.texture
		texture_hurt = load($Sprite.texture.get_path().replace(".png","_hurt.png"))

func _physics_process(delta):
	damage_loop()
