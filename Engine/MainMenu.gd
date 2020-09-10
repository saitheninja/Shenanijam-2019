extends Control

func _ready():
	$Menu/Buttons/NewGameButton.grab_focus()
	$Menu/Buttons/NewGameButton.connect("pressed",self,"on_NewGameButton_pressed")

func on_NewGameButton_pressed():
	$FadeIn.show()
	$FadeIn.fade_in()

func _on_FadeIn_fade_finished():
	get_tree().change_scene("res://Levels/1Entry.tscn")
