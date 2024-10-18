extends Node3D

@onready var timer : Timer = $Timer

func _physics_process(delta: float) -> void:
	get_tree().call_group("cloud", "updatePos", $player.global_position)
func timerStart():
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().call_group("player", "decSpeed")
