class_name FileReader
extends Node

@export_file("*.txt", "*.json") var File:String

func Load() -> PackedStringArray:
	var file = FileAccess.open(File, FileAccess.READ)
	return file.get_as_text().split(">", false)

func LoadJson() -> Dictionary:
	var fileStream = FileAccess.open(File, FileAccess.READ)
	var json = JSON.new()
	assert(json.parse(fileStream.get_as_text()) == OK, generateJsonError(json))
	return json.data
	
func generateJsonError(json: JSON) -> String:
	return "JSON Parse ERROR: " + json.get_error_message() + " in " + File\
	+ " at line " + str(json.get_error_line())
