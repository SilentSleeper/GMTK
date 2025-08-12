extends Node2D

@onready var label: RichTextLabel = $Label

@export var amount = 0

func _ready() -> void:
	amount = Player.Health
	label.text = str(amount)
