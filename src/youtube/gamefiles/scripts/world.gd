extends Node3D

@onready var timer : Timer = $Timer
@onready var score : Label = $Label
var s : int = 0

func _physics_process(delta: float) -> void:
	get_tree().call_group("cloud", "updatePos", $player.global_position)
	get_tree().call_group("cloud", "lookAt", $player)
	if s >= 100:
		get_tree().call_group("cloud", "despawn")

func timerStart():
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().call_group("player", "decSpeed")

func incScore():
	if $player/dom.visible == true:
		s+=1
	score.text = str("🍪Cookies: "+str(s))
