extends Node
## Data file / class for the player instance.
##
## Contains data referring to the current player instance, such as stats, traits and inventory.
## Also contains methods for the handling of said data.

signal traits_changed

var Generations: int = 12
var Health: int = 100
var Coins: int = 0
var Gems: int = 0
var Defense: int = 0

var Traits = {
	"Upbringing": null,
	"Personality": null,
	"Profession": null,
	"Passives": null,
	"WornItems": null
}

var Inventory: Dictionary[String, int] = {} 

var locationStack: Array[PackedScene]

func initCharacter(
	Upbringing: String = "", 
	Personality: String = "", 
	Profession: String = "", 
	Passives: Array[String] = [], 
	WornItems: Array[String] = [], 
	inventoryItems: Array[String] = []
) -> void:

	for i in Traits:
		Traits[i] = null
	
	assert(Global.Upbringings.has(Upbringing), "Invalid Upbringing in constructor")
	Traits["Upbringing"] = Upbringing
	Coins = Global.Upbringings[Upbringing]
	
	assert(Global.Personalities.has(Personality), "Invalid Personality in constructor")
	Traits["Personality"] = Personality
	
	assert(Global.Professions.has(Profession), "Invalid Profession in constructor")
	Traits["Profession"] = Profession
	
	for i in Passives:
		assert(Global.Passives.has(i), "One or more invalid Passives in constructor")
	Traits["Passives"] = Passives
	
	if not WornItems.is_empty():
		for i in WornItems:
			assert(Global.wearableItems.has(i), "One or more invalid Worn Items in constructor")
		Traits["WornItems"] = WornItems
	
	if not inventoryItems.is_empty():
		for i in inventoryItems:
			addItem(i)
	traits_changed.emit()

func addItem(itemArg: String, Amount := 1):
	assert(Global.Items.has(itemArg), "Invalid item tried to be added")
	if Inventory.has(itemArg):
		Inventory[itemArg] += Amount
	else:
		Inventory.set(itemArg, Amount)

func _input(event: InputEvent) -> void:
	#TODO: Functionalitate de revenire la scena anterioara pe o tasta (momentan b)
	if event is InputEventKey and event.is_pressed():
		match event.keycode:
			KEY_B:
				Player.locationStack.pop_back()
				print(Player.locationStack.size())
				get_tree().change_scene_to_packed(Player.locationStack[Player.locationStack.size() - 1])
	
