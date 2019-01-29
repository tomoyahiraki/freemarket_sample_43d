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
|postal_code|integer|null: false|
|profecture|integer|null: false|
|city_name|string|null: false|
|city_number|string|null: false|
|building|string|null: false|

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
|provider|string||
|uid|string||
<!-- provider, uidは各アプリへの認証の為 -->


## Association
- has_many :products






## productsテーブル

|Column|Type|Options|
|------|----|-------|
|body|text||
|title|string|null: false|
|product_old|integer|null: false|
|delivery_fee|integer|null: false|
|area|string|null: false|
|shipment|integer|null: false|
|price|integer|null: false|
|product_introduce|text|
|buyer_id|integer|null: false, foreign_key: true|
|product_state|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
|size_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :size
- belongs_to :category
- has_many   :images






## imageテーブル
|Column|Type|Options|
|------|----|-------|
|image_url|string|foreign_key: true|
|product_id|integer|foreign_key: true|


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

