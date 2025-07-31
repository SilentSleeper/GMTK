extends Button
# intended for use in menus as a scene changer.

@export var TargetScene: String

func _pressed() -> void:
	get_tree().change_scene_to_file(TargetScene)
