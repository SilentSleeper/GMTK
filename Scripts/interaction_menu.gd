extends Node2D
## Base scene for representing any non-conversational interaction inside the game world.

@onready var spawner_component: SpawnerComponent = $MarginContainer/HFlowContainer/SpawnerComponent
@onready var h_flow_container: HFlowContainer = $MarginContainer/HFlowContainer

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		match event.keycode:
			KEY_ENTER:
				spawner_component.scene = load("res://Scenes/beer.tscn")
				spawner_component.spawn(spawner_component.global_position, h_flow_container)
