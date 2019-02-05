class CreateDeliveryFees < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_fees do |t|
      t.string :name
      t.timestamps
    end
  end
end
