extends Node
## General-use flags and data collections regarding the game's world.
##
## Contains collections of the game's sets of content, numerical representations of various 
## in-game traits and items, as well as flags signaling the status of certain events. 

var maxPlayerHealth

#Flags
var worldFlags = {
	"mGuild": false, # Merchant's Guild exists
	"bGuild": false, # Builder's Guild exists
	"mAcademy": false, # Magic Academy exists
	"killedWolves": false, # Killed the wolves in the forest
	"metEnua": false,
	"discoveredSprings": false
}

var metNPCs = {
	"King": false,
	"Tavernkeep": false,
	"Witch": false
}

# Trait and item collections

var poorStartMoney = 10
var mediumStartMoney = 50
var richStartMoney = 100

var Upbringings = {
	"Rich": richStartMoney,
	"Modest": mediumStartMoney,
	"Poor": poorStartMoney
}

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

## Collection of items that the player character can wear.
var wearableItems = [
	"Regalia"
]


var Items = [
	"Tar-skin Oil",
	"Starfollies Bouquet",
	"Meltstone Gum"
]
