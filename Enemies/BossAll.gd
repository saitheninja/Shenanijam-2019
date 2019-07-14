extends Area2D

func _ready():
	if $Sprite.texture != null: 
		texture_default = $Sprite.texture
		texture_hurt = load($Sprite.texture.get_path().replace(".png","_hurt.png")