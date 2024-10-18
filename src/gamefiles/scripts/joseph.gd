extends Node3D

@onready var text : Label3D = $Label3D
@onready var timer : Timer = $Timer

var q1 : String = "Hey you look cool :)"
var q2 : String = "Feed the duck to get Speed Boost!"
var q3 : String = "T H E C L O U D I S C O M I N G"
var q4 : String = "oil up lil bro"
var q5 : String = "There is a map limit. If you can reach it you'll have infinite Aura."

func _on_timer_timeout() -> void:
	var rn : int = randi_range(1, 5)
	if rn == 1:
		text.text = q1
	elif rn == 2:
		text.text = q2
	elif rn == 3:
		text.text = q3
	elif rn == 4:
		text.text = q4
	elif rn == 5:
		text.text = q5
	timer.start()
