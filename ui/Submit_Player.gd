extends Control

onready var animPlayer = get_node("CenterContainer/Body_NinePatchRect/AnimationPlayer")
onready var rootNode = get_node(".")

func _ready():
	pass 


func _on_Skip_pressed():
	animPlayer.play_backwards("Open")
	yield(get_tree().create_timer(0.17), "timeout")
	rootNode.visible = false
