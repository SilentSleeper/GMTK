extends Control

func _ready() -> void:
	hide()

func toggleVisibility():
	show() if hidden else hide()

func _unhandled_key_input(event: InputEvent) -> void:
	if event is InputEventKey:
		match event.keycode:
			KEY_ESCAPE:
				toggleVisibility()
