extends Node3D

func _physics_process(delta: float) -> void:
	self.rotation.y += 3.0 * delta

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		get_tree().call_group("world", "incScore")
		get_tree().call_group("player", "incSpeed")
		get_tree().call_group("world", "timerStart")
		self.queue_free()
