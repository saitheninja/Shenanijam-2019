extends Control

func _ready():
	$gbmargin/Menu/Buttons/NewGameButton.grab_focus()
# warning-ignore:return_value_discarded
	$gbmargin/Menu/Buttons/NewGameButton.connect("pressed",self,"on_NewGameButton_pressed")

func on_NewGameButton_pressed():
	$gbmargin/FadeIn.show()
	$gbmargin/FadeIn.fade_in()

func _on_FadeIn_fade_finished():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Levels/1Entry.tscn")
