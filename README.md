
# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |
| telephone          | string | null: false               |

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| name               | string      | null: false                    |
| explanation        | string      | null: false                    |
| category           | string      | null: false                    |
| condition          | string      | null: false                    |
| shipping_charge    | string      | null: false                    |
| shipping_area      | string      | null: false                    |
| price              | string      | null: false                    |
| user               | references  | null: false, foreign_key: true |

### Association

- has_many   :comments
- has_one    :purchase
- belongs_to :user

## comments テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| text               | string      | null: false                    |
| item               | references  | null: false, foreign_key: true |
| user               | references  | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## purchases テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| name               | string      | null: false                    |
| product            | string      | null: false                    |
| item               | references  | null: false, foreign_key: true |
| user               | references  | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
- has_one    :address

## addresses テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| post_number        | string      | null: false                    |
| prefecture         | string      | null: false                    |
| city               | string      | null: false                    |
| house_number       | string      | null: false                    |
| building           | string      | null: false                    |
| telephone          | string      | null: false                    |
| purchase           | references  | null: false, foreign_key: true |

### Association

- belongs_to :purchase

