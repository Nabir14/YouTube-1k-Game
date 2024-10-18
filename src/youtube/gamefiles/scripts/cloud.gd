extends CharacterBody3D

@onready var agent : NavigationAgent3D = $NavigationAgent3D
@export var speed : int = 6

func _physics_process(delta: float) -> void:
	var currentLocation = global_transform.origin
	var nextLocation = agent.get_next_path_position()
	var vel = (nextLocation - currentLocation).normalized() * speed
	velocity = vel
	move_and_slide()

func updatePos(targetLocation):
	agent.target_position = targetLocation

func lookAt(player):
	look_at(Vector3(player.global_position.x, global_position.y, player.global_position.z), Vector3.UP)

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		get_tree().quit()
