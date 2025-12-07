# Godot CSVAccess
[English](https://github.com/QinZhuo/GodotCSVAccess/blob/master/README.md) | [中文](https://github.com/QinZhuo/GodotCSVAccess/blob/master/zh/README.md)

[Github](https://github.com/QinZhuo/GodotCSVAccess) • [资产库](https://godotengine.org/asset-library/asset/4480) 

> 一个以字典形式访问CSV文件的插件，可用来在代码中修改翻译文件数据文件等

## 使用方法

```gdscript
# 加载CSV数据

var data = CSVAccess.load_csv_data("res://demo/test.csv")

## 修改CSV数据

data["key_1"]["en"] = str("key_1_ ", randi())
data["key_2"] = {en = str("key_2_ ", randi())}
data["key_3"] = {"en": str("key_3_ ", randi())}

# 保存CSV数据

CSVAccess.save_csv_data("res://demo/test.csv", data)
```