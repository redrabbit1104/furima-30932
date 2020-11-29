# テーブル設計

![furimaのER図](https://gyazo.com/0026c3fdeeb738a9d84ee895e4ae4a42)

## users テーブル

| Column          | Type   | Options 	   |
| :-------------- | :----- | :----------- |
| nickname        | string | null: false  |
| email           | string | null: false  |
| last_name       | string | null: false  |
| first_name      | string | null: false  |
| last_name_kana  | string | null: false  |
| first_name_kana | string | null: false  |
| birthday		   | date  | null: false  |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type  		 | Options 	        |
| :------------ | :------------ | :--------------- |
| image         | text 		     | null: false      |
| item_name     | string  		 | null: false      |
| item_info     | text   		 | null: false      |
| item_category | string        | null: false      |
| item_status   | string        | null: false      |
| shipping_fee  | string        | null: false      |
| ship_from     | string        | null: false      |
| date_to_ship  | integer		 | null: false      |
| price         | integer       | null: false      |
| user          | references    | foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column         | Type  		    | Options 	        |
| :------------- | :----------- | :---------------- |
| user           | references   | foreign_key: true |
| item           | references   | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column         | Type  		 | Options 	         |
| :------------- | :----------- | :---------------- |
| zip_code       | string  		 | null: false       |
| ship_to        | integer      | null: false       |
| city           | string       | null: false       |
| address        | string       | null: false       |
| building       | string       | null: false       |
| tel            | string       | null: false       |

### Association

- belongs_to :order


