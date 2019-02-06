class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.integer :user_id, foreign_key: true
      t.integer :product_id, foreign_key: true

      t.timestamps
    end
  end
end
