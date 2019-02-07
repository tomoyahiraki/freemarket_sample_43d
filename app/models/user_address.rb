class UserAddress < ApplicationRecord
  has_one :user, dependent: destroy
  belongs_to :area
end
