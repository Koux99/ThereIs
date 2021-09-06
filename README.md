# README

* テーブル設計

## users テーブル

| Column             | Type    | Options                     |
| ------------------ | ------  | --------------------------- |
| email              | string  | null: false, unique: true   |
| password           | string  | null: false                 |
| nickname           | string  | null: false, unique: true   |
| admin              | boolean | null: false, default: false |

### Association
- has_many :posts
- has_many :comments
- has_many :likes


## posts テーブル

| Column         | Type       | Options             |
| -------------- | ---------- | ------------------- |
| title          | text       | null: false         |
| lead_text      | text       | null: false         |
| text           | text       | null: false         |

### Association
- belongs_to :user
- has_many   :comments
- has_one    :likes


## comments テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| text          | text       | null: false       |
| post_id       | references | foreign_key: true |
| user_id       | references | foreign_key: true |

### Association
- belongs_to :post
- belongs_to :user


## likes テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| post_id        | references | foreign_key: true |
| user_id        | references | foreign_key: true |

### Association
- belongs_to :post
- belongs_to :user
