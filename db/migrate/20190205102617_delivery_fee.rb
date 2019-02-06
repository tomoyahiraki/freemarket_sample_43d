class DeliveryFee < ActiveRecord::Migration[5.0]
  def change
    drop_table :delivery_fees
    drop_table :delivery_days
  end
end
