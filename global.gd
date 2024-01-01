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
@onready var pauseMenu = get_node("/root/Node2D/pasu_menu")
var pasek = 0
var WASD = "W"
var SpecialMove = 1
var wPressed = 0
var aPressed = 0
var sPressed = 0
var dPressed = 0
@onready var wasd = get_node("/root/Node2D/wasd")
var left = 0
var right = 0
var SP1 = 0
var SP2 = 0
@onready var PomniAnimationPlayer = get_node("/root/Node2D/pomni/AnimationPlayer")
@onready var PomniAudioPlayer = get_node("/root/Node2D/pomni/AudioStreamPlayer2D")
@onready var PomniDeathPlayer = get_node("/root/Node2D/pomni/AudioDeath")
var hit_death
var disappear = 0
var help = 0
var yandev = 0




func HitDeathSFX():
	if hit_death == 1 and PomniDeathPlayer.is_playing() == false:
		PomniDeathPlayer.play()
		
		
	
func menu():
	if int(Input.is_action_just_pressed("pause")) == 1:
		pauseMenu.show()
		pasek = 1
		print("chuj")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	movement()
	restart()
	player_score()
	progress_bar()
	menu()	
	special_move()
	
	
	
func special_move():
	wasd.text = str(WASD)
	if game_over == 1:
		return 
	if wPressed == 1 or aPressed == 1 or sPressed == 1 or dPressed == 1:
		help = 1
		PomniAudioPlayer.play()
		SpecialMove = random.randi_range(1,4)
		if SpecialMove == 1:
			WASD = "W"
		if SpecialMove == 2:
			WASD = "A"
		if SpecialMove == 3:
			WASD = "S"
		if SpecialMove == 4:
			WASD = "D"
	

func wait(duration):  
	await(get_tree().create_timer(duration).timeout)
		
func player_score():
	if game_over == 1:
		return
	scoreLabel.text = str(score)
	if LeftPressed == 1 or RightPressed == 1:
		score += 1
		BarItself.value += 1.5
		
		
func progress_bar():

	if pasek == 0:
		return
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
		PomniAnimationPlayer.play("timeout_death")
		game_over = 1
		await(wait(60))
	
	



func movement():
	if game_over == 1:
		return
	LeftPressed = int(Input.is_action_just_pressed("left"))
	RightPressed = int(Input.is_action_just_pressed("right"))
	
	if LeftPressed == 1:
		PomniAudioPlayer.play()
		Pomni.position.x = 468
		PomniAnimationPlayer.play("jump_left")
		await(wait(0.2))
		PomniAnimationPlayer.play("idle")
		if yandev == 0:
			yandev = 1
		elif yandev == 1:
			yandev = 0 
			help = 0
		
		
	elif RightPressed == 1:
		PomniAudioPlayer.play()
		Pomni.position.x = 681
		PomniAnimationPlayer.play("jump_right")
		await(wait(0.2))
		PomniAnimationPlayer.play("idle")
		if yandev == 0:
			yandev = 1
		elif yandev == 1:
			yandev = 0
			help = 0
		

		
		

func restart():
	RPressed = int(Input.is_action_just_pressed("restart"))
	if RPressed == 1:
		PomniAnimationPlayer.play("idle")
		game_over = 0
		BarItself.value = 100
		score = 0
		disappear = 1
	

