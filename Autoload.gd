extends Node

var color
var combos 
var volumeClicks : int
var player : String = "Player"


func _ready():
	var f = File.new()
	f.open('res://apiKey.env',File.READ)
	var apiKey = f.get_line()
	f.close()

	SilentWolf.configure({
	"api_key": apiKey,
	"game_id": "ImpPogoRide",
	"game_version": "1.0",
	"log_level": 0
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
