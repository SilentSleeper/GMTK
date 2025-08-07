extends CanvasLayer

@onready var textBoxContainer: MarginContainer = $TextBoxContainer
@onready var start: RichTextLabel = $TextBoxContainer/MarginContainer/VBoxContainer/Start
@onready var label: RichTextLabel = $TextBoxContainer/MarginContainer/VBoxContainer/Label
@onready var animPlayer: AnimationPlayer = $AnimationPlayer

const MAX_WIDTH = 110

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
	show_container()
	label.text = next_text
	start.text = title
	await textBoxContainer.resized
	textBoxContainer.custom_minimum_size.x = min(textBoxContainer.size.x, MAX_WIDTH)
	if textBoxContainer.size.x > MAX_WIDTH:
		start.autowrap_mode = TextServer.AUTOWRAP_WORD
		label.autowrap_mode = TextServer.AUTOWRAP_WORD
		await textBoxContainer.resized # resize x
		await textBoxContainer.resized # resize y
		textBoxContainer.custom_minimum_size.y = textBoxContainer.size.y
