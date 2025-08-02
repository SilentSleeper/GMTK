extends CanvasLayer

@onready var textBoxContainer: MarginContainer = $Sprite2D/TextBoxContainer
@onready var start: RichTextLabel = $Sprite2D/TextBoxContainer/MarginContainer/VBoxContainer/Start
@onready var label: RichTextLabel = $Sprite2D/TextBoxContainer/MarginContainer/VBoxContainer/Label
@onready var animPlayer: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	hide_container()
	
func hide_container():
	start.text = ""
	label.text = ""
	textBoxContainer.hide()
	
func show_container():
	textBoxContainer.show()
	animPlayer.play("Apearring")
	
func add_text (next_text : String, title:String):
	label.text = next_text
	start.text = title
	show_container()
