# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | string|
| email              | string | null: false, unique: true |
| password           | string | null: false |


## furima table
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
 image               |string | null     |
 category            |string | null      |
 product name        |string | null       |
 address             |string | null       |
 price               |string | null       |
 ------------------ | ------ | -----------  | 
## commentsテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |