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
@onready var scoreLabel = get_node("/root/Node2D/scoreLabel")
@onready var BarItself = get_node("/root/Node2D/TextureProgressBar")
var bar_negative = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	movement()
	restart()
	player_score()
	progress_bar()
	print(bar_negative)
	
	
func player_score():
	if game_over == 1:
		return
	scoreLabel.text = str(score)
	if LeftPressed == 1 or RightPressed == 1:
		score += 1
		BarItself.value += 1.5
		
		
func progress_bar():
	if game_over == 1:
		return
	bar_negative = float(score * 0.005)
	if bar_negative < 0.055:
		bar_negative = 0.06
	if score > 40:
		bar_negative = 0.1
	if score > 50:
		bar_negative = 0.15
	if score > 60:
		bar_negative = 0.2
	if score > 70:
		bar_negative = 0.25
	if score > 80:
		bar_negative = 0.3
	BarItself.value -= bar_negative
	if BarItself.value == 0:
		game_over = 1
	
	



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

	
		
