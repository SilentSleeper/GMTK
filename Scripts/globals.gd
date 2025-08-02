extends Node

#Flags
var WorldFlags = {
	"mGuild": false, # Merchant's Guild exists
	"bGuild": false, # Builder's Guild exists
	"mAcademy": false, # Magic Academy exists
}

# Trait and item collections

enum Upbringings {
	Rich, 
	Medium, 
	Poor
}

enum Personalities {
	Austere,
	Endearing,
	Charming
}

enum Professions{
	Knight,
	Mage,
	Merchant,
	Minstrel,
	Builder,
	Herbalist,
	Cleric,
	Graverobber,
	Wayfarer,
	Druid
}

enum Passives{
	FungaceousImmunity,
	EnuasBlessing
}

enum Items{
	TarskinOil,
	StarfolliesBouquet,
	MeltstoneGum
}
