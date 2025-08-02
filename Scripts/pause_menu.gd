extends CanvasLayer

func _ready() -> void:
	self.visible=false

func toggleVisibility():
	if self.visible == false :
		self.visible = true
	else:
		self.visible = false

func _unhandled_key_input(event: InputEvent) -> void:
	if event is InputEventKey:
		match event.keycode:
			KEY_ESCAPE:
				toggleVisibility()
