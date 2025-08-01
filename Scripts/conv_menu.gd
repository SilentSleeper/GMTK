extends Node2D
@onready var richTextLabel: RichTextLabel = $RichTextLabel
@onready var vBoxContainer: VBoxContainer = $VBoxContainer
@export_file var TargetCharacter = "<Select target>"
var IsTalking: bool

# visibility needs to be applied in ready and process, to make sure text doesn't flash on
# screen during scene change.
# this can be alleviated using a transition screen, at which point
# the ready function should be removed.

func _ready() -> void:
	richTextLabel.visible = IsTalking
	vBoxContainer.visible = not IsTalking
	
func _process(delta: float) -> void:
	richTextLabel.visible = IsTalking
	vBoxContainer.visible = not IsTalking
