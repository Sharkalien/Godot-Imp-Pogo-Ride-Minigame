extends Control

onready var animPlayer = get_node("CenterContainer/Body_NinePatchRect/AnimationPlayer")
onready var rootNode = get_node(".")


func _on_DialogBox_gui_input(_event):
	if Input.is_action_pressed("click"):
		animPlayer.play_backwards("Open")
		rootNode.visible = false
