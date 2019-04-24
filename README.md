# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|STRING|null: false, add_index|

### Association
- has_many :groups, through: :members
- has_many :messages
- has_many :members
---

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|group_name|STRING|null: false, add_index|

### Association
- has_many :users, through: :members
- has_many :messages
- has_many :members
---

## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

---

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|body|TEXT||
|image|STRING||
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
