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

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| name            | string | null: false |
| kana_name       | string | null: false |
| birthday        | string | null: false |


### Association

- has_many :item
- has_many :purchase


## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           | string     | null: false                    |
| item            | string     | null: false                    |
| text            | string     | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| shipping_burden | string     | null: false                    |
| shipping_erea   | string     | null: false                    |
| date_shipment   | string     | null: false                    |
| price           | string     | null: false                    |
| user            | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase
- belongs_to :user

## purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     | integer    | null: false                    |
| expiration_day  | integer    | null: false                    |
| security_code   | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- has_many :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | integer    | null: false                    |
| prefectures      | string     | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building         | string     | null: false                    |
| phone_number     | integer    | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
