extends TextureButton

@export var description : String
@onready var tooltip2: CanvasLayer = $Tooltip2
var mousePos = Vector2(0,0)
var isInside = false
var offsetY = 10

func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	
func _on_mouse_entered():
	isInside = true
	tooltip2.add_text(description,self.name)
	
func _on_mouse_exited():
	isInside = false
	tooltip2.hide_container()
	
func _process(delta: float) -> void:
	mousePos = get_global_mouse_position()
	if mousePos.y > 105 :
		offsetY = -80
	else :
		offsetY = 5
	if isInside:
		tooltip2.transform.origin = mousePos + Vector2(10,offsetY)
