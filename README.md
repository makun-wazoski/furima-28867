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

| Column           | Type   | Options     |
| ---------------  | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| kana_family_name | string | null: false |
| kana_first_name  | string | null: false |
| birthday         | date   | null: false |


### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           | string     | null: false                    |
| item            | string     | null: false                    |
| text            | text       | null: false                    |
| category        | integer    | null: false                    |
| status          | integer    | null: false                    |
| shipping_burden | integer    | null: false                    |
| shipping_erea   | integer    | null: false                    |
| date_shipment   | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |


### Association

- has_one :purchase
- belongs_to :user
- has_one_attached :image


## purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefectures      | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building         | string     |                                |
| phone_number     | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
