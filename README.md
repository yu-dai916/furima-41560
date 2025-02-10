# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password   | string | null: false |
| firstname           | string | null: false |
| lastname          | string | null: false |
| firstname_katakana           | string | null: false |
| lastname_katakana          | string | null: false |
| birth_day         | date    | null: false 

### Association

* has_many :items
* has_many :comments,through:items
* has_many :orders



## items table
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string  |  null: false    |
|price               |integer| null: false　|
| user               |references|  null: false,foreign_key:true|
| category_id        |integer       |   null: false         |
|explanation                |text       |   null: false         |
| quality_id            |integer    |   null: false         |
| payment_id            |integer        |  null: false          |
| prefecture_id             |integer       | null: false           |
| scheduled_delivery_id    |integer       |  null: false          |


### Association

* belongs_to:user
* has_many :comments
* has_one :order

## commentsテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| text               |text       |            |
| user               |references   | null: false,foreign_key:true        |
| item             |references   | null: false,foreign_key:true        |

### Association

* belongs_to:user
* belongs_to:item

## ordersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user               |references   |  null: false,foreign_key:true            |
| item              |references   |  null: false,foreign_key:true            |

### Association

* belongs_to:user 
* belongs_to:item
* has_one:address

## addressesテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code          |string  |  null: false     |
| prefecture_id         |integer   |  null: false     |
| city               |string  |  null: false     |
| house_number       |string  |  null: false     |
| building_name        |srting  |                   |
| phone_number         |string  |  null: false     |
| order               |references|  null: false,foreign_key:true      |

### Association

* belongs_to:order