extends Node2D

@onready var label: RichTextLabel = $Label

var amount = 0

func _ready() -> void:
	amount = Player.Generations
	label.text = str(amount)
