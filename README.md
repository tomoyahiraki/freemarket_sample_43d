# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...





## user_addressテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false, foreign_key: true|
|profecture|integer|null: false, foreign_key: true|
|city_name|string|null: false, foreign_key: true|
|city_number|string|null: false, foreign_key: true|
|building|string|null: false, foreign_key: true|

### Association
- has_one :user_address, dependent: destroy








## usersテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|kana_name|string|null: false|
|telphone_number|integer|null: false, unique: true|
|mail_number|string|null: false, unique: true|
|password|string|null: false|
|birth|integer|null: false|
|proceed|integer||
|provider|string|
|uid|string|
<!-- provider, uidは各アプリへの認証の為 -->


## Association
- has_many :favorites
- has_many :products
- has_many :products, through: :favorites






## productsテーブル

|Column|Type|Options|
|------|----|-------|
|body|text||
|title|string|null: false, foreign_key: true|
|valuation|integer|foreign_keyr|
|product_old|integer|null: false, foreign_key: true|
|delivery_fee|integer|null: false, foreign_key: true|
|area|string|null: false, foreign_key: true|
|shipment|integer|null: false, foreign_key: true|
|price|integer|null: false, foreign_key: true|
|product_introduce|text|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|
|product_state|integer|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :size
- belongs_to :category
- has_many   :images
- has_many   :favorites
- has_many   :users, through: :favorites






## favoriteテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|product_id|integer|foreign_key: true|


## Association
- belongs_to :product
- belongs_to :user








## imageテーブル
|Column|Type|Options|
|------|----|-------|
|image_url|string|foreign_key: true|


## Association
- belongs_to :product





## brandテーブル
|Column|Type|Options|
|------|----|-------|
|brand_name|string|foreign_key: true|


## Association
- has_many :products





## sizeテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, foreign_key: true|



## Association
- has_many :products




## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, foreign_key: true|
|parent_id|integer|null: false, foreign_key: true|

## Association
- has_many :products

