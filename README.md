# README

## users テーブル

| Colum                 | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| name                  | string  | null: false               |
| name_kana             | string  | null: false               |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| profile               | text    | null: false               |
| job_id                | integer | null: false               |

### Association

- has_many :words
- has_many :comments

## words テーブル

| colum       | Type                | Options           |
| ----------- | ------------------- | ----------------- |
| title       | string              | null: false       |
| note        | text                | null: false       |
| genre       | integer             | null: false       |
| user        | references          | foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments

## comments テーブル

| Colum      | Type        | Options     | 
| ---------- | ----------- | ----------- |
| text       | string      | null: false |
| user       | references  |             |
| prototype  | references  |             |

### Association

- belongs_to :user
- belongs_to :word