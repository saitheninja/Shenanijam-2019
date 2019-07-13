extends Button

export(PackedScene) var scene_to_load

func _on_Button_pressed():
	get_tree().change_scene("res://Player/PlayerDeath.tscn")