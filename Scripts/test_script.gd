class_name test_script extends Node2D

func _ready() -> void:
	Player.initTraits("Poor", "Charming", "Knight", ["Enua's Blessing"], ["Regalia"])
func _process(delta: float) -> void:
	print(Player.Traits)
