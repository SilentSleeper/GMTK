extends Button

func _pressed() -> void:
	# A secondary "Are you sure?" menu would probably do well.
	get_tree().quit()
