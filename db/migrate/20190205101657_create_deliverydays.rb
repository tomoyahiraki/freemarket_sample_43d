class CreateDeliverydays < ActiveRecord::Migration[5.0]
  def change
    create_table :deliverydays do |t|
      t.string :name
      t.timestamps
    end
  end
end
