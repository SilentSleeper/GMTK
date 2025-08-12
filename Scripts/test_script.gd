class_name test_script extends Node2D

func _ready() -> void:
	print("Select a background : A, B, C")
	Player.trait_changed.connect(_print_traits)
func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("Choose A") :
		Player.initTraits("Rich")
	if Input.is_action_just_pressed("Choose B") :
		Player.initTraits("Modest")
	if Input.is_action_just_pressed("Choose C") :
		Player.initTraits("Poor")
		

func _print_traits():
	print(Player.Traits)
