# テーブル 設計

## users テーブル

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | unique: true            |
| encrypted_password | string              | null: false             |
| name               | string              | null: false             |
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
| category              | string     | null: false       |
| item_status           | text       | null: false       |
| delivery_charge       | text       | null: false       |
| delivery_source_area  | text       | null: false       |
| cost                  | text       | null: false       |
| comments              | text       | null: false       |
| user_id               | references | foreign_key: true |


### Association

- belongs_to :user
- has_many :comments

## purchase テーブル

| Column                | Type       | Options           |
|-----------------------|------------|-------------------|
| card_number           | text       | null: false       |
| available_card        | text       | foreign_key: true |
| card_exp_month        | text       | foreign_key: true |
| card_exp_year         | text       | null: false       |
| card_cvc              | text       | null: false       |
| user_id               | references | foreign_key: true |
| item_id               | references | foreign_key: true |


### Association

- belongs_to :items
- belongs_to :user

## address テーブル

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| postal_code | text       | null: false       |
| prefecture  | text       | foreign_key: true |
| city        | text       | foreign_key: true |
| cost        | text       | null: false       |
| addresses   | text       | foreign_key: true |
| building    | text       | foreign_key: true |
| phone_number| text       | foreign_key: true |

### Association

- belongs_to :purchase