# テーブル 設計

## users テーブル

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | unique: true, null: false|
| encrypted_password | string              | null: false             |
| first_name         | string              | null: false             |
| family_name        | string              | null: false             |
| first_name_kana    | string              | null: false             |
| family_name_kana   | string              | null: false             |
| birth_date         | date                | null: false             |

### Association

* has_many :items
* has_many :purchases

## items テーブル

| Column                | Type       | Options           |
|-----------------------|------------|-------------------|
| item_name             | string     | null: false       |
| explain               | text       | null: false       |
| brand_id              | integer    | null: false       |
| category_id           | integer    | null: false       |
| item_status_id        | integer    | null: false       |
| delivery_charge_id    | integer    | null: false       |
| delivery_area_id      | integer    | null: false       |
| cost                  | integer    | null: false       |
| user                  | references | foreign_key: true |


### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column                | Type       | Options           |
|-----------------------|------------|-------------------|
| user                  | references | foreign_key: true |
| item                  | references | foreign_key: true |


### Association

- has_one :address
- belongs_to :item
- belongs_to :user

## address テーブル

| Column                | Type       | Options           |
|-----------------------|------------|-------------------|
| postal_code           | string     | null: false       |
| delivery_area_id      | integer    | null: false       |
| city                  | string     | null: false       |
| addresses             | string     | null: false       |
| building              | string     |                   |
| phone_number          | string     | null: false       |
| purchase              |references  |foreign_key: true  |
### Association

- belongs_to :purchase