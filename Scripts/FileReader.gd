class_name FileReader
extends Node

@export_file("*.txt") var File:String

func Load() -> PackedStringArray:
	var file = FileAccess.open(File, FileAccess.READ)
	return file.get_as_text().split(">", false)
