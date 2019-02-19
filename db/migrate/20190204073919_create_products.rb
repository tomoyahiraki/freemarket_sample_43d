class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.integer :product_old_id, null: false, foreign_key: true
      t.integer :deliveryfee_id, null: false, foreign_key: true
      t.integer :area_id, null: false, foreign_key: true
      t.integer :shipment_id, null: false, foreign_key: true
      t.integer :price, null: false
      t.text :product_introduce
      t.integer :product_state_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true
      t.integer :brand_id, foreign_key: true
      t.integer :size_id, null: false, foreign_key: true
      t.integer :category_id, null: false, foreign_key: true
      t.integer :deliveryday_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
