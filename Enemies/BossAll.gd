extends Area2D

var texture_default
var texture_hurt

func _ready():
	if $Sprite.texture != null:
		texture_default = $Sprite.texture
		texture_hurt = load($Sprite.texture.get_path().replace(".png","_hurt.png"))
