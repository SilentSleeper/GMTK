extends Node

var maxPlayerHealth

#Flags
var worldFlags = {
	"mGuild": false, # Merchant's Guild exists
	"bGuild": false, # Builder's Guild exists
	"mAcademy": false, # Magic Academy exists
	"killedWolves": false,
	"metEnua": false,
	"discoveredSprings": false
}

# Trait and item collections
var Upbringings = [
	"Rich", 
	"Medium", 
	"Poor"
]

var Personalities = [
	"Austere",
	"Endearing",
	"Charming"
]

var Professions = [
	"Knight",
	"Mage",
	"Merchant",
	"Minstrel",
	"Builder",
	"Herbalist",
	"Cleric",
	"Graverobber",
	"Wayfarer",
	"Druid"
]

var Passives = [
	"Fungaceous Immunity",
	"Enua's Blessing"
]

var wearableItems = [
	"Regalia"
]

var Items = [
	"Tar-skin Oil",
	"Starfollies Bouquet",
	"Meltstone Gum"
]
