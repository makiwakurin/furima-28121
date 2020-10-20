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
| birthday             | data       | null: false                    |

### Association
- has_many :items
- has_many :pays

## itemsテーブル

| Column                      | Type       | Options                        |
| ------                      | ---------- | ------------------------------ |
| name                        | string     | null: false                    |
| text                        | text       | null: false                    |
| category                    | string     | null: false                    |
| status                      | string     | null: false                    |
| shipping_charges(配送料の負担)| string     | null: false                    |
| region(発送元の地域)          | string     | null: false                    |
| days_to_ship(発送迄の日数)    | string     | null: false                    |
| price                       | integer    | null: false                    |
| user_id                     | references | null: false, foreign_key: true |
| pay_id                      | references | null: false, foreign_key: true |
| address_id                  | references | null: false, foreign_key: true |

### Association

- belongs_to: user
- has_one: pay
- has_one: address

## paysテーブル

| Column                      | Type           | Options                        |
| ------                      | ----------     | ------------------------------ |
| card_number                 | integer        | null: false                    |
| exp_month                   | integer        | null: false                    |
| exp_year                    | integer        | null: false                    |
| cvc_cord                    | integer        | null: false                    |
| user_id                     | references     | null: false, foreign_key: true |
| item_id                     | references     | null: false, foreign_key: true |

### Association

- belongs_to: user
- belongs_to: item
- has_one: address

## addressesテーブル

| Column                      | Type           | Options                        |
| ------                      | ----------     | ------------------------------ |
| postal_cord                 | string         | null: false                    |
| prefectures_id              | integer        | null: false                    |
| municipality                | string         | null: false                    |
| house_number                | string         | null: false                    |
| building_name               | string         |                                |
| phone_number                | integer        | null: false                    |
| pay_id                      | references     | null: false, foreign_key: true |

### Association

- belongs_to: pay






