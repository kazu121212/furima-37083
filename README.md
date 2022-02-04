
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

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| name               | string      | null: false                    |
| explanation        | text        | null: false                    |
| category_id        | integer     | null: false                    |
| condition_id       | integer     | null: false                    |
| shipping_charge_id | integer     | null: false                    |
| shipping_area_id   | integer     | null: false                    |
| shipping_day_id    | integer     | null: false                    |
| price              | integer     | null: false                    |
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
| prefecture_id      | string      | null: false                    |
| city               | string      | null: false                    |
| house_number       | string      | null: false                    |
| building           | string      |                                |
| telephone          | string      | null: false                    |
| purchase           | references  | null: false, foreign_key: true |

### Association

- belongs_to :purchase

