extends Control

func _ready():
	$GBCenter/Menu/Buttons/RestartButton.grab_focus()
# warning-ignore:return_value_discarded
	$GBCenter/Menu/Buttons/RestartButton.connect("pressed",self,"_on_RestartButton_pressed")

func _on_RestartButton_pressed():
	$GBCenter/FadeIn.show()
	$GBCenter/FadeIn.fade_in()

func _on_FadeIn_fade_finished():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Levels/1Entry.tscn")
