extends Area2D
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
@export var description : String
@onready var textBox: CanvasLayer = $Text_Box
@export_file("*.tscn") var targetScene = "<Select target>"
var cursorLocation = "down" # bottom quarter of the screen or not
var isInside = false
func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	input_event.connect(_input_event)
	
func _on_mouse_entered():
	animationPlayer.play("scaleAnim")
	textBox.add_text(description)
	isInside = true
	
func _on_mouse_exited():
	animationPlayer.play_backwards("scaleAnim")
	textBox.hide_container()
	move_down()
	isInside = false
	
func change_scene(target: String, viewport: Node):
	viewport.get_tree().change_scene_to_file(target)

func _input_event(viewport: Node, event: InputEvent, _shape_idx: int):
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				change_scene(targetScene, viewport)

func move_down():
	textBox.transform.origin = Vector2(0, -5)
	cursorLocation = "down"
	
func move_up():
	textBox.transform.origin = Vector2(0, -150)
	cursorLocation = "up"
	
func _process(delta: float) -> void:
	var screenQuarter = get_viewport().get_visible_rect().size.y / 4
	var mousePos = get_global_mouse_position()
	if isInside:
		if(mousePos.y < screenQuarter and cursorLocation == "up"):
			move_down()
		elif(mousePos.y >= 3 * screenQuarter and cursorLocation == "down"):
			move_up()
