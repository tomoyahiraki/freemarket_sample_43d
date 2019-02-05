class CreateBuys < ActiveRecord::Migration[5.0]
  def change
    create_table :buys do |t|
      t.integer :product_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
