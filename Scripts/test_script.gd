class_name test_script extends Node2D

func _ready() -> void:
	Player.initTraits("Poor", "Charming", "Knight", ["Enua's Blessing"], ["Regalia"])
	Player.addItem("Tar-skin Oil")
func _process(_delta: float) -> void:
	print(Player.Inventory)
	print(Global.Items)
