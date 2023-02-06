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
