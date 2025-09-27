extends Node2D
@onready var richTextLabel: RichTextLabel = $RichTextLabel
@onready var vBoxContainer: VBoxContainer = $VBoxContainer
@onready var animPlayer: AnimationPlayer = $AnimationPlayer
@onready var file_reader: FileReader = $FileReader
@export_file var TargetCharacter = "<Select target>"
@export_file var TargetDialogueFile = "<Select target>"
@export var dialogueSpeed = 25.0

var isTalking: bool
var Dialogue: PackedStringArray
var speechIndex = 0


func _ready() -> void:
	# visibility needs to be applied in ready and process, to make sure text doesn't flash on
	# screen during scene change.
	# this can be alleviated using a transition screen, at which point
	# the ready function visibility modifiers should be removed.
	richTextLabel.visible = isTalking
	vBoxContainer.visible = not isTalking
	
	Dialogue = file_reader.Load()
	assert(!Dialogue.is_empty(), "No dialogue was loaded!")

func Speak(content: PackedStringArray):
	if speechIndex >= content.size():
		return
	richTextLabel.text = content[speechIndex]
	animPlayer.speed_scale = dialogueSpeed / richTextLabel.text.length()
	
	if Input.is_action_just_pressed("Continue"):
		if animPlayer.is_playing(): 
			animPlayer.seek(animPlayer.get_animation(animPlayer.current_animation).length, true)
		else:
			animPlayer.play()
			speechIndex += 1
	
	# FIXME: Ultimul element de dialog apare de doua ori la rand
	
func _process(_delta: float) -> void:
	richTextLabel.visible = isTalking
	vBoxContainer.visible = not isTalking
	
	isTalking = true
	Speak(Dialogue)
