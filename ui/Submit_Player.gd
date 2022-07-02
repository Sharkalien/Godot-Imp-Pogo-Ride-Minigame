extends Control

onready var animPlayer = get_node("CenterContainer/Body_NinePatchRect/AnimationPlayer")
onready var rootNode = get_node(".")
onready var mainGame = get_tree().get_root().get_node("Game")
onready var scoreLabel = get_node("CenterContainer/Body_NinePatchRect/MarginContainer/RichTextLabel")
onready var playerName = get_node("PlayerName")

func _ready():
	scoreLabel.text = "Your current high score is: " + str(mainGame.highScore) + ". Would you like to submit?"
	playerName.text = Autoload.player
#	print(get_tree().get_root())
#	print(get_tree().get_root().get_node("Game").get("score"))


func _on_Skip_pressed():
	animPlayer.play_backwards("Open")
	yield(get_tree().create_timer(0.17), "timeout")
	rootNode.visible = false
	mainGame.get_node("GiddyUp").visible = true
	if mainGame.score > 0:
		mainGame.score = 0
