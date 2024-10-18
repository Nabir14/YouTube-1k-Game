extends Node3D

@onready var timer : Timer = $Timer
var cookie : PackedScene = preload("res://gamefiles/scenes/cookie.tscn")
@export var scatterAmount : int = 16

func _ready() -> void:
	spawn()

func _on_timer_timeout() -> void:
	spawn()
	timer.start()

func spawn():
	var i : int = 0
	while i < scatterAmount:
		var x = randi_range(-128, 128)
		var z = randi_range(-128, 128)
		var ci = cookie.instantiate()
		ci.position = Vector3(x, 1, z)
		add_child(ci)
		i += 1
