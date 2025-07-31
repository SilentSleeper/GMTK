extends Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var targetScene: String

func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	input_event.connect(_input_event)
	
func _on_mouse_entered():
	animation_player.play("scaleAnim")

func _on_mouse_exited():
	animation_player.play_backwards("scaleAnim")
	
func change_scene(target: String, viewport: Node):
	viewport.get_tree().change_scene_to_file(targetScene)

func _input_event(viewport: Node, event: InputEvent, _shape_idx: int):
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				change_scene(targetScene, viewport)
