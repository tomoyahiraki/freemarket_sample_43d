class Product < ApplicationRecord
  belongs_to :user
  belongs_to :brand
  belongs_to :size
  belongs_to :category
  has_many   :images
end
