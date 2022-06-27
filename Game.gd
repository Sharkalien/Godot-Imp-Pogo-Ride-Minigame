extends Node2D

onready var pogo : Sprite = get_node("Ride/ImpPogo")
onready var spring : Sprite = get_node("Ride/PogoSpring")
onready var pianoImp : AnimatedSprite = get_node("ImpPiano")
onready var boy := get_node("Boy")
onready var ride2 := get_node("Ride2") # i don't think this node is actually necessary
onready var ride := get_node("Ride")
onready var music := get_node("Harlequin ROCK")
onready var timeLeft := $TimeLeft
onready var scorer := $Score
onready var sound : AudioStreamPlayer = $"Harlequin ROCK"

var comb = load("res://Combo.tscn")
var dialogbox = load("res://ui/Dialog Box/Dialog_Player.tscn").instance()
var submitbox = load("res://ui/Submit_Player.tscn").instance()

var player : String = "Player"
var rot = 0
var vel = 0
var yVel = 0
var pogoScale = 0
var side = 1
var combos = 0
var delay = 0
var score = 0
var dispScore = 0
var started = false
var time
var highScore : int = 0


func _process(_delta):
	Autoload.combos = combos
	toggleSound()
	timeLeft.text = "Time " + str(int($Timer.time_left))
	if int($Timer.time_left) > 0:
		if Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_right"):
			vel = rot * 0.4
		if Input.is_action_just_released("ui_up") or Input.is_action_just_released("ui_down"):
			yVel = pogoScale * 0.5
		
		if Input.is_action_pressed("ui_left"):
			rot += 7
		elif Input.is_action_pressed("ui_right"):
			rot -= 7
		if Input.is_action_pressed("ui_up"):
			pogoScale -= 0.1
		elif Input.is_action_pressed("ui_down"):
			pogoScale += 0.1
	elif timeLeft.text != "End!":
		timeLeft.text = "End!"
#		final()
	
	yVel = yVel + pogoScale * 0.9
	pogoScale -= yVel
	vel = vel + rot * 0.5
	rot -= vel
	rot = rot * 0.7
	spring.rotation_degrees = rot
	ride.rotation_degrees = rot * 1.6
#	ride2.rotation_degrees = ride.rotation_degrees
	boy.rotation_degrees = rot * 2
	pogoScale *= 0.6
	spring.scale.y = pogoScale + 1
	boy.scale.y = spring.scale.y
	ride.scale.y = boy.scale.y
#	ride2.scale.y = ride.scale.y
	
	if rot * side > 20:
		combos += 1
		side *= -1
		print("combos: ", combos)
		#more code goes here
		var tempMc = comb.instance()
		add_child(tempMc)
		tempMc.position.x = randf() * get_viewport_rect().size.x / 1.5
		tempMc.position.y = randf() * get_viewport_rect().size.y
		delay = 30
		score += combos * (50 + randf() * 10)
	delay -= 1
	if delay < 0:
		combos = 0
	
	dispScore += score - dispScore #/ 10
	scorer.text = str(int(round(dispScore)))
	while scorer.text.length() < 9:
		scorer.text = "0" + scorer.text

func _on_GiddyUp_pressed():
	if not started:
		started = true
		pianoImp.playing = true
		music.playing = true
	$GiddyUp.visible = false
	$Timer.start()

func final():
	if highScore < score:
		highScore = score
	var hud = get_node("HUD")
	if not hud.has_node("SubmitBox"):
		hud.add_child(submitbox)
	dialogbox.get_node("CenterContainer/Body_NinePatchRect/AnimationPlayer").play("Open")


func _on_Controls_pressed():
	var hud = get_node("HUD")
	if not hud.has_node("DialogBox"):
		hud.add_child(dialogbox)
		$HUD/Controls/ClickHere.visible = false
	elif hud.has_node("DialogBox") and not dialogbox.visible:
		dialogbox.visible = true
	dialogbox.get_node("CenterContainer/Body_NinePatchRect/AnimationPlayer").play("Open")

func toggleSound():
	match Autoload.volumeClicks:
		0:
			sound.volume_db = linear2db(1)
		1:
			sound.volume_db = linear2db(0.6)
		2:
			sound.volume_db = linear2db(0.2)
		3:
			sound.volume_db = linear2db(0)
