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
# テーブル設計

## users テーブル(ユーザー情報)(deviceを使う)

| Column              | Type   | Options                       |
| ------------------- | ------ | ----------------------------- |
| nick_name           | string | null: false                   |
| email               | string | null: false, unique: true: "" |
| encrypted_password  | string | null: false                   |
| birth_day           | date   | null: false                   |
| first_name          | string | null: false                   |
| last_name           | string | null: false                   |
| read_first          | string | null: false                   |
| read_last           | string | null: false                   |

### Association

- has_many :items
- has_many :orders

## addresses テーブル(受取先情報)

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| order           | references | null: false, foreign_key: true |
| post_code       | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |


### Association

- belongs_to :order

## orders テーブル(購入履歴)

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## items テーブル(出品情報)

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| product_name        | string     | null: false                    |
| product_description | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| shipping_day_id     | integer    | null: false                    |
| shipping_cost_id    | integer    | null: false                    |
| price               | integer    | null: false                    |


### Association

- has_one :order
- belongs_to :user
