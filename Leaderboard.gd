extends Control

onready var list := $BG/MainWindow/MainBG/MarginContainer/MainVBox/PlaceListScroll/PlaceList
onready var loading_window := $BG/LoadingWindow
onready var main_window := $BG/MainWindow
onready var hide_button := $BG/HideButton

var place_spot_scene := load("res://LeaderboardPlace.tscn")


func _on_loaded_scores():
	loading_window.hide()
	main_window.show()
	hide_button.show()


func clear_list():
	for place in list.get_children():
		if place is HBoxContainer:
			list.remove_child(place)
			place.queue_free()


func populate_list(top_scores: Array):
	clear_list()
	var place_number = 1
	for place in top_scores:
		var place_spot = place_spot_scene.instance()
		place_spot.number = place_number
		place_spot.player_name = place["player_name"]
		place_spot.score = format_score(String(place["score"]))
		place_spot.time = get_time_difference(place["timestamp"] / 1000) 
		list.add_child(place_spot)
		place_number += 1


func get_time_difference(timestamp):
	var current_time = Time.get_datetime_dict_from_unix_time(OS.get_system_time_secs())
	var timestamp_time = Time.get_datetime_dict_from_unix_time(timestamp)
	
	var time_string = ""
	
	if current_time["year"] != timestamp_time["year"]:
		var diff = current_time["year"] - timestamp_time["year"]
		diff = abs(diff)
		time_string += String(diff)
		if diff > 1:
			time_string += " years "
		else:
			time_string += " year "
		time_string += "ago"
		return time_string
	
	if current_time["month"] != timestamp_time["month"]:
		var diff = current_time["month"] - timestamp_time["month"]
		diff = abs(diff)
		time_string += String(diff)
		if diff > 1:
			time_string += " months "
		else:
			time_string += " month "
		time_string += "ago"
		return time_string
	
	if current_time["day"] != timestamp_time["day"]:
		var diff = current_time["day"] - timestamp_time["day"]
		diff = abs(diff)
		time_string += String(diff)
		if diff > 1:
			time_string += " days "
		else:
			time_string += " day "
		time_string += "ago"
		return time_string
	
	if current_time["hour"] != timestamp_time["hour"]:
		var diff = current_time["hour"] - timestamp_time["hour"]
		diff = abs(diff)
		time_string += String(diff)
		if diff > 1:
			time_string += " hours "
		else:
			time_string += " hour "
		time_string += "ago"
		return time_string
	
	if current_time["minute"] != timestamp_time["minute"]:
		var diff = current_time["minute"] - timestamp_time["minute"]
		diff = abs(diff)
		time_string += String(diff)
		if diff > 1:
			time_string += " minutes "
		else:
			time_string += " minute "
		time_string += "ago"
		return time_string
	
	if current_time["second"] != timestamp_time["second"]:
		var diff = current_time["second"] - timestamp_time["second"]
		diff = abs(diff)
		time_string += String(diff)
		if diff > 1:
			time_string += " seconds "
		else:
			time_string += " second "
		time_string += "ago"
		return time_string
	
	return time_string


func format_score(score: String):
	var i := score.length() - 3
	while i > 0:
		score = score.insert(i, ",")
		i = i - 3
	return score


func toggle_buttons(activate):
	var button_box = $BG/MainWindow/MainBG/MarginContainer/MainVBox/HBoxContainer/ButtonBox
	for button in button_box.get_children():
		button.disabled = !activate


func _on_Day_pressed():
	toggle_buttons(false)
	yield(SilentWolf.Scores.get_high_scores(20, "day"), "sw_scores_received")
	var day: Array = SilentWolf.Scores.scores
	populate_list(day)
	toggle_buttons(true)


func _on_Week_pressed():
	toggle_buttons(false)
	yield(SilentWolf.Scores.get_high_scores(20, "week"), "sw_scores_received")
	var week: Array = SilentWolf.Scores.scores
	populate_list(week)
	toggle_buttons(true)


func _on_Month_pressed():
	toggle_buttons(false)
	yield(SilentWolf.Scores.get_high_scores(20, "month"), "sw_scores_received")
	var month: Array = SilentWolf.Scores.scores
	populate_list(month)
	toggle_buttons(true)


func _on_All_pressed():
	toggle_buttons(false)
	yield(SilentWolf.Scores.get_high_scores(20), "sw_scores_received")
	var all: Array = SilentWolf.Scores.scores
	populate_list(all)
	toggle_buttons(true)


func _on_HideButton_pressed():
	hide()
	loading_window.show()
	main_window.hide()
	hide_button.hide()
