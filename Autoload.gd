extends Node

var color
var combos 
var volumeClicks : int
var player : String = "Player"


func _ready():
	# Getting the API Key from an environment variable instead of a text file
	var apiKey = OS.get_environment("SILENT_WOLF_476")

	SilentWolf.configure({
	"api_key": apiKey,
	"game_id": "ImpPogoRide",
	"game_version": "1.0",
	"log_level": 1
	})
	
	# Get username from MSPFA if the player is logged in (currently doesn't work :/)
#	JavaScript.eval("""
#	let playerName;
#	window.addEventListener("message", (event) => {
#		if (event.origin !== "https://mspfa.com") return;
#
#		playerName = event.data
#		console.log('Player name is: ' + playerName)
#		}, false);
#	""", true)
#	if JavaScript.eval("typeof playerName !== 'undefined'", true):
#		Autoload.player = JavaScript.eval("playerName", true)

#func _process(_delta):
#	print(str(combos) + " autoload")
