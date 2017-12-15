# README
* Database creation
## teachersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index, unique:true|
|email|text|null: false, unique: true|
|age|integer||
|department|string||
|subject|string||
|salary|integer||
|image|string||
|profile|string||


### Association

## studentsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||
|age|integer||
|address|text||
|subject|string||

## Association
