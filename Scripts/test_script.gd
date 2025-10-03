class_name test_script extends Node2D

signal tratits_selected

@onready var choice_type: CanvasLayer = $Choice_Type
@onready var fileReader: FileReader = $FileReader
@onready var label: RichTextLabel = $TextBox/TextBoxContainer/NinePatchRect/MarginContainer/RichTextLabel
@onready var animation_player: AnimationPlayer = $AnimationPlayer


var Upbringing : String = ""
var Personality : String = ""
var Profession : String = ""
var Passives : Array[String] = []
var Items : Array[String] = []
var wearableItems : Array[String] = []

var isFirstTime = false
var DialogueDict
var rand = RandomNumberGenerator.new()

func _ready() -> void:
	choice_type.choice_1.connect(ChoiceSelected)
	choice_type.choice_2.connect(ChoiceSelected)
	choice_type.choice_3.connect(ChoiceSelected)
	choice_type.choice_4.connect(ChoiceSelected)
	choice_type.choice_5.connect(ChoiceSelected)
	choice_type.choice_6.connect(ChoiceSelected)
	choice_type.choice_7.connect(ChoiceSelected)
	choice_type.choice_8.connect(ChoiceSelected)
	choice_type.choice_9.connect(ChoiceSelected)
	choice_type.choice_10.connect(ChoiceSelected)
	DialogueDict = fileReader.LoadJson()
	label.text = fileReader.Extract(DialogueDict, "first")[rand.randi_range(0,2)]
	tratits_selected.connect(addTraits)
	Player.trait_changed.connect(_selected_traits)
	

func _process(delta: float) -> void:
	if (animation_player.is_playing()):
		choice_type.visible = false
	else:
		choice_type.visible = true

func _selected_traits():
	print(Player.Traits)
	get_tree().change_scene_to_file("res://Scenes/world_map.tscn")

func addTraits():
	Player.initCharacter(Upbringing,Personality,Profession,Passives, wearableItems, Items)

func ChoiceSelected(choice):
	if (Upbringing == ""):
		Upbringing = choice
		label.text = fileReader.Extract(DialogueDict, "second")[rand.randi_range(0,2)]
		animation_player.play("text_show")
	elif (Personality == ""):
		Personality = choice
		label.text = fileReader.Extract(DialogueDict, "third")[rand.randi_range(0,2)]
		animation_player.play("text_show")
	elif (Profession == ""):
		Profession = choice
		label.text = fileReader.Extract(DialogueDict, "fourth")[rand.randi_range(0,2)]
		animation_player.play("text_show")
	elif (Passives == []):
		Passives = choice
		label.text = fileReader.Extract(DialogueDict, "fifth")[rand.randi_range(0,2)]
		animation_player.play("text_show")
	elif (Items == [] or wearableItems == []):
		if Global.wearableItems.has(choice[0]):
			wearableItems = choice
		else:
			Items = choice
		tratits_selected.emit()
	print(choice)
