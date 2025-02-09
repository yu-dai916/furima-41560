# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true |
| password           | string | null: false |
| password_confirmation| string |null: false |
| firstname           | string | null: false |
| lastname          | string | null: false |
| birth_day         | date    | null: false 

### Association

* has_many :items
* has_many :comments,through:items
* has_many :orders



## items table
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string  |  null: false    |
|image               |string | null: false  |
|price               |integer| null: false　|
| user               |references|  null: false,foreign_key:true|
|tax                 |boolean   | null: false |
| text               |text       |            |
| genre              |integer       |   null: false         |
| quality            |integer    |   null: false         |
| payment            |integer        |  null: false          |
| prefecture             |integer       | null: false           |
| days                |integer       |  null: false          |


### Association

* belongs_to:user
* has_many :comments,
* has_many :order

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

* belongs_to:user belongs_to:item
* belongs_to:address

## addressesテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code          |sting  |  null: false     |
| prefecture         |integer   |  null: false     |
| city               |sting  |  null: false     |
| house_number       |sting  |  null: false     |
| building_nume        |sting  |                   |
| phone_number         |sting  |  null: false     |
| order               |references|  null: false,foreign_key:true      |

### Association

* belongs_to:order