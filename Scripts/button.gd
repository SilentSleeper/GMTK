extends Button
# intended for use in menus as a scene changer.

@export_file("*.tscn") var targetScene = "<Select target>"

func _pressed() -> void:
	get_tree().change_scene_to_file(targetScene)
