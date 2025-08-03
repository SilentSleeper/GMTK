extends CanvasLayer

func _ready() -> void:
	self.visible=false

func toggleVisibility():
	if self.visible == false :
		self.visible = true
		get_tree().paused = true
	else:
		self.visible = false
		get_tree().paused = false

#func _unhandled_key_input(event: InputEvent) -> void:
	#if event is InputEventKey and event.is_pressed():
		#match event.keycode:
			#KEY_ESCAPE:
				#toggleVisibility()
				#get_viewport().set_input_as_handled()
				
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ShowPauseMenu"):
		toggleVisibility()
