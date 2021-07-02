# テーブル 設計

## users テーブル

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | unique: true            |
| encrypted_password | string              | null: false             |
| first_name         | string              | null: false             |
| family_name        | string              | null: false             |
| first_name_kana    | string              | null: false             |
| family_name_kana   | string              | null: false             |
| user_birth_date    | text                | null: false             |

### Association

* has_many :items
* has_many :purchase

## items テーブル

| Column                | Type       | Options           |
|-----------------------|------------|-------------------|
| item_img              | text       | null: false       |
| item_name             | text       | null: false       |
| explain               | text       | null: false       |
| category_id           | integer    | null: false       |
| item_status_id        | integer    | null: false       |
| delivery_charge_id    | integer    | null: false       |
| delivery_area_id      | integer    | null: false       |
| cost_id               | integer    | null: false       |
| comments              | text       | null: false       |
| user_id               | references | foreign_key: true |


### Association

- belongs_to :user
- has_many :comments

## purchase テーブル

| Column                | Type       | Options           |
|-----------------------|------------|-------------------|
| user_id               | references | foreign_key: true |
| item_id               | references | foreign_key: true |


### Association

- belongs_to :items
- belongs_to :user

## address テーブル

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| postal_code | string     | null: false       |
| prefecture  | string     | null: false       |
| city        | string     | null: false       |
| cost        | string     | null: false       |
| addresses   | string     | null: false       |
| building    | string     |                   |
| phone_number| string     | null: false       |

### Association

- belongs_to :purchase