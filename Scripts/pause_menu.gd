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

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ShowPauseMenu"):
		toggleVisibility()
