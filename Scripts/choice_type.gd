extends CanvasLayer

signal choice_1
signal choice_2
signal choice_3
signal choice_4
signal choice_5
signal choice_6
signal choice_7
signal choice_8
signal choice_9
signal choice_10

@onready var vbox: VBoxContainer = $TextBoxContainer/MarginContainer/VBoxContainer

@onready var button: Button = $TextBoxContainer/MarginContainer/VBoxContainer/Button
@onready var button_2: Button = $TextBoxContainer/MarginContainer/VBoxContainer/Button2
@onready var button_3: Button = $TextBoxContainer/MarginContainer/VBoxContainer/Button3
@onready var button_4: Button = $TextBoxContainer/MarginContainer/VBoxContainer/Button4
@onready var button_5: Button = $TextBoxContainer/MarginContainer/VBoxContainer/Button5
@onready var button_6: Button = $TextBoxContainer/MarginContainer/VBoxContainer/Button6
@onready var button_7: Button = $TextBoxContainer/MarginContainer/VBoxContainer/Button7
@onready var button_8: Button = $TextBoxContainer/MarginContainer/VBoxContainer/Button8
@onready var button_9: Button = $TextBoxContainer/MarginContainer/VBoxContainer/Button9
@onready var button_10: Button = $TextBoxContainer/MarginContainer/VBoxContainer/Button10

var data1 = ""
var data2 = ""
var data3 = ""
var data4 = ""
var data5 = ""
var data6 = ""
var data7 = ""
var data8 = ""
var data9 = ""
var data10 = ""

var selectionFlags = {
	"first" : true,
	"second" : false,
	"third" : false,
	"fourth" : false,
	"fifth" : false
}

var flagSelector

func _ready() -> void:
	button.pressed.connect(_button_pressed)
	button_2.pressed.connect(_button_2_pressed)
	button_3.pressed.connect(_button_3_pressed)
	button_4.pressed.connect(_button_4_pressed)
	button_5.pressed.connect(_button_5_pressed)
	button_6.pressed.connect(_button_6_pressed)
	button_7.pressed.connect(_button_7_pressed)
	button_8.pressed.connect(_button_8_pressed)
	button_9.pressed.connect(_button_9_pressed)
	button_10.pressed.connect(_button_10_pressed)

func _process(delta: float) -> void:
	
	if selectionFlags["first"]:
		limit_visible_children(3)
		data1 = "Rich"
		data2 = "Modest"
		data3 = "Poor"
		selectionFlags["first"] = false
		flagSelector = "second"
	elif selectionFlags["second"]:
		limit_visible_children(3)
		data1 = "Austere"
		data2 = "Endering"
		data3 = "Charming"
		selectionFlags["second"] = false
		flagSelector = "third"
	elif selectionFlags["third"]:
		limit_visible_children(5)
		data1 = "Knight"
		data2 = "Mage"
		data3 = "Merchant"
		data4 = "Mage"
		data5 = "Minstrel"
		selectionFlags["third"] = false
		flagSelector = "fourth"
	elif selectionFlags["fourth"]:
		limit_visible_children(2)
		data1 = ["Fungaceous Immunity"] as Array[String]
		data2 = ["Enua's Blessing"] as Array[String]
		selectionFlags["fourth"] = false
		flagSelector = "fifth"
	elif selectionFlags["fifth"]:
		limit_visible_children(3)
		data1 = ["Regalia"] as Array[String]
		data2 = ["Tar-skin Oil"] as Array[String]
		data3 = ["Starfollies Bouquet"] as Array[String]
		selectionFlags["fifth"] = false
		flagSelector = "first"

func _button_pressed():
	choice_1.emit(data1)
	selectionFlags[flagSelector] = true
func _button_2_pressed():
	choice_2.emit(data2)
	selectionFlags[flagSelector] = true
func _button_3_pressed():
	choice_3.emit(data3)
	selectionFlags[flagSelector] = true
func _button_4_pressed():
	choice_1.emit(data1)
	selectionFlags[flagSelector] = true
func _button_5_pressed():
	choice_2.emit(data2)
	selectionFlags[flagSelector] = true
func _button_6_pressed():
	choice_3.emit(data3)
	selectionFlags[flagSelector] = true
func _button_7_pressed():
	choice_1.emit(data1)
	selectionFlags[flagSelector] = true
func _button_8_pressed():
	choice_2.emit(data2)
	selectionFlags[flagSelector] = true
func _button_9_pressed():
	choice_3.emit(data3)
	selectionFlags[flagSelector] = true
func _button_10_pressed():
	choice_3.emit(data3)
	selectionFlags[flagSelector] = true

func limit_visible_children(max_count: int):
	for i in range(vbox.get_child_count()):
		var child = vbox.get_child(i)
		child.visible = (i < max_count)
