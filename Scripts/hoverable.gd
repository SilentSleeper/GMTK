extends Area2D

@export var description : String
@onready var tooltip2: CanvasLayer = $Tooltip2
#@onready var tooltip: CanvasLayer = $tooltip
var mousePos = Vector2(0,0)
var isInside = false
var offsetY = 5

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
	if mousePos.y > 90 :
		offsetY = -70
	else :
		offsetY = 5
	if isInside:
		tooltip2.transform.origin = mousePos + Vector2(5,offsetY)
