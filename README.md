# README
* Database creation
## teachersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index, unique:true|
|email|string|null: false, unique: true|
|address|text||
|age|integer||
|department|string||
|salary|integer||
|image|string||
|profile|string||
|uid|string||
|provider|string||


### Association
- has_many :messages
- has_many :subjects
- has_many :teacher_subjects
- has_one :student
- has_many :chat_groups

## studentsテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false, default: "", unique: true|
|name|string||
|age|integer||
|address|text||
|subject|string||

## Association
- has_many :chat_groups
- has_many :messages
- has_one :teacher

## chat_groupsテーブル
|Column|Type|Options|
|------|----|-------|
|teacher_id|integer|add_index|
|student_id|integer|add_index|

## Association
- has_many :messages

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|messageable_type|string|add_index|
|messageable_id|integer|add_index|
|chat_group_id|integer|add_index|

## Association
- belongs_to :messageable

## subjectsテーブル
|Column|Type|Options|
|------|----|-------|
|subject|string||

## Association
- has_many :teacher_subjects
- has_many :teachers

## teacher_subjects
|Column|Type|Options|
|------|----|-------|
|teacher_id|integer|add_index|
|subject_id|integer|add_index|

## Association
- belongs_to :subject
- belongs_to :teacher
