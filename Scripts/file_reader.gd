class_name FileReader
extends Node

@export_file("*.txt", "*.json") var File:String

func Load(separator: String) -> PackedStringArray:
	var file = FileAccess.open(File, FileAccess.READ)
	return file.get_as_text().split(separator, false)

func LoadJson() -> Dictionary:
	var fileStream = FileAccess.open(File, FileAccess.READ)
	var json = JSON.new()
	assert(json.parse(fileStream.get_as_text()) == OK, generateJsonError(json))
	return json.data
	
func generateJsonError(json: JSON) -> String:
	return "JSON Parse ERROR: " + json.get_error_message() + " in " + File\
	+ " at line " + str(json.get_error_line())

## Recursively finds target string array in dictionary
func Extract(dict: Dictionary, target: String) -> PackedStringArray:
	for i in dict:
		if i.to_lower() == target.to_lower():
			return dict[i]
		elif dict[i] is Dictionary:
			var result = Extract(dict[i], target)
			if !result.is_empty():
				return result
	return []
