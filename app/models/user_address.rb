class UserAddress < ApplicationRecord
  has_one :user, dependent: destroy
end
