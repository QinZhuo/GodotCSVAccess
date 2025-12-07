# Godot CSVAccess
[English](https://github.com/QinZhuo/GodotCSVAccess/blob/master/README.md) | [中文](https://github.com/QinZhuo/GodotCSVAccess/blob/master/zh/README.md)

[Github](https://github.com/QinZhuo/GodotCSVAccess) • [Asset Library](https://godotengine.org/asset-library/asset/4480)

>A plugin to access CSV files in dictionary form, which can be used to modify translation files and data files in code.

## Usage

```gdscript
# Load CSV data

var data = CSVAccess.load_csv_data("res://demo/test.csv")

## Modify CSV data

data["key_1"]["en"] = str("key_1_ ", randi())
data["key_2"] = {en = str("key_2_ ", randi())}
data["key_3"] = {"en": str("key_3_ ", randi())}

# Save CSV data

CSVAccess.save_csv_data("res://demo/test.csv", data)
```