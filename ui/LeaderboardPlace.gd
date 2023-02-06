extends HBoxContainer

onready var number: String
onready var player_name: String
onready var score: String
onready var time: String

func _ready():
	$Number.text = number
	$Name.text = player_name
	$Score.text = score
	$Time.text = time
