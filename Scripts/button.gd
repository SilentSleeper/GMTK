extends Button
@onready var pauseMenu: CanvasLayer = $"../../.."
@export_enum("Resume", "Back", "Cancel") var buttonType = 0

func _pressed() -> void:
	match buttonType:
		0:
			pauseMenu.hide()
