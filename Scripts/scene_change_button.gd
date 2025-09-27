extends Button
## Intended for use in menus as a scene changer.

@export_file("*.tscn") var targetScene = "<Select target>"

func _pressed() -> void:
	get_tree().change_scene_to_file(targetScene)
	var pckdScn = load(targetScene).instantiate() 
	Player.locationStack.append(pckdScn)
	
	#FIXME: Chestia asta fie ar trebui sa fie standardul, si sa fie
	#integrata in codul pentru location_clickable.change_scene(),
	#fie sa nu existe.
