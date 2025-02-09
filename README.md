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
|image               |string | null: false  |
|category            |string | null: false　|
|product name        |string | null: false　|
|address             |string | null: false  |
|price               |string | null: false |
|------------------ | ------ | -----------  | 
## commentsテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |