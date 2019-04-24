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
|id|BIGINT|null: false, unique: true|
|name|VARCHAR(255)|null: false, add_index|
|email|VARCHAR(255)|unique: ture| * devise
|encrypted_password|VARCHAR(255)|| * devise
|reset_password_token|VARCHAR(255)|unique: true| * devise
|encrypted_password|VARCHAR(255)|| * devise
|reset_password_sent_at|DATETIME|| * devise
|remember_created_at|DATETIME|| * devise
|created_at|DATETIME||
|updated_at|DATETIME||

### Association
- has_many :groups, through: :members
- has_many :messages
---

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|id|BIGINT|null: false, unique: true|
|group_name|VARCHAR(255)|null: false, add_index|
|created_at|DATETIME||
|updated_at|DATETIME||

### Association
- has_many :users, through: :members
- has_many :messages
---

## membersテーブル

|Column|Type|Options|
|------|----|-------|
|id|BIGINT|null: false, unique: true|
|user_id|INTEGER|null: false, foreign_key: true|
|group_id|INTEGER|null: false, foreign_key: true|
|created_at|DATETIME||
|updated_at|DATETIME||

### Association
- belongs_to :group
- belongs_to :user

---

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|id|BIGINT|null: false, unique: true|
|boby|TEXT|add_index|
|image|VARCHAR(255)|add_index|
|user_id|INTEGER|null: false, foreign_key: true|
|group_id|INTEGER|null: false, foreign_key: true|
|created_at|DATETIME|add_index|
|updated_at|DATETIME||

### Association
- belongs_to :group
- belongs_to :user
