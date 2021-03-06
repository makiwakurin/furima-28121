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

| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| nickname             | string     | null: false                    |
| email                | string     | null: false                    |
| password             | string     | null: false                    |
| first_name           | string     | null: false                    |
| last_name            | string     | null: false                    |
| first_name_kana      | string     | null: false                    |
| last_name_kana       | string     | null: false                    |
| birthday             | date       | null: false                    |

### Association
- has_many :items
- has_many :orders

## itemsテーブル

| Column                      | Type       | Options                        |
| ------                      | ---------- | ------------------------------ |
| name                        | string     | null: false                    |
| text                        | text       | null: false                    |
| category_id                 | integer    | null: false                    |
| status_id                   | integer    | null: false                    |
| charges_id(配送料の負担)      | integer    | null: false                    |
| region_id(発送元の地域)       | integer    | null: false                    |
| days_to_ship_id(発送迄の日数) | integer    | null: false                    |
| price(出品価格)              | integer    | null: false                    |
| user                        | references | null: false, foreign_key: true |

### Association

- belongs_to: user
- has_one: order

## ordersテーブル

| Column                      | Type           | Options                        |
| ------                      | ----------     | ------------------------------ |
| user                        | references     | null: false, foreign_key: true |
| item                        | references     | null: false, foreign_key: true |

### Association

- belongs_to: user
- belongs_to: item
- has_one: address

## addressesテーブル

| Column                      | Type           | Options                        |
| ------                      | ----------     | ------------------------------ |
| postal_cord(郵便番号)         | string         | null: false                    |
| prefectures_id(都道府県)      | integer        | null: false                    |
| municipality(市区町村)        | string         | null: false                    |
| house_number(番地)           | string         | null: false                    |
| building_name(建物名)         | string         |                                |
| phone_number                | integer        | null: false                    |
| pay                         | references     | null: false, foreign_key: true |

### Association

- belongs_to: order






