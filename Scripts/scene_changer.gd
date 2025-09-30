extends Node
class_name Scene_changer

## Accepts both file paths and packed scenes.
func change_scene(target: Variant, viewport: Node) -> void:
	if(target is String):
		viewport.get_tree().change_scene_to_file(target)
		Player.locationStack.append(load(target))
	elif(target is PackedScene):
		viewport.get_tree().change_scene_to_packed(target)
		Player.locationStack.append(target)
	else: return
	print(Player.locationStack)
