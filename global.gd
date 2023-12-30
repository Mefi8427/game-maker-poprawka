extends Node2D
var LeftPressed
var RightPressed
var RPressed
var random = RandomNumberGenerator.new()
var x 
var y
var game_over = 0
@onready var Pomni = get_node("/root/Node2D/pomni")
var score = 0
@onready var scoreLabel = get_node("root/Node2D/scoreLabel")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	movement()
	restart()
	player_score()
	
	
func player_score():
	if game_over == 1:
		return
	scoreLabel.text = str(score)
	
	



func movement():
	if game_over == 1:
		return
	LeftPressed = int(Input.is_action_just_pressed("left"))
	RightPressed = int(Input.is_action_just_pressed("right"))
	
	if LeftPressed == 1:
		Pomni.position.x = 468
	elif RightPressed == 1:
		Pomni.position.x = 681
		
func restart():
	RPressed = int(Input.is_action_just_pressed("restart"))
	
	if RPressed == 1:
		get_tree().reload_current_scene()

	
		
