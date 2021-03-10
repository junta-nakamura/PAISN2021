## users テーブル

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| email                  | text       | null: false |
| encrypted_password     | string     | null: false |
| nickname               | string     | null: false |
| last_name              | string     | null: false |
| first_name             | string     | null: false |
| last_name_kana         | string     | null: false |
| first_name_kana        | string     | null: false |
| birthday               | date       | null: false |
| industry_id            | integer    | null: false |
| occupation_id          | integer    | null: false |
| working_period_id      | integer    | null: false |
| position_id            | integer    | null: false |
| number_of_employees_id | integer    | null: false |
| gender_id              | integer    | null: false |
| age_id                 | integer    | null: false |

### Association

- has_many :experiences
- has_many :messages
- has_many :deals
- has_many :favorites
- has_many :room_users
- has_many :rooms, through: room_users





## experiences テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| industry_id            | integer    | null: false                    |
| occupation_id          | integer    | null: false                    |
| working_period_id      | integer    | null: false                    |
| position_id            | integer    | null: false                    |
| number_of_employees_id | integer    | null: false                    |
| experience_title       | string     | null: false                    |
| experience_catch_copy  | string     | null: false                    |
| experience_detail      | text       | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :deals
- has_many :meetings
- has_many :favorites





## deals テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| experience | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :experience





## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages





## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :room





## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room





## meetings テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| experience | references | null: false, foreign_key: true |
| room       | references | null: false, foreign_key: true |

### Association

- belongs_to :experience
- belongs_to :room





## favorites テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| experience | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :experience




