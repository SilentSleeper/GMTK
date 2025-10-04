extends Node2D
@onready var richTextLabel: RichTextLabel = $RichTextLabel
@onready var vBoxContainer: VBoxContainer = $VBoxContainer
@onready var animPlayer: AnimationPlayer = $AnimationPlayer
@onready var fileReader: FileReader = $FileReader
@export_file var TargetCharacter = "<Select target>"
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
	var fileContent = fileReader.LoadJson()
	
	var characterName = fileReader.Extract(fileContent, "Name")
	if Global.metNPCs[characterName[0]] == false:
		# HACK: indexarea asta la 0 e goofy dar e necesara fiindca 
		# se returneaza un array in characterName
		Dialogue = fileReader.Extract(fileContent, "firstMeeting")
		
	Dialogue.append_array(fileReader.Extract(fileContent, "generic"))
	showNextLine(Dialogue)

# TODO: Implementeaza o modalitate de a extrage un singur string aleator din content
# in loc de a derula intregul array

func Speak(content: PackedStringArray):
	if Input.is_action_just_pressed("Continue"):
		if animPlayer.is_playing():
			# Jump to the end of the animation 
			animPlayer.seek(animPlayer.get_animation(animPlayer.current_animation).length, true)
		else: 
			showNextLine(content)

func showNextLine(content: PackedStringArray):
	if speechIndex >= content.size():
		return
	richTextLabel.text = content[speechIndex]
	animPlayer.speed_scale = dialogueSpeed / richTextLabel.text.length()
	animPlayer.play()
	speechIndex += 1

func _process(_delta: float) -> void:
	richTextLabel.visible = isTalking
	vBoxContainer.visible = not isTalking
	
	isTalking = true
	Speak(Dialogue)
