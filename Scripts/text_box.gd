extends CanvasLayer

@onready var textBoxContainer: MarginContainer = $Sprite2D/TextBoxContainer
@onready var start: Label = $Sprite2D/TextBoxContainer/MarginContainer/HBoxContainer/Start
@onready var end: Label = $Sprite2D/TextBoxContainer/MarginContainer/HBoxContainer/End
@onready var label: RichTextLabel = $Sprite2D/TextBoxContainer/MarginContainer/HBoxContainer/Label
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	hide_container()
	
func hide_container():
	start.text = ""
	label.text = ""
	end.text= ""
	textBoxContainer.hide()
	
func show_container():
	start.text = "*"
	end.text= "v"
	textBoxContainer.show()
	animationPlayer.play("Apearring")
	
func add_text (next_text : String):
	label.text = next_text
	show_container()
