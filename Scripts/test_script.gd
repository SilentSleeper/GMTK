class_name test_script extends Node2D

signal tratits_selected

@onready var choice_type: CanvasLayer = $Choice_Type
@onready var fileReader: FileReader = $FileReader
@onready var label: RichTextLabel = $TextBox/TextBoxContainer/NinePatchRect/MarginContainer/RichTextLabel


var Upbringing : String = ""
var Personality : String = ""
var Profession : String = ""
var Passives : Array[String] = []
var Items : Array[String] = []

var isFirstTime = false

func _ready() -> void:
	#choice_type.choice_1.connect(ChoiceSelected)
	#choice_type.choice_2.connect(ChoiceSelected)
	#choice_type.choice_3.connect(ChoiceSelected)
	#tratits_selected.connect(addTraits)
	#Player.trait_changed.connect(_selected_traits)
	#label.text = fileReader.Load()[0]
	var plm = fileReader.LoadJson()
	var sal = fileReader.Extract(plm, "Mage")
	print(sal)

func _selected_traits():
	print(Player.Traits)
	get_tree().change_scene_to_file("res://Scenes/world_map.tscn")

func addTraits():
	Player.initTraits(Upbringing,Personality,Profession,Passives,Items)

func ChoiceSelected(choice):
	if (Upbringing == ""):
		Upbringing = choice
	elif (Personality == ""):
		Personality = choice
	elif (Profession == ""):
		Profession = choice
	elif (Passives == []):
		Passives = choice
	elif (Items == []):
		Items = choice
	else:
		tratits_selected.emit()
