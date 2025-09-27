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

var isFirstTime = false

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
	label.text = fileReader.Load()[0]
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
	Player.initTraits(Upbringing,Personality,Profession,Passives,Items)

func ChoiceSelected(choice):
	if (Upbringing == ""):
		Upbringing = choice
		label.text = fileReader.Load()[1]
		animation_player.play("text_show")
	elif (Personality == ""):
		Personality = choice
		label.text = fileReader.Load()[2]
		animation_player.play("text_show")
	elif (Profession == ""):
		Profession = choice
		label.text = fileReader.Load()[3]
		animation_player.play("text_show")
	elif (Passives == []):
		Passives = choice
		label.text = fileReader.Load()[4]
		animation_player.play("text_show")
	elif (Items == []):
		Items = choice
		tratits_selected.emit()
	print(choice)
