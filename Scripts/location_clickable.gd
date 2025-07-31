extends Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	input_event.connect(_input_event)
func _on_mouse_entered():
	animation_player.play("scaleAnim")

func _on_mouse_exited():
	animation_player.play_backwards("scaleAnim")

func _input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				print("Left mouse button")
			MOUSE_BUTTON_WHEEL_UP:
				print("Scroll wheel up")
			MOUSE_BUTTON_WHEEL_DOWN:
				print("Scroll wheel down")
