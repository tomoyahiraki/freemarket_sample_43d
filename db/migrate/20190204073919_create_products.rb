class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.integer :product_old, null: false
      t.integer :delivery_fee, null: false
      t.string :area, null: false
      t.integer :shipment, null: false
      t.integer :price, null: false
      t.text :product_introduce
      t.integer :buyer_id, foreign_key: true
      t.integer :product_state, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.integer :brand_id, null: false, foreign_key: true
      t.integer :size_id, null: false, foreign_key: true
      t.integer :category_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
