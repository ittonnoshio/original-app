# テーブル設計

## usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

### Association
- has_many :posts
- has_many :favorites

## postsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| category_id     | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :favorites

## favoritesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| post            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :post

## relationshipsテーブル

| Column          | Type    | Options                           |
| --------------- | ------- | --------------------------------- |
| user_id         | integer | foreign_key: true                 |
| follow_id       | integer | foreign_key: { to_table: :users } |

### Association

- belongs_to :user
- belongs_to :follow, class_name: 'User'