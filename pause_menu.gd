extends Control





func _on_resume_pressed():
	Global.pasek = 1
	visible = false


func _on_quit_pressed():
	get_tree().quit()
