extends Control

func _ready():
	$Menu/Buttons/RestartButton.grab_focus()
	$Menu/Buttons/RestartButton.connect("pressed",self,"on_RestartButton_pressed")

func _on_RestartButton_pressed():
	$FadeIn.show()
	$FadeIn.fade_in()

func _on_FadeIn_fade_finished():
	get_tree().change_scene("res://Levels/1Entry.tscn")
