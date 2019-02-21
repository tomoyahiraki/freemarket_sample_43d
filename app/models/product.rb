class Product < ApplicationRecord
  MAX_IMAGE_CREATE_LENGTH = 100

  belongs_to :user
  belongs_to :brand
  belongs_to :size
  belongs_to :category
  belongs_to :area
  belongs_to :product_old
  belongs_to :shipment
  belongs_to :product_state
  belongs_to :deliveryday
  belongs_to :deliveryfee
  belongs_to :category
  has_many   :images
  has_many   :buys
  has_many :favorites

  validates :images, length: {maximum: MAX_IMAGE_CREATE_LENGTH}
  accepts_nested_attributes_for :images
end
