extends CanvasLayer

@onready var textBoxContainer: MarginContainer = $TextBoxContainer
@onready var start: Label = $TextBoxContainer/MarginContainer/HBoxContainer/Start
@onready var end: Label = $TextBoxContainer/MarginContainer/HBoxContainer/End
@onready var label: RichTextLabel = $TextBoxContainer/MarginContainer/HBoxContainer/Label
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	hide_container()
	
func hide_container():
	start.text = ""
	label.text = ""
	end.text= ""
	self.hide()
	
func show_container():
	start.text = "*"
	end.text= "v"
	self.show()
	animationPlayer.play("Apearring")
	
func add_text (next_text : String):
	label.text = next_text
	show_container()
