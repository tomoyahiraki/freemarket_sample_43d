class Usertest < ApplicationRecord
  has_many :products
  has_many :buy
  belongs_to :birth_year
  belongs_to :birth_month
  belongs_to :birth_day
end
