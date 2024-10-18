extends Node3D

var spinSpeed : int = 3.0

func _physics_process(delta: float) -> void:
	self.rotation.y += spinSpeed * delta

func _on_area_3d_body_entered(body: Node3D) -> void:
	$"../player/dom".visible = true
	self.queue_free()
