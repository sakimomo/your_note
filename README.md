# README

# テーブル設計

## usersテーブル
| Column             | Type   | Options                   | 
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| profile            | text   | null: false               |

- has_many :comments
- has_many :phototypes
- has_many :likes

## commentsテーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| prototype | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :phototype
- has_many :likes

## phototypesテーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| content    | text       | null: false                    | 
| user       | references | null: false, foreign_key: true |

- belongs_to :user
- has_many :comments

## likesテーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| prototype  | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :prototype

## relationshipsテーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| follower   | references | null: false, foreign_key: true |
| followee   | references | null: false, foreign_key: true |