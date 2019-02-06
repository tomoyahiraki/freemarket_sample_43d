class User < ApplicationRecord
  has_many :products
  has_many :buys
  has_many :favorites
  belongs_to :birth_year
  belongs_to :birth_month
  belongs_to :birth_day
end
