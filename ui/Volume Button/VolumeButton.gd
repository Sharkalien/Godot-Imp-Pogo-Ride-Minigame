extends Button

var clicks : int = 0


func _on_Button_pressed():
	clicks += 1
	
	if clicks >= 4:
		clicks = 0
	
	$Sprite.set_frame(clicks)
	Autoload.volumeClicks = clicks
#	print(clicks)
