extends Node


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
