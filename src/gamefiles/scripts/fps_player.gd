# Script Written By MD Mushfique Farhan Nabir For Orthos Studios
extends CharacterBody3D

# Scene Variables
@onready var walkSound : AudioStreamPlayer3D = $walkSound
@onready var body : CollisionShape3D = $CollisionShape3D
@onready var playerHead : Node3D = $head
@onready var normalCam : Camera3D = $head/Camera3D
@onready var ray : RayCast3D = $head/RayCast3D
@export var playerSpeed : float = 5.0

# Script Variables
var axisTypeStatus
var axisType
var maxTouchIgnore : int = 512
var lerpSpeed : float = 10.0
var direction = Vector3.ZERO
var gravity : float = 9.8
const mouseSensitivity : float = 0.25

# Ready function
func _ready() -> void:
	# Set mouse mode
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# Mouse Input Code
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if axisTypeStatus == 0:
			axisType = event.position.z
		else:
			axisType = event.position.x
		if axisType > maxTouchIgnore:
			rotate_y(deg_to_rad(-event.relative.x * mouseSensitivity))
			playerHead.rotate_x(deg_to_rad(-event.relative.y * mouseSensitivity))
			playerHead.rotation.x = clamp(playerHead.rotation.x, deg_to_rad(-44), deg_to_rad(44))

# Game Loop
func _physics_process(delta: float) -> void:
	# Player Sound Logic
	if Input.is_action_just_pressed("moveUp"):
		walkSound.play()
	elif Input.is_action_just_released("moveUp"):
		walkSound.stop()
	# Player Controller
	if not is_on_floor():
		velocity.y -= gravity * delta
	var input_dir = Input.get_vector("moveLeft", "moveRight", "moveUp", "moveDown")
	direction = lerp(direction, (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized(), delta * lerpSpeed)
	if direction:
		velocity.x = direction.x * playerSpeed
		velocity.z = direction.z * playerSpeed
	else:
		velocity.x = move_toward(velocity.x, 0, playerSpeed)
		velocity.z = move_toward(velocity.z, 0, playerSpeed)
	move_and_slide()


func incSpeed():
	if $dom.visible == true:
		playerSpeed = 10.0

func decSpeed():
	playerSpeed = 5.0
