extends Sprite2D
var random = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	death()
	movement()
	going_back()
	fix()
	
	
	
func movement():
	if Global.game_over == 1:
		return
	elif Global.RightPressed == 1 or Global.LeftPressed == 1:
		position.y += 124
		
func death():
	if Global.Pomni.position.x == 468 and position == Vector2(482,621):
		Global.game_over = 1
	elif Global.Pomni.position.x == 681 and position == Vector2(657, 621):
		Global.game_over = 1
		
func going_back():
	if Global.game_over == 1:
		return
	var d2 = random.randi_range(1,2)
	var d5 = random.randi_range(1,5)
	if position.y >= 745:
		if d2 == 1:
			Global.x = 482
		elif d2 == 2:
			Global.x = 657
		position.x = Global.x
		
		if d5 == 1 or d5 == 2:
			Global.y = 125
		elif d5 == 3 or d5 == 4:
			Global.y = 1
		else:
			Global.y = -123
		position.y = Global.y
		
func fix():
	if Global.Pomni.position.x == 681 and position == Vector2(482,621) or Global.Pomni.position.x == 468 and position == Vector2(657, 621):
		var d2 = random.randi_range(1,2)
		var d5 = random.randi_range(1,5)
		if d2 == 1:
			Global.x = 482
		elif d2 == 2:
			Global.x = 657
		position.x = Global.x
			
		if d5 == 1 or d5 == 2:
			Global.y = 125
		elif d5 == 3 or d5 == 4:
			Global.y = 1
		else:
			Global.y = -123
		position.y = Global.y
		

	


func _on_test_pressed():
	print("chuj")
