extends Node2D

var combos := ["COMBO!", "WOAH!", "OH SNAP!", "AWESOME!", "WHAAA?!", "NICE!", "SICK", "SHIT IS BANANAS", "DELIRIOUS", "OH NO HE DIDN'T", "DAMN SON", "PRETTY ALRIGHT", "UNBE-FUCKING-LIEVABLE"]
var color : Color = Color(randf(), randf(), randf(), 1.0)


func _ready():
	$Combo.text = combos[randi() % combos.size()]
	$Combo.set("custom_colors/font_color", color)

func _process(_delta):
	if Autoload.combos > 50:
		$Combo.set("custom_colors/font_color", Color(randf(), randf(), randf(), 1.0))
