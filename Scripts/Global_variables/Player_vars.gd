extends Node
## Data file / class for the player instance.
##
## Contains data referring to the current player instance, such as stats, traits and inventory.
## Also contains methods for the handling of said data.

signal trait_changed

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



func initTraits(Upbringing: String = "", Personality: String = "", Profession: String = "", 
Passives: Array[String] = [], WornItems: Array[String] = []) -> void:
	for i in Traits:
		Traits[i] = null
	
	assert(Global.Upbringings.has(Upbringing), "Invalid Upbringing in constructor")
	Traits["Upbringing"] = Upbringing
	Coins = Global.Upbringings[Upbringing]
	trait_changed.emit()
	assert(Global.Personalities.has(Personality), "Invalid Personality in constructor")
	Traits["Personality"] = Personality
	
	assert(Global.Professions.has(Profession), "Invalid Profession in constructor")
	Traits["Profession"] = Profession
	
	for i in Passives:
		assert(Global.Passives.has(i), "One or more invalid Passives in constructor")
	Traits["Passives"] = Passives
	
	for i in WornItems:
		assert(Global.wearableItems.has(i), "One or more invalid Worn Items in constructor")
	Traits["WornItems"] = WornItems

func addItem(itemArg: String, Amount := 1):
	assert(Global.Items.has(itemArg), "Invalid item tried to be added")
	if Inventory.has(itemArg):
		Inventory[itemArg] += Amount
	else:
		Inventory.set(itemArg, Amount)
	
	
