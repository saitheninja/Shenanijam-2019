extends Node2D

func _ready():
	get_node("RestartButton").connect("pressed",self,"on_RestartButton_pressed")

func _on_RestartButton_pressed():
	get_tree().change_scene("res://Levels/1Entry.tscn")