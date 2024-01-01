extends Camera2D

@export var randomStrength: float = 30.0
@export var shakeFade: float = 5.0
var rng = RandomNumberGenerator.new()

var shake_strength: float = 0.0
@onready var Camera = get_node("/root/Node2D/Camera2D")
var fix = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func apply_shake():
	shake_strength = randomStrength
	
func wait(duration):  
	await(get_tree().create_timer(duration).timeout)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if fix == 1:
		return
	if Global.hit_death == 1:
		apply_shake()
		await(wait(0.3))
		fix = 1
		

	if shake_strength > 0:
		shake_strength = lerpf(shake_strength, 0, shakeFade * delta)

		offset = randomOffset()

		# Apply the offset to the camera
		Camera.offset = offset

func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength, shake_strength), rng.randf_range(-shake_strength, shake_strength))
