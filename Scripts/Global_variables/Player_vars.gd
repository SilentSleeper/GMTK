extends Node

static var Generations: int = 12
static var Health: int = 100
static var Coins: int = 0
static var Gems: int = 0
static var Defense: int = 0

static var Traits = {
	"Upbringing": null,
	"Personality": null,
	"Profession": null,
	"Passives": null,
	"WornItems": null
}

var Inventory: Dictionary[Item, int] = {} 

static func initTraits(Upbringing: String, Personality: String, Profession: String, Passives: Array[String], WornItems: Array[String]) -> void:
	for i in Traits:
		Traits[i] = null
	
	assert(Global.Upbringings.has(Upbringing), "Invalid Upbringing in constructor")
	Traits["Upbringing"] = Upbringing
	
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

func addItem(itemArg: Item, Amount: int):
	if Inventory.has(itemArg):
		Inventory[itemArg] += Amount
	else:
		Inventory.set(itemArg, Amount)
