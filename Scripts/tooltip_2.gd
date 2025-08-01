extends CanvasLayer

@onready var text_box_container: MarginContainer = $Sprite2D/TextBoxContainer
@onready var start: RichTextLabel = $Sprite2D/TextBoxContainer/MarginContainer/VBoxContainer/Start
@onready var label: RichTextLabel = $Sprite2D/TextBoxContainer/MarginContainer/VBoxContainer/Label
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	hide_container()
	
func hide_container():
	start.text = ""
	label.text = ""
	text_box_container.hide()
	
func show_container():
	text_box_container.show()
	animation_player.play("Apearring")
	
func add_text (next_text : String, title:String):
	label.text = next_text
	start.text = title
	show_container()
