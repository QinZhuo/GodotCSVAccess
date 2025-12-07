@icon("res://addons/CSVAccess/icon.png")
@tool
class_name CSVAccess
extends RefCounted

## Load CSV file and return dictionary (ID -> data dictionary)
static func load_csv_file(path: String) -> Dictionary[String, Dictionary]:
	var data: Dictionary[String, Dictionary] = {}
	var file = FileAccess.open(path, FileAccess.READ)
	if file == null:
		push_error("Cannot open CSV file: " + path)
		return data

	var header_line = file.get_csv_line()
	if header_line.size() < 2:
		push_error("Invalid CSV format: missing column headers")
		return data

	var columns = []
	for i in range(1, header_line.size()):
		columns.append(header_line[i])

	while !file.eof_reached():
		var row = file.get_csv_line()
		if row.is_empty() or row[0].strip_edges() == "":
			continue
		var entry = {}
		for i in range(columns.size()):
			if i + 1 < row.size():
				entry[columns[i]] = row[i + 1]
			else:
				entry[columns[i]] = ""
		data[row[0]] = entry

	file.close()
	return data


## Save dictionary to CSV file
static func save_csv_file(path: String, data: Dictionary[String, Dictionary]) -> void:
	if !path.ends_with(".csv"):
		path += ".csv"

	if data.is_empty():
		push_warning("No data to save to CSV: " + path)
		return

	var file = FileAccess.open(path, FileAccess.WRITE)
	if file == null:
		push_error("Cannot write to CSV file: " + path)
		return

	# Auto-detect all unique columns from the data
	var all_columns = []
	for id in data:
		var entry = data[id]
		for col in entry:
			if !all_columns.has(col):
				all_columns.append(col)

	# Sort columns for consistent output
	all_columns.sort()

	# Write header
	var header = ["id"]
	for col in all_columns:
		header.append(col)
	file.store_csv_line(header)

	# Write content (sorted by ID)
	var sorted_ids = data.keys()
	sorted_ids.sort()

	for id in sorted_ids:
		var row = [id]
		var values = data[id]
		for col in all_columns:
			row.append(values.get(col, ""))
		file.store_csv_line(row)

	file.close()
	print("CSV file saved to: ", path)
