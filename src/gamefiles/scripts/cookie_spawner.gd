extends Node3D

@onready var timer : Timer = $Timer
var cookie : PackedScene = preload("res://gamefiles/scenes/cookie.tscn")
@export var scatterAmount : int = 16
var i = 0

func _ready() -> void:
	while i < scatterAmount:
		var x = randi_range(-128, 128)
		var z = randi_range(-128, 128)
		var ci = cookie.instantiate()
		ci.position = Vector3(x, 1, z)
		add_child(ci)
		i += 1

func _on_timer_timeout() -> void:
	while i < scatterAmount:
		var x = randi_range(-128, 128)
		var z = randi_range(-128, 128)
		var ci = cookie.instantiate()
		ci.position = Vector3(x, 1, z)
		add_child(ci)
		i += 1
	timer.start()
