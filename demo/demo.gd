extends Node3D


func _ready():
	# Load CSV data
	var data = CSVAccess.load_csv_file("res://demo/test.csv")
	
	## Modify CSV data

	data["key_1"]["en"] = str("key_1_ ", randi())
	data["key_2"] = {en = str("key_2_ ", randi())}
	data["key_3"] = {"en": str("key_3_ ", randi())}

	# Save CSV data

	CSVAccess.save_csv_file("res://demo/test.csv", data)
