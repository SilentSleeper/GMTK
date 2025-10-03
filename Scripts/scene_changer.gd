extends Node
class_name SceneChanger

## Accepts both file paths and packed scenes.
func change_scene(target: Variant, viewport: Node) -> void:
	if(target is String):
		var err = viewport.get_tree().change_scene_to_file(target)
		assert(err != ERR_CANT_OPEN, "Target file cannot be loaded into a PackedScene")
		assert(err != ERR_CANT_CREATE, "Target scene file cannot be instantiated")
		Player.locationStack.append(load(target))
		
	elif(target is PackedScene):
		viewport.get_tree().change_scene_to_packed(target)
		Player.locationStack.append(target)
	print(Player.locationStack)
