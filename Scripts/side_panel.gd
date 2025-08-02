extends CanvasLayer
@onready var h_flow_container: HFlowContainer = $MarginContainer/Panel/HFlowContainer
@onready var spawner_component: SpawnerComponent = $MarginContainer/Panel/HFlowContainer/SpawnerComponent

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		match event.keycode:
			KEY_ENTER:
				spawner_component.scene = load("res://Scenes/upbringing.tscn")
				spawner_component.spawn(spawner_component.global_position, h_flow_container)
