extends Control

onready var animPlayer = get_node("CenterContainer/Body_NinePatchRect/AnimationPlayer")
onready var rootNode = get_node(".")
onready var mainGame = get_tree().get_root().get_node("Game")
onready var scoreLabel = get_node("CenterContainer/Body_NinePatchRect/MarginContainer/RichTextLabel")
onready var playerName = get_node("PlayerName")
var leaderboard = null

func _ready():
	scoreLabel.text = "Your current high score is: " + str(mainGame.highScore) + ". Would you like to submit?"
	playerName.text = Autoload.player
	leaderboard = mainGame.get_node("HUD").get_node("Leaderboard")
	leaderboard.connect("hide", self, "restart_game")
#	print(get_tree().get_root())
#	print(get_tree().get_root().get_node("Game").get("score"))


func _on_Skip_pressed():
	animPlayer.play_backwards("Open")
	yield(get_tree().create_timer(0.17), "timeout")
	rootNode.visible = false
	restart_game()


func _on_Submit_pressed():
	animPlayer.play_backwards("Open")
	yield(get_tree().create_timer(0.17), "timeout")
	rootNode.visible = false
	leaderboard.show()
	
	# Leaderboard stuff here
	SilentWolf.Scores.persist_score(playerName.text, mainGame.score)
	yield(SilentWolf.Scores, "sw_score_posted")
	SilentWolf.Scores.persist_score(playerName.text, mainGame.score, "day")
	yield(SilentWolf.Scores, "sw_score_posted")
	SilentWolf.Scores.persist_score(playerName.text, mainGame.score, "week")
	yield(SilentWolf.Scores, "sw_score_posted")
	SilentWolf.Scores.persist_score(playerName.text, mainGame.score, "month")
	yield(SilentWolf.Scores, "sw_score_posted")
	
	leaderboard._on_All_pressed()
	leaderboard._on_loaded_scores()


func restart_game():
	mainGame.get_node("GiddyUp").visible = true
	if mainGame.score > 0:
		mainGame.score = 0
