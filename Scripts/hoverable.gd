extends Area2D

@export var description : String

func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	
func _on_mouse_entered():
	print("You have put the mouse on" + description)
	
func _on_mouse_exited():
	print("You have moved the mouse from" + description)
