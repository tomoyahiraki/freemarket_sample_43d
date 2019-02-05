class Product < ApplicationRecord
  belongs_to :user
  belongs_to :brand
  belongs_to :size
  belongs_to :category
  belongs_to :area
  belongs_to :product_old
  belongs_to :shipment
  belongs_to :product_state
  belongs_to :delivery_day
  belongs_to :category
  has_many   :images
  has_many   :buys
end
