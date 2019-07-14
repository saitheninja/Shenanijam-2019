extends Area2D

onready var Player = get_node("../Player")

func _ready():
	self.connect("body_entered",self,"_on_TheEnd_body_entered",[Player])
	print(Player)

func _on_TheEnd_body_entered(body):
	get_tree().change_scene("res://Levels/End.tscn")