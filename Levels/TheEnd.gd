extends Area2D

onready var Player = get_node("../Player")

func _ready():
# warning-ignore:return_value_discarded
	self.connect("body_entered",self,"_on_TheEnd_body_entered")

func _on_TheEnd_body_entered(_body):
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Levels/End.tscn")
