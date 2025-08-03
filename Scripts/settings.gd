extends TextureButton
@onready var pause_menu: CanvasLayer = $Pause_menu

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				pause_menu.visible = true
				get_tree().paused = true
